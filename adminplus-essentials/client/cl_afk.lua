-- ============================================================
-- cl_afk.lua | AdminPlus Essentials
-- Anti-AFK client handler
-- Tracks player position every second and kicks if idle too long
-- ============================================================

if not afkConfig.Enable then return end

Citizen.CreateThread(function()
    while true do
        Wait(1000)

        local ped = PlayerPedId()
        if not ped then goto continue end

        local currentPos = GetEntityCoords(ped, true)

        if prevPos then
            -- Player has not moved
            if currentPos == prevPos then
                if timeLeft > 0 then
                    -- Send warning notification when at the 1/4 mark remaining
                    if afkConfig.kickWarning then
                        local warnAt = math.ceil(afkConfig.secondsUntilKick / 4)
                        if timeLeft == warnAt then
                            -- Play warning sound if enabled
                            if afkConfig.EnableWarningSound then
                                PlaySoundFrontend(-1, "BASE_JUMP_PASSED", "HUD_AWARDS", 0, 1)
                            end

                            -- Framework-specific notification
                            if frameworkConfig.Framework == "ESX" then
                                lib.notify({
                                    title = "AFK Warning",
                                    description = afkConfig.KickedSoonMsg
                                        .. " " .. timeLeft .. " seconds"
                                        .. " (" .. afkConfig.Notifytreason .. ")",
                                    duration  = afkConfig.Notifytime,
                                    position  = "top",
                                    style     = { backgroundColor = "#141517", color = "#909296" },
                                    icon      = "ban",
                                    iconColor = "#C53030",
                                })
                            elseif frameworkConfig.Framework == "QB" then
                                TriggerEvent("qb:sendNotification", {
                                    text    = afkConfig.KickedSoonMsg
                                        .. " " .. timeLeft .. " seconds"
                                        .. " (" .. afkConfig.Notifytreason .. ")",
                                    type    = "warning",
                                    timeout = afkConfig.Notifytime,
                                    layout  = "centerLeft",
                                    queue   = "left",
                                })
                            end
                        end
                    end

                    -- Count down
                    timeLeft = timeLeft - 1
                else
                    -- Time's up — kick the player via server event
                    TriggerServerEvent("BSC:AntiAFK:kick")
                end
            else
                -- Player moved — reset the timer
                timeLeft = afkConfig.secondsUntilKick
            end
        else
            -- First tick — no previous position stored yet, initialise timer
            timeLeft = afkConfig.secondsUntilKick
        end

        -- Store position for next comparison
        prevPos = currentPos

        ::continue::
    end
end)