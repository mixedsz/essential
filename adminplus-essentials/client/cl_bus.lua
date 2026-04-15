-- ============================================================
-- cl_bus.lua | AdminPlus Essentials
-- Bus stop system — players interact with bus stop props via
-- ox_target and are teleported to another stop after paying.
-- Supports ESX and QB frameworks.
-- ============================================================

if not busConfig.Enable then return end

-- ── Globals ──────────────────────────────────────────────────
ESX      = nil
QBCore   = nil
local framework    = nil   -- "ESX" or "QB" detected at runtime
local playerData   = nil   -- cached player data (job, etc.)
local targetExport = nil   -- "qtarget" (ESX) or "qb-target" (QB)

-- ── Framework detection ───────────────────────────────────────
CreateThread(function()
    if framework then return end

    if GetResourceState("es_extended") == "started" then
        framework = "ESX"
    elseif GetResourceState("crm-core") == "started" then
        framework = "ESX"
    elseif GetResourceState("qb-core") == "started" then
        framework = "QB"
    end

    if not framework then
        print("[AdminPlus | Bus] ERROR: No supported framework found (ESX / QB).")
        return
    end

    if framework == "ESX" then
        local esxExport = exports[frameworkConfig.FrameworkExport]
        ESX        = esxExport:getSharedObject()
        playerData = ESX.GetPlayerData()

        -- Wait until job data is available
        while not (playerData and playerData.job) do
            Wait(100)
            playerData = ESX.GetPlayerData()
        end

        -- Keep playerData.job in sync
        RegisterNetEvent("esx:setJob")
        AddEventHandler("esx:setJob", function(job)
            playerData.job = job
        end)

    elseif framework == "QB" then
        QBCore    = exports["qb-core"]:GetCoreObject()
        playerData = QBCore.Functions.GetPlayerData()

        RegisterNetEvent("QBCore:Client:OnJobUpdate")
        AddEventHandler("QBCore:Client:OnJobUpdate", function(job)
            playerData.job = job
        end)
    end
end)

-- ── Resolve target export name after framework is known ───────
CreateThread(function()
    while not framework do Wait(500) end

    if framework == "ESX" then
        targetExport = "qtarget"
    else
        targetExport = "qb-target"
    end
end)

-- ── Helper: teleport player to stop coords ────────────────────
local function doTeleport(stopCoords, stopHeading)
    local ped = cache.ped

    -- Ensure collision is loaded at the destination
    RequestCollisionAtCoord(stopCoords.x, stopCoords.y, stopCoords.z)
    while not HasCollisionLoadedAroundEntity(ped) do
        Wait(0)
    end

    -- Fade out
    DoScreenFadeOut(3000)

    -- Wait for progress bar / simple wait
    if busConfig.OxLibProgress then
        while not IsScreenFadedOut() do
            ProgressBar()
        end
    else
        while not IsScreenFadedOut() do
            Wait(busConfig.TeleportTime)
        end
    end

    -- Teleport
    SetEntityCoords(ped, stopCoords.x, stopCoords.y, stopCoords.z, false, false, false, false)
    SetEntityHeading(ped, stopHeading or 0.0)
    ClearPedTasksImmediately(PlayerPedId())

    -- Fade back in
    DoScreenFadeIn(1500)
end

-- ── Event: go to a specific bus stop ─────────────────────────
AddEventHandler("adminplus_busstop:goToStop", function(data)
    local busKey  = data.bus
    local stopKey = data.stop

    local stopData   = busConfig.BusStops[busKey][stopKey]
    local stopCoords = stopData.coords
    local stopHeading = stopData.heading

    if framework == "ESX" then
        ESX.TriggerServerCallback("adminplus_bus:checkMoney", function(hasMoney)
            if hasMoney then
                doTeleport(stopCoords, stopHeading)
            end
        end)
    elseif framework == "QB" then
        QBCore.Functions.TriggerCallback("adminplus_bus:checkMoneyqb", function(hasMoney)
            if hasMoney then
                doTeleport(stopCoords, stopHeading)
            end
        end)
    end
end)

-- ── Event: player does not meet job group requirement ─────────
AddEventHandler("adminplus_busstop:noAccess", function()
    lib.notify({
        title       = busConfig.Text.NoAccessTitle,
        description = busConfig.Text.NoAccessDescription,
        type        = "error",
    })
end)

-- ── Event: open the bus stop destination menu ─────────────────
AddEventHandler("adminplus_busstop:openMenu", function(data)
    local busKey     = data.bus
    local currentStop = data.stop
    local allStops   = busConfig.BusStops[busKey]
    local menuOptions = {}

    for stopKey, stopData in pairs(allStops) do
        if stopKey == currentStop then
            -- Mark the current stop
            table.insert(menuOptions, {
                title       = stopData.title .. " (Current)",
                description = stopData.description,
                event       = "",
            })
        else
            -- Check group restriction
            if stopData.groups then
                local hasAccess = false
                for _, group in ipairs(stopData.groups) do
                    if playerData.job.name == group then
                        hasAccess = true
                        break
                    end
                end

                if hasAccess then
                    table.insert(menuOptions, {
                        title       = stopData.title,
                        description = stopData.description,
                        event       = "adminplus_busstop:goToStop",
                        args        = { bus = busKey, stop = stopKey },
                    })
                else
                    table.insert(menuOptions, {
                        title       = stopData.title,
                        description = stopData.description,
                        event       = "adminplus_busstop:noAccess",
                    })
                end
            else
                -- No group restriction — open to all
                table.insert(menuOptions, {
                    title       = stopData.title,
                    description = stopData.description,
                    event       = "adminplus_busstop:goToStop",
                    args        = { bus = busKey, stop = stopKey },
                })
            end
        end
    end

    -- Register and open the ox_lib context menu
    lib.registerContext({
        id      = "bus_menu",
        title   = "Bus Stops",
        options = menuOptions,
    })
    lib.showContext("bus_menu")
end)

-- ── Register ox_target interactions on bus stop prop models ───
-- Model hashes: bus shelter / stop sign models
local busModels = { 1888204845, 2142033519, 1681727376 }

for busKey, _ in pairs(busConfig.BusStops) do
    exports.ox_target:addModel(busModels, {
        {
            event   = "adminplus_busstop:openMenu",
            icon    = "fa-solid fa-hand",
            label   = busConfig.Text.Interact,
            items   = { busConfig.Item },
            bus     = busKey,
        },
    })
end