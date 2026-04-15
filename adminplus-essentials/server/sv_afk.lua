-- ============================================================
-- sv_afk.lua | AdminPlus Essentials
-- Handles the server-side kick when a player exceeds the AFK
-- time limit. The client fires BSC:AntiAFK:kick after counting
-- down to zero with no position change.
-- ============================================================

if not afkConfig.Enable then return end

RegisterNetEvent("BSC:AntiAFK:kick")
AddEventHandler("BSC:AntiAFK:kick", function()
    local src    = source
    local name   = GetPlayerName(src)
    local reason = afkConfig.PlayerDroppedmsg

    print(("[AdminPlus | AFK] Kicking player %s (%d) for AFK."):format(name, src))
    DropPlayer(src, reason)
end)
