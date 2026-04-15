local L0_1, L1_1
L0_1 = afkConfig
L0_1 = L0_1.Enable
if L0_1 then
  L0_1 = Citizen
  L0_1 = L0_1.CreateThread
  function L1_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
    while true do
      L0_2 = Wait
      L1_2 = 1000
      L0_2(L1_2)
      L0_2 = PlayerPedId
      L0_2 = L0_2()
      if L0_2 then
        L1_2 = GetEntityCoords
        L2_2 = L0_2
        L3_2 = true
        L1_2 = L1_2(L2_2, L3_2)
        L2_2 = prevPos
        if L2_2 then
          L2_2 = prevPos
          if L1_2 == L2_2 then
            L2_2 = timeLeft
            if L2_2 > 0 then
              L2_2 = afkConfig
              L2_2 = L2_2.kickWarning
              if L2_2 then
                L2_2 = timeLeft
                L3_2 = math
                L3_2 = L3_2.ceil
                L4_2 = afkConfig
                L4_2 = L4_2.secondsUntilKick
                L4_2 = L4_2 / 4
                L3_2 = L3_2(L4_2)
                if L2_2 == L3_2 then
                  L2_2 = afkConfig
                  L2_2 = L2_2.EnableWarningSound
                  if L2_2 then
                    L2_2 = PlaySoundFrontend
                    L3_2 = -1
                    L4_2 = "BASE_JUMP_PASSED"
                    L5_2 = "HUD_AWARDS"
                    L6_2 = 0
                    L7_2 = 1
                    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
                  end
                  L2_2 = frameworkConfig
                  L2_2 = L2_2.Framework
                  if "ESX" == L2_2 then
                    L2_2 = lib
                    L2_2 = L2_2.notify
                    L3_2 = {}
                    L3_2.title = "AFK Warning"
                    L4_2 = afkConfig
                    L4_2 = L4_2.KickedSoonMsg
                    L5_2 = " "
                    L6_2 = timeLeft
                    L7_2 = " seconds"
                    L8_2 = " ("
                    L9_2 = afkConfig
                    L9_2 = L9_2.Notifytreason
                    L10_2 = ")"
                    L4_2 = L4_2 .. L5_2 .. L6_2 .. L7_2 .. L8_2 .. L9_2 .. L10_2
                    L3_2.description = L4_2
                    L4_2 = afkConfig
                    L4_2 = L4_2.Notifytime
                    L3_2.duration = L4_2
                    L3_2.position = "top"
                    L4_2 = {}
                    L4_2.backgroundColor = "#141517"
                    L4_2.color = "#909296"
                    L3_2.style = L4_2
                    L3_2.icon = "ban"
                    L3_2.iconColor = "#C53030"
                    L2_2(L3_2)
                  else
                    L2_2 = frameworkConfig
                    L2_2 = L2_2.Framework
                    if "QB" == L2_2 then
                      L2_2 = TriggerEvent
                      L3_2 = "qb:sendNotification"
                      L4_2 = {}
                      L5_2 = afkConfig
                      L5_2 = L5_2.KickedSoonMsg
                      L6_2 = " "
                      L7_2 = timeLeft
                      L8_2 = " seconds"
                      L9_2 = " ("
                      L10_2 = afkConfig
                      L10_2 = L10_2.Notifytreason
                      L11_2 = ")"
                      L5_2 = L5_2 .. L6_2 .. L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2
                      L4_2.text = L5_2
                      L4_2.type = "warning"
                      L5_2 = afkConfig
                      L5_2 = L5_2.Notifytime
                      L4_2.timeout = L5_2
                      L4_2.layout = "centerLeft"
                      L4_2.queue = "left"
                      L2_2(L3_2, L4_2)
                    end
                  end
                end
              end
              L2_2 = timeLeft
              L2_2 = L2_2 - 1
              timeLeft = L2_2
            else
              L2_2 = TriggerServerEvent
              L3_2 = "BSC:AntiAFK:kick"
              L2_2(L3_2)
            end
        end
        else
          L2_2 = afkConfig
          L2_2 = L2_2.secondsUntilKick
          timeLeft = L2_2
        end
        prevPos = L1_2
      end
    end
  end
  L0_1(L1_1)
end
