-- ============================================================
-- cl_discord.lua | AdminPlus Essentials
-- Discord Rich Presence — shows player activity, street name,
-- vehicle info, queue size, and player count in their Discord
-- status. Supports vQueue / n4Queue / character names / no queue.
-- ============================================================

if not queueConfig.Enable then return end

-- ── Locals ───────────────────────────────────────────────────
local presenceInterval = queueConfig.Discord.DiscordPresence
local appID            = queueConfig.Discord.ApplicationID
local assetLarge       = queueConfig.Discord.Asset
local serverMessage    = queueConfig.Message

local queueSize        = 0      -- updated via server net event
local characterName    = ""     -- updated via server net event
local serverPlayers    = {}     -- updated via server net event

-- ── SetRP: configure Discord application and assets ──────────
local function SetRP()
    SetDiscordAppId(appID)
    SetDiscordRichPresenceAsset(assetLarge)
    SetDiscordRichPresenceAssetText(queueConfig.Discord.SetDiscordRichPresenceAssetText)
    SetDiscordRichPresenceAssetSmall(queueConfig.Discord.SetDiscordRichPresenceAssetSmall)
    SetDiscordRichPresenceAssetSmallText(queueConfig.Discord.SetDiscordRichPresenceAssetSmallText)
    SetDiscordRichPresenceAction(0,
        queueConfig.Discord.SetDiscordRichPresenceAction,
        queueConfig.Discord.SetDiscordRichPresenceActionText)
    SetDiscordRichPresenceAction(1,
        queueConfig.Discord.SetDiscordRichPresenceAction2,
        queueConfig.Discord.SetDiscordRichPresenceActionText2)
end

-- ── Server → Client: queue size ──────────────────────────────
RegisterNetEvent("k3ap_pr:setQueueSize")
AddEventHandler("k3ap_pr:setQueueSize", function(size)
    queueSize = size
end)

-- ── Server → Client: character name ──────────────────────────
RegisterNetEvent("k3ap_pr:setPlayerName")
AddEventHandler("k3ap_pr:setPlayerName", function(name)
    characterName = name
end)

-- ── Server → Client: online player list ──────────────────────
RegisterNetEvent("k3ap_pr:updatePlayers")
AddEventHandler("k3ap_pr:updatePlayers", function(players)
    serverPlayers = players
end)

-- ── Exported getter used by RP thread ────────────────────────
function GetServerPlayers()
    return serverPlayers
end

-- ── Polling thread: request data from server periodically ────
Citizen.CreateThread(function()
    while true do
        TriggerServerEvent("k3ap_pr:requestPlayerName")

        if queueConfig.vQueue or queueConfig.n4Queue then
            TriggerServerEvent("k3ap_pr:requestQueueSize")
        end

        Citizen.Wait(queueConfig.Discord.UpdateQueueSizeInDiscordPresence)
    end
end)

-- ── Framework: request player list on spawn ──────────────────
if frameworkConfig.Framework == "ESX" then
    RegisterNetEvent("esx:playerLoaded")
    AddEventHandler("esx:playerLoaded", function()
        TriggerServerEvent("k3ap_pr:updatePlayersRequest")
    end)
elseif frameworkConfig.Framework == "QB" then
    RegisterNetEvent("QBCore:Client:OnPlayerLoaded")
    AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
        TriggerServerEvent("k3ap_pr:updatePlayersRequest")
    end)
else
    print("[AdminPlus | Discord] WARNING: No Framework detected.")
end

-- ── Helpers ──────────────────────────────────────────────────

--- Returns the current player count from the cached list (0 if unknown)
local function getPlayerCount()
    local list = GetServerPlayers()
    if list and #list then return #list end
    return 0
end

--- Builds the "Players: X/MAX | Queue Size: Y" suffix
local function buildSuffix(playerCount)
    return "\n\n Players: " .. playerCount .. "/" .. queueConfig.Discord.MaxPlayers
        .. " | Queue Size: " .. queueSize
end

--- Builds the "Players: X/MAX - ID: Z" suffix (no-queue variant)
local function buildSuffixID(playerCount, serverId)
    return "\n\n Players: " .. playerCount .. "/" .. queueConfig.Discord.MaxPlayers
        .. " - ID: " .. serverId
end

