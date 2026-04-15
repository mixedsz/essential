-- ============================================================
-- cl_dvall.lua | AdminPlus Essentials
-- Delete-all-vehicles command client handler.
-- Whitelisted vehicle models and player-occupied vehicles are
-- protected from deletion.
-- ============================================================

-- Register the /dvall chat suggestion regardless of enable state
TriggerEvent("chat:addSuggestion", "/dvall", "Delete all vehicles.")

if not dvallConfig.Enable then return end

local whitelistedModels = dvallConfig.WhitelistCars

-- ── Vehicle enumerator helper ─────────────────────────────────
-- Returns a coroutine-based iterator over all streamed vehicles.
local enumeratorMeta = {}
enumeratorMeta.__gc = function(self)
    if self.destructor and self.handle then
        self.destructor(self.handle)
    end
    self.destructor = nil
    self.handle     = nil
end

local function makeEnumerator(initFn, nextFn, destroyFn)
    local co = coroutine.wrap(function()
        local handle, id = initFn()

        if not id or id == 0 then
            -- Nothing found — clean up immediately
            destroyFn(handle)
            return
        end

        local obj = setmetatable({ handle = handle, destructor = destroyFn }, enumeratorMeta)
        local more = true

        repeat
            coroutine.yield(id)
            more, id = nextFn(handle)
        until not more

        obj.handle     = nil
        obj.destructor = nil
        destroyFn(handle)
    end)
    return co
end

local function EnumerateVehicles()
    return makeEnumerator(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

-- ── Net event: delete all non-whitelisted, unoccupied vehicles ─
RegisterNetEvent("k3ap:dvall")
AddEventHandler("k3ap:dvall", function()
    local deleted = 0
    local skipped = 0

    for vehicle in EnumerateVehicles() do
        -- Check whitelist
        local isWhitelisted = false
        for _, modelName in pairs(whitelistedModels) do
            if GetEntityModel(vehicle) == GetHashKey(modelName) then
                isWhitelisted = true
                break
            end
        end

        -- Check if a player is in the driver seat
        local driverPed    = GetPedInVehicleSeat(vehicle, -1)
        local hasPlayerIn  = IsPedAPlayer(driverPed)

        if not isWhitelisted and not hasPlayerIn then
            SetEntityAsMissionEntity(vehicle, false, false)
            DeleteEntity(vehicle)
            deleted = deleted + 1
        else
            skipped = skipped + 1
        end
    end

    print(("[AdminPlus | DVALL] Deleted %d vehicles, skipped %d (whitelisted or occupied)."):format(deleted, skipped))
end)