-- ============================================================
-- sv_discord.lua | AdminPlus Essentials
-- Handles server-side events for Discord Rich Presence:
--   • Broadcasts online player count to requesting clients
--   • Provides character names (ESX / QB)
--   • Bridges queue size from vQueue / n4Queue if enabled
-- ============================================================

if not queueConfig.Enable then return end

-- ── Player count broadcast ────────────────────────────────────
-- Called by a client when they spawn / request an update
RegisterNetEvent("k3ap_pr:updatePlayersRequest")
AddEventHandler("k3ap_pr:updatePlayersRequest", function()
    local players = GetPlayers()
    TriggerClientEvent("k3ap_pr:updatePlayers", source, players)
end)

-- Periodically broadcast to everyone so the count stays fresh
CreateThread(function()
    while true do
        Wait(30000)
        local players = GetPlayers()
        TriggerClientEvent("k3ap_pr:updatePlayers", -1, players)
    end
end)

-- ── Character / player name ───────────────────────────────────
RegisterNetEvent("k3ap_pr:requestPlayerName")
AddEventHandler("k3ap_pr:requestPlayerName", function()
    local src = source

    if frameworkConfig.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer then
            local firstName = xPlayer.get("firstName") or ""
            local lastName  = xPlayer.get("lastName")  or ""
            local charName  = (firstName .. " " .. lastName):gsub("^%s+", ""):gsub("%s+$", "")
            TriggerClientEvent("k3ap_pr:setPlayerName", src, charName ~= "" and charName or GetPlayerName(src))
        else
            TriggerClientEvent("k3ap_pr:setPlayerName", src, GetPlayerName(src))
        end

    elseif frameworkConfig.Framework == "QB" then
        local Player = QBCore.Functions.GetPlayer(src)
        if Player then
            local charInfo  = Player.PlayerData.charinfo
            local charName  = (charInfo.firstname or "") .. " " .. (charInfo.lastname or "")
            TriggerClientEvent("k3ap_pr:setPlayerName", src, charName)
        else
            TriggerClientEvent("k3ap_pr:setPlayerName", src, GetPlayerName(src))
        end

    else
        TriggerClientEvent("k3ap_pr:setPlayerName", src, GetPlayerName(src))
    end
end)

-- ── Queue size (vQueue) ───────────────────────────────────────
if queueConfig.vQueue then
    RegisterNetEvent("k3ap_pr:requestQueueSize")
    AddEventHandler("k3ap_pr:requestQueueSize", function()
        local src   = source
        local size  = 0

        -- vQueue exposes a global or export
        local ok, result = pcall(function()
            return exports["vMenu"]:GetQueueCount() -- fallback; override below if needed
        end)

        if not ok then
            -- Try reading from vQueue directly
            ok, result = pcall(function()
                return exports["vqueue"]:getQueueCount()
            end)
        end

        if ok and result then size = result end
        TriggerClientEvent("k3ap_pr:setQueueSize", src, size)
    end)
end

-- ── Queue size (n4Queue / nukac) ──────────────────────────────
if queueConfig.n4Queue then
    RegisterNetEvent("k3ap_pr:requestQueueSize")
    AddEventHandler("k3ap_pr:requestQueueSize", function()
        local src  = source
        local size = 0

        local ok, result = pcall(function()
            return exports["nukac_queue"]:getQueueCount()
        end)

        if ok and result then size = result end
        TriggerClientEvent("k3ap_pr:setQueueSize", src, size)
    end)
end