-- ── Core presence setter ──────────────────────────────────────
--- Determines what the player is doing and calls SetRichPresence.
--- @param namePrefix  string  e.g. "" or "CharacterName "
--- @param nameSuffix  string  e.g. buildSuffix(n) or buildSuffixID(n,id)
local function updatePresence(namePrefix, suffix)
    -- ── On foot ───────────────────────────────────────────────
    if IsPedOnFoot(PlayerPedId()) then
        if IsEntityInWater(PlayerPedId()) then
            SetRichPresence("\227\128\161 " .. namePrefix .. "is swimming around." .. suffix)
            return
        end

        -- Inside the panic-zone bounding box (Cayo / restricted area)
        if IsEntityInArea(PlayerPedId(), 2631.851, 2572.982, 45.096, -2449.445, 711.613, 264.987, false, false, 0) then
            -- Player is running scared
            if IsPedRunning(PlayerPedId()) or GetEntitySpeed(PlayerPedId()) > 2.0 then
                SetRichPresence("\227\128\161 " .. namePrefix .. "is running afraid near " .. StreetName .. suffix)
            elseif GetEntitySpeed(PlayerPedId()) > 1.0 and GetEntitySpeed(PlayerPedId()) < 2.0 then
                SetRichPresence("\227\128\161 " .. namePrefix .. "is exploring around " .. StreetName .. suffix)
            else
                SetRichPresence("\227\128\161 " .. namePrefix .. "is resting near " .. StreetName .. suffix)
            end
            return
        end

        -- Normal foot movement
        if IsPedSprinting(PlayerPedId()) then
            SetRichPresence("\227\128\161 " .. namePrefix .. "is sprinting down " .. StreetName .. suffix)
        elseif IsPedRunning(PlayerPedId()) then
            SetRichPresence("\227\128\161 " .. namePrefix .. "is running down " .. StreetName .. suffix)
        elseif IsPedWalking(PlayerPedId()) then
            SetRichPresence("\227\128\161 " .. namePrefix .. "is walking down " .. StreetName .. suffix)
        elseif IsPedStill(PlayerPedId()) then
            SetRichPresence("\227\128\161 " .. namePrefix .. "is standing on " .. StreetName .. suffix)
        end
        return
    end

    -- ── In vehicle ────────────────────────────────────────────
    if IsPedInAnyVehicle(PlayerPedId(), false) then

        -- ── Aircraft (heli / plane) ───────────────────────────
        if IsPedInAnyHeli(PlayerPedId()) or IsPedInAnyPlane(PlayerPedId()) then
            local vehicle   = GetVehiclePedIsUsing(PlayerPedId())
            local speedKnots = math.ceil(GetEntitySpeed(vehicle) * 1.9438444924406046)
            local modelName  = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
            local inAir      = IsEntityInAir(vehicle)
            local altAGL     = GetEntityHeightAboveGround(vehicle)

            if inAir and altAGL > 25.0 and speedKnots > 90 then
                SetRichPresence("\227\128\161 " .. namePrefix .. "flying over " .. StreetName .. " in a " .. modelName .. suffix)
            elseif inAir and altAGL <= 25.0 and speedKnots < 90 and speedKnots > 40 then
                if GetLandingGearState(GetVehiclePedIsIn(PlayerPedId(), false)) == 0 then
                    SetRichPresence("\227\128\161 " .. namePrefix .. "landing at " .. StreetName .. " in a " .. modelName .. suffix)
                end
            elseif not inAir and altAGL <= 25.0 and speedKnots >= 90 and speedKnots < 120 then
                if GetLandingGearState(GetVehiclePedIsIn(PlayerPedId(), false)) == 0 then
                    SetRichPresence("\227\128\161 " .. namePrefix .. "taking off at " .. StreetName .. " in a " .. modelName .. suffix)
                end
            else
                SetRichPresence("\227\128\161 " .. namePrefix .. "landed at " .. StreetName .. " in a " .. modelName .. suffix)
            end
            return
        end

        -- ── Swimming / Sub / Boat ─────────────────────────────
        if IsEntityInWater(PlayerPedId()) then
            SetRichPresence("\227\128\161 " .. namePrefix .. "is swimming around." .. suffix)
            return
        end

        if IsPedInAnyBoat(PlayerPedId()) then
            local vehicle   = GetVehiclePedIsUsing(PlayerPedId())
            if IsEntityInWater(vehicle) then
                local modelName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
                SetRichPresence("\227\128\161 " .. namePrefix .. "is sailing around in a " .. modelName .. suffix)
            end
            return
        end

        if IsPedInAnySub(PlayerPedId()) then
            local vehicle = GetVehiclePedIsUsing(PlayerPedId())
            if IsEntityInWater(vehicle) then
                SetRichPresence("\227\128\161 " .. namePrefix .. "is in a yellow submarine." .. suffix)
            end
            return
        end

        -- ── Land vehicle ──────────────────────────────────────
        local vehicle  = GetVehiclePedIsUsing(PlayerPedId())
        local speedMph = math.ceil(GetEntitySpeed(vehicle) * 2.23693629205)
        local modelName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))

        if speedMph > 50 then
            if IsPedOnAnyBike(PlayerPedId()) then
                SetRichPresence("\227\128\161 " .. namePrefix .. "is riding near " .. StreetName .. suffix)
            else
                SetRichPresence("\227\128\161 " .. namePrefix .. "is speeding down " .. StreetName .. suffix)
            end
        elseif speedMph > 0 then
            SetRichPresence("\227\128\161 " .. namePrefix .. "is cruising down " .. StreetName .. suffix)
        else
            SetRichPresence("\227\128\161 " .. namePrefix .. "is parked on " .. StreetName .. suffix)
        end
    end
