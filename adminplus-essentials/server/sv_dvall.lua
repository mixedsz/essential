-- ============================================================
-- sv_dvall.lua | AdminPlus Essentials
-- Server-side /dvall command handler.
-- Checks the player's admin group before firing the client event
-- and sends a Discord webhook log.
-- ============================================================

if not dvallConfig.Enable then return end

-- ── Discord webhook helper ────────────────────────────────────
local function sendWebhook(playerName, serverId)
    if not dvallConfig.Webhook or dvallConfig.Webhook == "" then return end

    local payload = {
        username   = dvallConfig.DiscordName,
        avatar_url = dvallConfig.DiscordImage,
        embeds     = {
            {
                title       = "🗑️ DVALL Executed",
                color       = 16711680, -- red
                description = ("**Player:** %s\n**Server ID:** %d"):format(playerName, serverId),
                footer      = { text = "AdminPlus | DVALL" },
                timestamp   = os.date("!%Y-%m-%dT%H:%M:%SZ"),
            },
        },
    }

    PerformHttpRequest(dvallConfig.Webhook, function(statusCode, responseText, headers)
        if statusCode ~= 204 and statusCode ~= 200 then
            print(("[AdminPlus | DVALL] Webhook failed. Status: %d, Response: %s"):format(statusCode, tostring(responseText)))
        end
    end, "POST", json.encode(payload), { ["Content-Type"] = "application/json" })
end

-- ── Helper: check if source has an allowed admin group ────────
local function isAdmin(src)
    if frameworkConfig.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(src)
        if not xPlayer then return false end

        local group = xPlayer.getGroup()
        for _, adminGroup in ipairs(dvallConfig.AdminGroups) do
            if group == adminGroup then return true end
        end

    elseif frameworkConfig.Framework == "QB" then
        local Player = QBCore.Functions.GetPlayer(src)
        if not Player then return false end

        local group = Player.PlayerData.group or ""
        for _, adminGroup in ipairs(dvallConfig.AdminGroups) do
            if group == adminGroup then return true end
        end
    end

    return false
end

-- ── Command registration ──────────────────────────────────────
RegisterCommand(dvallConfig.Command, function(source, args, rawCommand)
    local src  = source
    local name = GetPlayerName(src) or "Unknown"

    if not isAdmin(src) then
        print(("[AdminPlus | DVALL] Player %s (%d) tried /dvall without permission."):format(name, src))
        TriggerClientEvent("chat:addMessage", src, {
            color   = { 255, 0, 0 },
            multiline = true,
            args    = { "DVALL", "You do not have permission to use this command." },
        })
        return
    end

    print(("[AdminPlus | DVALL] %s (%d) executed /dvall."):format(name, src))

    -- Fire the delete event on all clients (each client deletes vehicles in its scope)
    TriggerClientEvent("k3ap:dvall", -1)

    -- Log to Discord
    sendWebhook(name, src)

    -- Confirm to admin
    TriggerClientEvent("chat:addMessage", src, {
        color     = { 0, 255, 0 },
        multiline = true,
        args      = { "DVALL", "All eligible vehicles have been deleted." },
    })
end, false)
