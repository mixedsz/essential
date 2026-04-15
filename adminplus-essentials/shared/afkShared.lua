afkConfig = {}

-- Auto AFK Kick
-- (Useful for kicking AFK players & get the queue going) -- 
afkConfig.Enable = false

afkConfig.kickWarning = true -- set if player should get a notifcation warning before getting kicked
afkConfig.secondsUntilKick = 180 -- How long they can be AFK before they get kicked in seconds
afkConfig.KickedSoonMsg = "You're being kicked in" -- set the Earlynotify text
afkConfig.Notifytreason = "For being afk too long" -- set your notify reason
afkConfig.Notifytime = 10000 -- Set how long the notify has to be displayed in miliseconds
afkConfig.PlayerDroppedmsg = "You were kicked for being afk too long!" -- Set the message players will see in the FiveM menu after getting kicked
afkConfig.EnableWarningSound = true -- set to true or to false to disable/enable a warningsound 