end

-- ── Main presence update loop ─────────────────────────────────
Citizen.CreateThread(function()
    SetRP()

    while true do
        -- Gather shared data
        local ped         = PlayerPedId()
        local coords      = GetEntityCoords(ped, true)
        local x, y, z    = table.unpack(coords)
        local serverId    = GetPlayerServerId(PlayerId())
        local streetHash  = GetStreetNameAtCoord(x, y, z)
        local playerCount = getPlayerCount()

        -- Update global StreetName if available
        if streetHash and streetHash ~= nil then
            StreetName = GetStreetNameFromHashKey(streetHash)
        end

        Citizen.Wait(presenceInterval)
        SetRP()

        -- ── With queue (vQueue / n4Queue) ─────────────────────
        if queueConfig.vQueue or queueConfig.n4Queue then
            local suffix

            if queueConfig.CharacterNames then
                suffix = "\n\n Players: " .. playerCount .. "/" .. queueConfig.Discord.MaxPlayers
                    .. " | Queue Size: " .. queueSize

                if queueConfig.Streetnames and streetHash and streetHash ~= nil then
                    updatePresence(characterName .. " ", suffix)
                else
                    -- No streetnames — just show character name + message
                    SetRichPresence("\227\128\161 " .. characterName .. " " .. serverMessage
                        .. "\n\n Players: " .. playerCount .. "/" .. queueConfig.Discord.MaxPlayers
                        .. " | Queue Size: " .. queueSize)
                end
            else
                -- No character names
                suffix = "\n\n Players: " .. playerCount .. "/" .. queueConfig.Discord.MaxPlayers
                    .. " | Queue Size: " .. queueSize

                if queueConfig.Streetnames and streetHash and streetHash ~= nil then
                    updatePresence("", suffix)
                else
                    SetRichPresence("\227\128\161 " .. serverMessage
                        .. "\n\n Players: " .. playerCount .. "/" .. queueConfig.Discord.MaxPlayers
                        .. " | Queue Size: " .. queueSize)
                end
            end

        -- ── No queue ──────────────────────────────────────────
        else
            local suffix

            if queueConfig.CharacterNames then
                suffix = "\n\n Players: " .. playerCount .. "/" .. queueConfig.Discord.MaxPlayers
                    .. " - ID: " .. serverId

                if queueConfig.Streetnames and streetHash and streetHash ~= nil then
                    updatePresence(characterName .. " ", suffix)
                else
                    SetRichPresence("\227\128\161 " .. characterName .. " " .. serverMessage
                        .. "\n\n Players: " .. playerCount .. "/" .. queueConfig.Discord.MaxPlayers
                        .. " - ID: " .. serverId)
                end
            else
                suffix = "\n\n Players: " .. playerCount .. "/" .. queueConfig.Discord.MaxPlayers
                    .. " - ID: " .. serverId

                if queueConfig.Streetnames and streetHash and streetHash ~= nil then
                    updatePresence("", suffix)
                else
                    SetRichPresence("\227\128\161 " .. serverMessage
                        .. "\n\n Players: " .. playerCount .. "/" .. queueConfig.Discord.MaxPlayers
                        .. " - ID: " .. serverId)
                end
            end
        end
    end
end)