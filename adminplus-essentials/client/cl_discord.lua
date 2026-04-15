local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = queueConfig
L0_1 = L0_1.Enable
if L0_1 then
  L0_1 = queueConfig
  L0_1 = L0_1.Discord
  L0_1 = L0_1.DiscordPresence
  L1_1 = queueConfig
  L1_1 = L1_1.Discord
  L1_1 = L1_1.ApplicationID
  L2_1 = queueConfig
  L2_1 = L2_1.Discord
  L2_1 = L2_1.Asset
  L3_1 = {}
  function L4_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
    L0_2 = GetPlayerName
    L1_2 = PlayerId
    L1_2, L2_2, L3_2, L4_2, L5_2 = L1_2()
    L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
    L1_2 = GetPlayerServerId
    L2_2 = PlayerId
    L2_2, L3_2, L4_2, L5_2 = L2_2()
    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
    L2_2 = SetDiscordAppId
    L3_2 = L1_1
    L2_2(L3_2)
    L2_2 = SetDiscordRichPresenceAsset
    L3_2 = L2_1
    L2_2(L3_2)
    L2_2 = SetDiscordRichPresenceAssetText
    L3_2 = queueConfig
    L3_2 = L3_2.Discord
    L3_2 = L3_2.SetDiscordRichPresenceAssetText
    L2_2(L3_2)
    L2_2 = SetDiscordRichPresenceAssetSmall
    L3_2 = queueConfig
    L3_2 = L3_2.Discord
    L3_2 = L3_2.SetDiscordRichPresenceAssetSmall
    L2_2(L3_2)
    L2_2 = SetDiscordRichPresenceAssetSmallText
    L3_2 = queueConfig
    L3_2 = L3_2.Discord
    L3_2 = L3_2.SetDiscordRichPresenceAssetSmallText
    L2_2(L3_2)
    L2_2 = SetDiscordRichPresenceAction
    L3_2 = 0
    L4_2 = queueConfig
    L4_2 = L4_2.Discord
    L4_2 = L4_2.SetDiscordRichPresenceAction
    L5_2 = queueConfig
    L5_2 = L5_2.Discord
    L5_2 = L5_2.SetDiscordRichPresenceActionText
    L2_2(L3_2, L4_2, L5_2)
    L2_2 = SetDiscordRichPresenceAction
    L3_2 = 1
    L4_2 = queueConfig
    L4_2 = L4_2.Discord
    L4_2 = L4_2.SetDiscordRichPresenceAction2
    L5_2 = queueConfig
    L5_2 = L5_2.Discord
    L5_2 = L5_2.SetDiscordRichPresenceActionText2
    L2_2(L3_2, L4_2, L5_2)
  end
  SetRP = L4_1
  L4_1 = 0
  L5_1 = ""
  L6_1 = RegisterNetEvent
  L7_1 = "k3ap_pr:setQueueSize"
  L6_1(L7_1)
  L6_1 = AddEventHandler
  L7_1 = "k3ap_pr:setQueueSize"
  function L8_1(A0_2)
    local L1_2
    L4_1 = A0_2
  end
  L6_1(L7_1, L8_1)
  L6_1 = RegisterNetEvent
  L7_1 = "k3ap_pr:setPlayerName"
  L6_1(L7_1)
  L6_1 = AddEventHandler
  L7_1 = "k3ap_pr:setPlayerName"
  function L8_1(A0_2)
    local L1_2
    L5_1 = A0_2
  end
  L6_1(L7_1, L8_1)
  L6_1 = Citizen
  L6_1 = L6_1.CreateThread
  function L7_1()
    local L0_2, L1_2
    while true do
      L0_2 = TriggerServerEvent
      L1_2 = "k3ap_pr:requestPlayerName"
      L0_2(L1_2)
      L0_2 = queueConfig
      L0_2 = L0_2.vQueue
      if not L0_2 then
        L0_2 = queueConfig
        L0_2 = L0_2.n4Queue
        if not L0_2 then
          goto lbl_15
        end
      end
      L0_2 = TriggerServerEvent
      L1_2 = "k3ap_pr:requestQueueSize"
      L0_2(L1_2)
      ::lbl_15::
      L0_2 = Citizen
      L0_2 = L0_2.Wait
      L1_2 = queueConfig
      L1_2 = L1_2.Discord
      L1_2 = L1_2.UpdateQueueSizeInDiscordPresence
      L0_2(L1_2)
    end
  end
  L6_1(L7_1)
  function L6_1()
    local L0_2, L1_2
    L0_2 = L3_1
    return L0_2
  end
  GetServerPlayers = L6_1
  L6_1 = RegisterNetEvent
  L7_1 = "k3ap_pr:updatePlayers"
  function L8_1(A0_2)
    local L1_2
    L3_1 = A0_2
  end
  L6_1(L7_1, L8_1)
  L6_1 = frameworkConfig
  L6_1 = L6_1.Framework
  if "ESX" == L6_1 then
    L6_1 = RegisterNetEvent
    L7_1 = "esx:playerLoaded"
    function L8_1()
      local L0_2, L1_2
      L0_2 = TriggerServerEvent
      L1_2 = "k3ap_pr:updatePlayersRequest"
      L0_2(L1_2)
    end
    L6_1(L7_1, L8_1)
  else
    L6_1 = frameworkConfig
    L6_1 = L6_1.Framework
    if "QB" == L6_1 then
      L6_1 = RegisterNetEvent
      L7_1 = "QBCore:Client:OnPlayerLoaded"
      function L8_1()
        local L0_2, L1_2
        L0_2 = TriggerServerEvent
        L1_2 = "k3ap_pr:updatePlayersRequest"
        L0_2(L1_2)
      end
      L6_1(L7_1, L8_1)
    else
      L6_1 = print
      L7_1 = "No Framework 2"
      L6_1(L7_1)
    end
  end
  L6_1 = queueConfig
  L6_1 = L6_1.Message
  L7_1 = Citizen
  L7_1 = L7_1.CreateThread
  function L8_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
    L0_2 = SetRP
    L0_2()
    while true do
      L0_2 = table
      L0_2 = L0_2.unpack
      L1_2 = GetEntityCoords
      L2_2 = PlayerPedId
      L2_2 = L2_2()
      L3_2 = true
      L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L1_2(L2_2, L3_2)
      L0_2, L1_2, L2_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
      L3_2 = GetPlayerServerId
      L4_2 = PlayerId
      L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L4_2()
      L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
      L4_2 = GetStreetNameAtCoord
      L5_2 = L0_2
      L6_2 = L1_2
      L7_2 = L2_2
      L4_2 = L4_2(L5_2, L6_2, L7_2)
      L5_2 = GetServerPlayers
      L5_2 = L5_2()
      if L5_2 then
        L6_2 = #L5_2
        if L6_2 then
          goto lbl_28
        end
      end
      L6_2 = 0
      ::lbl_28::
      L7_2 = Citizen
      L7_2 = L7_2.Wait
      L8_2 = L0_1
      L7_2(L8_2)
      L7_2 = SetRP
      L7_2()
      L7_2 = queueConfig
      L7_2 = L7_2.vQueue
      if not L7_2 then
        L7_2 = queueConfig
        L7_2 = L7_2.n4Queue
        if not L7_2 then
          goto lbl_1272
        end
      end
      L7_2 = queueConfig
      L7_2 = L7_2.CharacterNames
      if L7_2 then
        L7_2 = SetRichPresence
        L8_2 = "\227\128\161 "
        L9_2 = L5_1
        L10_2 = " "
        L11_2 = L6_1
        L12_2 = [[
  
 Players: ]]
        L13_2 = L6_2
        L14_2 = "/"
        L15_2 = queueConfig
        L15_2 = L15_2.Discord
        L15_2 = L15_2.MaxPlayers
        L16_2 = " | Queue Size: "
        L17_2 = L4_1
        L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2
        L7_2(L8_2)
      else
        L7_2 = SetRichPresence
        L8_2 = "\227\128\161 "
        L9_2 = L6_1
        L10_2 = [[
  
 Players: ]]
        L11_2 = L6_2
        L12_2 = "/"
        L13_2 = queueConfig
        L13_2 = L13_2.Discord
        L13_2 = L13_2.MaxPlayers
        L14_2 = " | Queue Size: "
        L15_2 = L4_1
        L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2
        L7_2(L8_2)
      end
      L7_2 = queueConfig
      L7_2 = L7_2.Streetnames
      if L7_2 and nil ~= L4_2 then
        L7_2 = GetStreetNameFromHashKey
        L8_2 = L4_2
        L7_2 = L7_2(L8_2)
        StreetName = L7_2
        L7_2 = IsPedOnFoot
        L8_2 = PlayerPedId
        L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
        L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
        if L7_2 then
          L7_2 = IsEntityInWater
          L8_2 = PlayerPedId
          L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
          L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
          if not L7_2 then
            L7_2 = IsEntityInArea
            L8_2 = PlayerPedId
            L8_2 = L8_2()
            L9_2 = 2631.851
            L10_2 = 2572.982
            L11_2 = 45.096
            L12_2 = -2449.445
            L13_2 = 711.613
            L14_2 = 264.987
            L15_2 = false
            L16_2 = false
            L17_2 = 0
            L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
            if not L7_2 then
              L7_2 = IsPedSprinting
              L8_2 = PlayerPedId
              L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
              L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
              if L7_2 then
                L7_2 = SetRichPresence
                L8_2 = "\227\128\161 Sprinting down "
                L9_2 = StreetName
                L10_2 = [[
  
 Players: ]]
                L11_2 = L6_2
                L12_2 = "/"
                L13_2 = queueConfig
                L13_2 = L13_2.Discord
                L13_2 = L13_2.MaxPlayers
                L14_2 = " | Queue Size: "
                L15_2 = L4_1
                L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2
                L7_2(L8_2)
              else
                L7_2 = IsPedRunning
                L8_2 = PlayerPedId
                L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                if L7_2 then
                  L7_2 = SetRichPresence
                  L8_2 = "\227\128\161 Running down "
                  L9_2 = StreetName
                  L10_2 = [[
  
 Players: ]]
                  L11_2 = L6_2
                  L12_2 = "/"
                  L13_2 = queueConfig
                  L13_2 = L13_2.Discord
                  L13_2 = L13_2.MaxPlayers
                  L14_2 = " | Queue Size: "
                  L15_2 = L4_1
                  L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2
                  L7_2(L8_2)
                else
                  L7_2 = IsPedWalking
                  L8_2 = PlayerPedId
                  L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                  if L7_2 then
                    L7_2 = SetRichPresence
                    L8_2 = "\227\128\161 Walking down "
                    L9_2 = StreetName
                    L10_2 = [[
  
 Players: ]]
                    L11_2 = L6_2
                    L12_2 = "/"
                    L13_2 = queueConfig
                    L13_2 = L13_2.Discord
                    L13_2 = L13_2.MaxPlayers
                    L14_2 = " | Queue Size: "
                    L15_2 = L4_1
                    L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2
                    L7_2(L8_2)
                  else
                    L7_2 = IsPedStill
                    L8_2 = PlayerPedId
                    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                    if L7_2 then
                      L7_2 = SetRichPresence
                      L8_2 = "\227\128\161 Standing on "
                      L9_2 = StreetName
                      L10_2 = [[
  
 Players: ]]
                      L11_2 = L6_2
                      L12_2 = "/"
                      L13_2 = queueConfig
                      L13_2 = L13_2.Discord
                      L13_2 = L13_2.MaxPlayers
                      L14_2 = " | Queue Size: "
                      L15_2 = L4_1
                      L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2
                      L7_2(L8_2)
                    end
                  end
                end
              end
            else
              L7_2 = IsPedRunning
              L8_2 = PlayerPedId
              L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
              L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
              if not L7_2 then
                L7_2 = GetEntitySpeed
                L8_2 = PlayerPedId
                L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                if not (L7_2 > 2.0) then
                  goto lbl_218
                end
              end
              L7_2 = SetRichPresence
              L8_2 = "\227\128\161 Running afraid near "
              L9_2 = StreetName
              L10_2 = [[
  
 Players: ]]
              L11_2 = L6_2
              L12_2 = "/"
              L13_2 = queueConfig
              L13_2 = L13_2.Discord
              L13_2 = L13_2.MaxPlayers
              L14_2 = " | Queue Size: "
              L15_2 = L4_1
              L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2
              L7_2(L8_2)
              goto lbl_645
              ::lbl_218::
              L7_2 = IsPedRunning
              L8_2 = PlayerPedId
              L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
              L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
              if not L7_2 then
                L7_2 = GetEntitySpeed
                L8_2 = PlayerPedId
                L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                if L7_2 > 1.0 then
                  L7_2 = GetEntitySpeed
                  L8_2 = PlayerPedId
                  L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                  if L7_2 < 2.0 then
                    L7_2 = SetRichPresence
                    L8_2 = "\227\128\161 Exploring around "
                    L9_2 = StreetName
                    L10_2 = [[
  
 Players: ]]
                    L11_2 = L6_2
                    L12_2 = "/"
                    L13_2 = queueConfig
                    L13_2 = L13_2.Discord
                    L13_2 = L13_2.MaxPlayers
                    L14_2 = " | Queue Size: "
                    L15_2 = L4_1
                    L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2
                    L7_2(L8_2)
                end
              end
              else
                L7_2 = SetRichPresence
                L8_2 = "\227\128\161 Resting near "
                L9_2 = StreetName
                L10_2 = [[
  
 Players: ]]
                L11_2 = L6_2
                L12_2 = "/"
                L13_2 = queueConfig
                L13_2 = L13_2.Discord
                L13_2 = L13_2.MaxPlayers
                L14_2 = " | Queue Size: "
                L15_2 = L4_1
                L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2
                L7_2(L8_2)
              end
            end
        end
        else
          L7_2 = IsPedInAnyVehicle
          L8_2 = PlayerPedId
          L8_2 = L8_2()
          L9_2 = false
          L7_2 = L7_2(L8_2, L9_2)
          if L7_2 then
            L7_2 = IsPedInAnyHeli
            L8_2 = PlayerPedId
            L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
            L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
            if not L7_2 then
              L7_2 = IsPedInAnyPlane
              L8_2 = PlayerPedId
              L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
              L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
              if not L7_2 then
                L7_2 = IsPedOnFoot
                L8_2 = PlayerPedId
                L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                if not L7_2 then
                  L7_2 = IsPedInAnySub
                  L8_2 = PlayerPedId
                  L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                  if not L7_2 then
                    L7_2 = IsPedInAnyBoat
                    L8_2 = PlayerPedId
                    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                    if not L7_2 then
                      L7_2 = math
                      L7_2 = L7_2.ceil
                      L8_2 = GetEntitySpeed
                      L9_2 = GetVehiclePedIsUsing
                      L10_2 = PlayerPedId
                      L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2()
                      L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                      L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                      L8_2 = L8_2 * 2.23693629205
                      L7_2 = L7_2(L8_2)
                      L8_2 = GetLabelText
                      L9_2 = GetDisplayNameFromVehicleModel
                      L10_2 = GetEntityModel
                      L11_2 = GetVehiclePedIsUsing
                      L12_2 = PlayerPedId
                      L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L12_2()
                      L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                      L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                      L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                      L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                      if L7_2 > 50 then
                        L9_2 = IsPedOnAnyBike
                        L10_2 = PlayerPedId
                        L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2()
                        L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                        if not L9_2 then
                          L9_2 = SetRichPresence
                          L10_2 = "\227\128\161 Speeding down "
                          L11_2 = StreetName
                          L12_2 = [[
  
 Players: ]]
                          L13_2 = L6_2
                          L14_2 = "/"
                          L15_2 = queueConfig
                          L15_2 = L15_2.Discord
                          L15_2 = L15_2.MaxPlayers
                          L16_2 = " | Queue Size: "
                          L17_2 = L4_1
                          L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2
                          L9_2(L10_2)
                      end
                      elseif L7_2 <= 50 and L7_2 > 0 then
                        L9_2 = SetRichPresence
                        L10_2 = "\227\128\161 cruising  down "
                        L11_2 = StreetName
                        L12_2 = [[
  
 Players: ]]
                        L13_2 = L6_2
                        L14_2 = "/"
                        L15_2 = queueConfig
                        L15_2 = L15_2.Discord
                        L15_2 = L15_2.MaxPlayers
                        L16_2 = " | Queue Size: "
                        L17_2 = L4_1
                        L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2
                        L9_2(L10_2)
                      elseif 0 == L7_2 then
                        L9_2 = SetRichPresence
                        L10_2 = "\227\128\161 parked on "
                        L11_2 = StreetName
                        L12_2 = [[
  
 Players: ]]
                        L13_2 = L6_2
                        L14_2 = "/"
                        L15_2 = queueConfig
                        L15_2 = L15_2.Discord
                        L15_2 = L15_2.MaxPlayers
                        L16_2 = " | Queue Size: "
                        L17_2 = L4_1
                        L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2
                        L9_2(L10_2)
                      elseif L7_2 > 50 then
                        L9_2 = IsPedOnAnyBike
                        L10_2 = PlayerPedId
                        L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2()
                        L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                        if L9_2 then
                          L9_2 = SetRichPresence
                          L10_2 = "\227\128\161 riding near "
                          L11_2 = StreetName
                          L12_2 = [[
  
 Players: ]]
                          L13_2 = L6_2
                          L14_2 = "/"
                          L15_2 = queueConfig
                          L15_2 = L15_2.Discord
                          L15_2 = L15_2.MaxPlayers
                          L16_2 = " | Queue Size: "
                          L17_2 = L4_1
                          L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2
                          L9_2(L10_2)
                        end
                      end
                  end
                end
              end
            end
          end
          else
            L7_2 = IsPedInAnyHeli
            L8_2 = PlayerPedId
            L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
            L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
            if not L7_2 then
              L7_2 = IsPedInAnyPlane
              L8_2 = PlayerPedId
              L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
              L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
              if not L7_2 then
                goto lbl_564
              end
            end
            L7_2 = math
            L7_2 = L7_2.ceil
            L8_2 = GetEntitySpeed
            L9_2 = GetVehiclePedIsUsing
            L10_2 = PlayerPedId
            L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2()
            L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
            L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
            L8_2 = L8_2 * 1.9438444924406046
            L7_2 = L7_2(L8_2)
            L8_2 = GetLabelText
            L9_2 = GetDisplayNameFromVehicleModel
            L10_2 = GetEntityModel
            L11_2 = GetVehiclePedIsUsing
            L12_2 = PlayerPedId
            L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L12_2()
            L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
            L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
            L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
            L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
            L9_2 = IsEntityInAir
            L10_2 = GetVehiclePedIsUsing
            L11_2 = PlayerPedId
            L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2()
            L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
            L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
            if L9_2 then
              L9_2 = GetEntityHeightAboveGround
              L10_2 = GetVehiclePedIsUsing
              L11_2 = PlayerPedId
              L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2()
              L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
              L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
              if L9_2 > 25.0 and L7_2 > 90 then
                L9_2 = SetRichPresence
                L10_2 = "\227\128\161 Flying over "
                L11_2 = StreetName
                L12_2 = " in a "
                L13_2 = L8_2
                L14_2 = [[
  
 Players: ]]
                L15_2 = L6_2
                L16_2 = "/"
                L17_2 = queueConfig
                L17_2 = L17_2.Discord
                L17_2 = L17_2.MaxPlayers
                L18_2 = " | Queue Size: "
                L19_2 = L4_1
                L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2
                L9_2(L10_2)
            end
            else
              L9_2 = IsEntityInAir
              L10_2 = GetVehiclePedIsUsing
              L11_2 = PlayerPedId
              L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2()
              L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
              L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
              if L9_2 then
                L9_2 = GetEntityHeightAboveGround
                L10_2 = GetVehiclePedIsUsing
                L11_2 = PlayerPedId
                L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2()
                L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                if L9_2 <= 25.0 and L7_2 < 90 and L7_2 > 40 then
                  L9_2 = GetLandingGearState
                  L10_2 = GetVehiclePedIsIn
                  L11_2 = PlayerPedId
                  L11_2 = L11_2()
                  L12_2 = false
                  L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2)
                  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                  if 0 == L9_2 then
                    L9_2 = SetRichPresence
                    L10_2 = "\227\128\161 Landing at "
                    L11_2 = StreetName
                    L12_2 = " in a "
                    L13_2 = L8_2
                    L14_2 = [[
  
 Players: ]]
                    L15_2 = L6_2
                    L16_2 = "/"
                    L17_2 = queueConfig
                    L17_2 = L17_2.Discord
                    L17_2 = L17_2.MaxPlayers
                    L18_2 = " | Queue Size: "
                    L19_2 = L4_1
                    L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2
                    L9_2(L10_2)
                end
              end
              else
                L9_2 = GetEntityHeightAboveGround
                L10_2 = GetVehiclePedIsUsing
                L11_2 = PlayerPedId
                L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2()
                L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                if L9_2 <= 25.0 and L7_2 >= 90 and L7_2 < 120 then
                  L9_2 = GetLandingGearState
                  L10_2 = GetVehiclePedIsIn
                  L11_2 = PlayerPedId
                  L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2()
                  L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                  if 0 == L9_2 then
                    L9_2 = SetRichPresence
                    L10_2 = "\227\128\161 Taking off at "
                    L11_2 = StreetName
                    L12_2 = " in a "
                    L13_2 = L8_2
                    L14_2 = [[
  
 Players: ]]
                    L15_2 = L6_2
                    L16_2 = "/"
                    L17_2 = queueConfig
                    L17_2 = L17_2.Discord
                    L17_2 = L17_2.MaxPlayers
                    L18_2 = " | Queue Size: "
                    L19_2 = L4_1
                    L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2
                    L9_2(L10_2)
                end
                else
                  L9_2 = SetRichPresence
                  L10_2 = "\227\128\161 Landed at "
                  L11_2 = StreetName
                  L12_2 = " in a "
                  L13_2 = L8_2
                  L14_2 = [[
  
 Players: ]]
                  L15_2 = L6_2
                  L16_2 = "/"
                  L17_2 = queueConfig
                  L17_2 = L17_2.Discord
                  L17_2 = L17_2.MaxPlayers
                  L18_2 = " | Queue Size: "
                  L19_2 = L4_1
                  L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2
                  L9_2(L10_2)
                  goto lbl_645
                  ::lbl_564::
                  L7_2 = IsEntityInWater
                  L8_2 = PlayerPedId
                  L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                  if L7_2 then
                    L7_2 = SetRichPresence
                    L8_2 = "\227\128\161 Swimming around.  \n Players: "
                    L9_2 = L6_2
                    L10_2 = "/"
                    L11_2 = queueConfig
                    L11_2 = L11_2.Discord
                    L11_2 = L11_2.MaxPlayers
                    L12_2 = " | Queue Size: "
                    L13_2 = L4_1
                    L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2
                    L7_2(L8_2)
                  else
                    L7_2 = IsPedInAnyBoat
                    L8_2 = PlayerPedId
                    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                    if L7_2 then
                      L7_2 = IsEntityInWater
                      L8_2 = GetVehiclePedIsUsing
                      L9_2 = PlayerPedId
                      L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L9_2()
                      L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                      L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                      if L7_2 then
                        L7_2 = GetLabelText
                        L8_2 = GetDisplayNameFromVehicleModel
                        L9_2 = GetEntityModel
                        L10_2 = GetVehiclePedIsUsing
                        L11_2 = PlayerPedId
                        L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2()
                        L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                        L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                        L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                        L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                        L8_2 = SetRichPresence
                        L9_2 = "\227\128\161 Sailing around in a "
                        L10_2 = L7_2
                        L11_2 = [[
  
 Players: ]]
                        L12_2 = L6_2
                        L13_2 = "/"
                        L14_2 = queueConfig
                        L14_2 = L14_2.Discord
                        L14_2 = L14_2.MaxPlayers
                        L15_2 = " | Queue Size: "
                        L16_2 = L4_1
                        L9_2 = L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2
                        L8_2(L9_2)
                    end
                    else
                      L7_2 = IsPedInAnySub
                      L8_2 = PlayerPedId
                      L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                      L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                      if L7_2 then
                        L7_2 = IsEntityInWater
                        L8_2 = GetVehiclePedIsUsing
                        L9_2 = PlayerPedId
                        L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L9_2()
                        L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                        L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                        if L7_2 then
                          L7_2 = SetRichPresence
                          L8_2 = "\227\128\161 In a yellow submarine.  \n Players: "
                          L9_2 = L6_2
                          L10_2 = "/"
                          L11_2 = queueConfig
                          L11_2 = L11_2.Discord
                          L11_2 = L11_2.MaxPlayers
                          L12_2 = " | Queue Size: "
                          L13_2 = L4_1
                          L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2
                          L7_2(L8_2)
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
      ::lbl_645::
      L7_2 = queueConfig
      L7_2 = L7_2.CharacterNames
      if L7_2 then
        L7_2 = queueConfig
        L7_2 = L7_2.Streetnames
        if L7_2 and nil ~= L4_2 then
          L7_2 = GetStreetNameFromHashKey
          L8_2 = L4_2
          L7_2 = L7_2(L8_2)
          StreetName = L7_2
          L7_2 = IsPedOnFoot
          L8_2 = PlayerPedId
          L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
          L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
          if L7_2 then
            L7_2 = IsEntityInWater
            L8_2 = PlayerPedId
            L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
            L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
            if not L7_2 then
              L7_2 = IsEntityInArea
              L8_2 = PlayerPedId
              L8_2 = L8_2()
              L9_2 = 2631.851
              L10_2 = 2572.982
              L11_2 = 45.096
              L12_2 = -2449.445
              L13_2 = 711.613
              L14_2 = 264.987
              L15_2 = false
              L16_2 = false
              L17_2 = 0
              L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
              if not L7_2 then
                L7_2 = IsPedSprinting
                L8_2 = PlayerPedId
                L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                if L7_2 then
                  L7_2 = SetRichPresence
                  L8_2 = "\227\128\161 "
                  L9_2 = L5_1
                  L10_2 = " "
                  L11_2 = "is sprinting down "
                  L12_2 = StreetName
                  L13_2 = [[
  
 Players: ]]
                  L14_2 = L6_2
                  L15_2 = "/"
                  L16_2 = queueConfig
                  L16_2 = L16_2.Discord
                  L16_2 = L16_2.MaxPlayers
                  L17_2 = " | Queue Size: "
                  L18_2 = L4_1
                  L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2
                  L7_2(L8_2)
                else
                  L7_2 = IsPedRunning
                  L8_2 = PlayerPedId
                  L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                  if L7_2 then
                    L7_2 = SetRichPresence
                    L8_2 = "\227\128\161 "
                    L9_2 = L5_1
                    L10_2 = " "
                    L11_2 = "is running down "
                    L12_2 = StreetName
                    L13_2 = [[
  
 Players: ]]
                    L14_2 = L6_2
                    L15_2 = "/"
                    L16_2 = queueConfig
                    L16_2 = L16_2.Discord
                    L16_2 = L16_2.MaxPlayers
                    L17_2 = " | Queue Size: "
                    L18_2 = L4_1
                    L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2
                    L7_2(L8_2)
                  else
                    L7_2 = IsPedWalking
                    L8_2 = PlayerPedId
                    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                    if L7_2 then
                      L7_2 = SetRichPresence
                      L8_2 = "\227\128\161 "
                      L9_2 = L5_1
                      L10_2 = " "
                      L11_2 = "is walking down "
                      L12_2 = StreetName
                      L13_2 = [[
  
 Players: ]]
                      L14_2 = L6_2
                      L15_2 = "/"
                      L16_2 = queueConfig
                      L16_2 = L16_2.Discord
                      L16_2 = L16_2.MaxPlayers
                      L17_2 = " | Queue Size: "
                      L18_2 = L4_1
                      L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2
                      L7_2(L8_2)
                    else
                      L7_2 = IsPedStill
                      L8_2 = PlayerPedId
                      L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                      L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                      if L7_2 then
                        L7_2 = SetRichPresence
                        L8_2 = "\227\128\161 "
                        L9_2 = L5_1
                        L10_2 = " "
                        L11_2 = "is standing on "
                        L12_2 = StreetName
                        L13_2 = [[
  
 Players: ]]
                        L14_2 = L6_2
                        L15_2 = "/"
                        L16_2 = queueConfig
                        L16_2 = L16_2.Discord
                        L16_2 = L16_2.MaxPlayers
                        L17_2 = " | Queue Size: "
                        L18_2 = L4_1
                        L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2
                        L7_2(L8_2)
                      end
                    end
                  end
                end
              else
                L7_2 = IsPedRunning
                L8_2 = PlayerPedId
                L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                if not L7_2 then
                  L7_2 = GetEntitySpeed
                  L8_2 = PlayerPedId
                  L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                  if not (L7_2 > 2.0) then
                    goto lbl_807
                  end
                end
                L7_2 = SetRichPresence
                L8_2 = "\227\128\161 "
                L9_2 = L5_1
                L10_2 = " "
                L11_2 = "is running afraid near "
                L12_2 = StreetName
                L13_2 = [[
  
 Players: ]]
                L14_2 = L6_2
                L15_2 = "/"
                L16_2 = queueConfig
                L16_2 = L16_2.Discord
                L16_2 = L16_2.MaxPlayers
                L17_2 = " | Queue Size: "
                L18_2 = L4_1
                L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2
                L7_2(L8_2)
                goto lbl_1272
                ::lbl_807::
                L7_2 = IsPedRunning
                L8_2 = PlayerPedId
                L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                if not L7_2 then
                  L7_2 = GetEntitySpeed
                  L8_2 = PlayerPedId
                  L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                  if L7_2 > 1.0 then
                    L7_2 = GetEntitySpeed
                    L8_2 = PlayerPedId
                    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                    if L7_2 < 2.0 then
                      L7_2 = SetRichPresence
                      L8_2 = "\227\128\161 "
                      L9_2 = L5_1
                      L10_2 = " "
                      L11_2 = "is exploring around "
                      L12_2 = StreetName
                      L13_2 = [[
  
 Players: ]]
                      L14_2 = L6_2
                      L15_2 = "/"
                      L16_2 = queueConfig
                      L16_2 = L16_2.Discord
                      L16_2 = L16_2.MaxPlayers
                      L17_2 = " | Queue Size: "
                      L18_2 = L4_1
                      L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2
                      L7_2(L8_2)
                  end
                end
                else
                  L7_2 = SetRichPresence
                  L8_2 = "\227\128\161 "
                  L9_2 = L5_1
                  L10_2 = " "
                  L11_2 = "is resting near "
                  L12_2 = StreetName
                  L13_2 = [[
  
 Players: ]]
                  L14_2 = L6_2
                  L15_2 = "/"
                  L16_2 = queueConfig
                  L16_2 = L16_2.Discord
                  L16_2 = L16_2.MaxPlayers
                  L17_2 = " | Queue Size: "
                  L18_2 = L4_1
                  L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2
                  L7_2(L8_2)
                end
              end
          end
          else
            L7_2 = IsPedInAnyVehicle
            L8_2 = PlayerPedId
            L8_2 = L8_2()
            L9_2 = false
            L7_2 = L7_2(L8_2, L9_2)
            if L7_2 then
              L7_2 = IsPedInAnyHeli
              L8_2 = PlayerPedId
              L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
              L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
              if not L7_2 then
                L7_2 = IsPedInAnyPlane
                L8_2 = PlayerPedId
                L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                if not L7_2 then
                  L7_2 = IsPedOnFoot
                  L8_2 = PlayerPedId
                  L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                  if not L7_2 then
                    L7_2 = IsPedInAnySub
                    L8_2 = PlayerPedId
                    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                    if not L7_2 then
                      L7_2 = IsPedInAnyBoat
                      L8_2 = PlayerPedId
                      L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                      L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                      if not L7_2 then
                        L7_2 = math
                        L7_2 = L7_2.ceil
                        L8_2 = GetEntitySpeed
                        L9_2 = GetVehiclePedIsUsing
                        L10_2 = PlayerPedId
                        L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2()
                        L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                        L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                        L8_2 = L8_2 * 2.23693629205
                        L7_2 = L7_2(L8_2)
                        L8_2 = GetLabelText
                        L9_2 = GetDisplayNameFromVehicleModel
                        L10_2 = GetEntityModel
                        L11_2 = GetVehiclePedIsUsing
                        L12_2 = PlayerPedId
                        L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L12_2()
                        L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                        L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                        L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                        L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                        if L7_2 > 50 then
                          L9_2 = IsPedOnAnyBike
                          L10_2 = PlayerPedId
                          L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2()
                          L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                          if not L9_2 then
                            L9_2 = SetRichPresence
                            L10_2 = "\227\128\161 "
                            L11_2 = L5_1
                            L12_2 = " "
                            L13_2 = "is speeding down "
                            L14_2 = StreetName
                            L15_2 = [[
  
 Players: ]]
                            L16_2 = L6_2
                            L17_2 = "/"
                            L18_2 = queueConfig
                            L18_2 = L18_2.Discord
                            L18_2 = L18_2.MaxPlayers
                            L19_2 = " | Queue Size: "
                            L20_2 = L4_1
                            L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2 .. L20_2
                            L9_2(L10_2)
                        end
                        elseif L7_2 <= 50 and L7_2 > 0 then
                          L9_2 = SetRichPresence
                          L10_2 = "\227\128\161 "
                          L11_2 = L5_1
                          L12_2 = " "
                          L13_2 = "is cruising  down "
                          L14_2 = StreetName
                          L15_2 = [[
  
 Players: ]]
                          L16_2 = L6_2
                          L17_2 = "/"
                          L18_2 = queueConfig
                          L18_2 = L18_2.Discord
                          L18_2 = L18_2.MaxPlayers
                          L19_2 = " | Queue Size: "
                          L20_2 = L4_1
                          L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2 .. L20_2
                          L9_2(L10_2)
                        elseif 0 == L7_2 then
                          L9_2 = SetRichPresence
                          L10_2 = "\227\128\161 "
                          L11_2 = L5_1
                          L12_2 = " "
                          L13_2 = "is parked on "
                          L14_2 = StreetName
                          L15_2 = [[
  
 Players: ]]
                          L16_2 = L6_2
                          L17_2 = "/"
                          L18_2 = queueConfig
                          L18_2 = L18_2.Discord
                          L18_2 = L18_2.MaxPlayers
                          L19_2 = " | Queue Size: "
                          L20_2 = L4_1
                          L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2 .. L20_2
                          L9_2(L10_2)
                        elseif L7_2 > 50 then
                          L9_2 = IsPedOnAnyBike
                          L10_2 = PlayerPedId
                          L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2()
                          L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                          if L9_2 then
                            L9_2 = SetRichPresence
                            L10_2 = "\227\128\161 "
                            L11_2 = L5_1
                            L12_2 = " "
                            L13_2 = "is riding near "
                            L14_2 = StreetName
                            L15_2 = [[
  
 Players: ]]
                            L16_2 = L6_2
                            L17_2 = "/"
                            L18_2 = queueConfig
                            L18_2 = L18_2.Discord
                            L18_2 = L18_2.MaxPlayers
                            L19_2 = " | Queue Size: "
                            L20_2 = L4_1
                            L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2 .. L20_2
                            L9_2(L10_2)
                          end
                        end
                    end
                  end
                end
              end
            end
            else
              L7_2 = IsPedInAnyHeli
              L8_2 = PlayerPedId
              L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
              L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
              if not L7_2 then
                L7_2 = IsPedInAnyPlane
                L8_2 = PlayerPedId
                L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                if not L7_2 then
                  goto lbl_1183
                end
              end
              L7_2 = math
              L7_2 = L7_2.ceil
              L8_2 = GetEntitySpeed
              L9_2 = GetVehiclePedIsUsing
              L10_2 = PlayerPedId
              L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2()
              L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
              L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
              L8_2 = L8_2 * 1.9438444924406046
              L7_2 = L7_2(L8_2)
              L8_2 = GetLabelText
              L9_2 = GetDisplayNameFromVehicleModel
              L10_2 = GetEntityModel
              L11_2 = GetVehiclePedIsUsing
              L12_2 = PlayerPedId
              L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L12_2()
              L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
              L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
              L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
              L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
              L9_2 = IsEntityInAir
              L10_2 = GetVehiclePedIsUsing
              L11_2 = PlayerPedId
              L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2()
              L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
              L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
              if L9_2 then
                L9_2 = GetEntityHeightAboveGround
                L10_2 = GetVehiclePedIsUsing
                L11_2 = PlayerPedId
                L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2()
                L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                if L9_2 > 25.0 and L7_2 > 90 then
                  L9_2 = SetRichPresence
                  L10_2 = "\227\128\161 "
                  L11_2 = L5_1
                  L12_2 = " "
                  L13_2 = "flying over "
                  L14_2 = StreetName
                  L15_2 = " in a "
                  L16_2 = L8_2
                  L17_2 = [[
  
 Players: ]]
                  L18_2 = L6_2
                  L19_2 = "/"
                  L20_2 = queueConfig
                  L20_2 = L20_2.Discord
                  L20_2 = L20_2.MaxPlayers
                  L21_2 = " | Queue Size: "
                  L22_2 = L4_1
                  L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2 .. L20_2 .. L21_2 .. L22_2
                  L9_2(L10_2)
              end
              else
                L9_2 = IsEntityInAir
                L10_2 = GetVehiclePedIsUsing
                L11_2 = PlayerPedId
                L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2()
                L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                if L9_2 then
                  L9_2 = GetEntityHeightAboveGround
                  L10_2 = GetVehiclePedIsUsing
                  L11_2 = PlayerPedId
                  L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2()
                  L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                  if L9_2 <= 25.0 and L7_2 < 90 and L7_2 > 40 then
                    L9_2 = GetLandingGearState
                    L10_2 = GetVehiclePedIsIn
                    L11_2 = PlayerPedId
                    L11_2 = L11_2()
                    L12_2 = false
                    L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2)
                    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                    if 0 == L9_2 then
                      L9_2 = SetRichPresence
                      L10_2 = "\227\128\161 "
                      L11_2 = L5_1
                      L12_2 = " "
                      L13_2 = "landing at "
                      L14_2 = StreetName
                      L15_2 = " in a "
                      L16_2 = L8_2
                      L17_2 = [[
  
 Players: ]]
                      L18_2 = L6_2
                      L19_2 = "/"
                      L20_2 = queueConfig
                      L20_2 = L20_2.Discord
                      L20_2 = L20_2.MaxPlayers
                      L21_2 = " | Queue Size: "
                      L22_2 = L4_1
                      L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2 .. L20_2 .. L21_2 .. L22_2
                      L9_2(L10_2)
                  end
                end
                else
                  L9_2 = GetEntityHeightAboveGround
                  L10_2 = GetVehiclePedIsUsing
                  L11_2 = PlayerPedId
                  L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2()
                  L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                  if L9_2 <= 25.0 and L7_2 >= 90 and L7_2 < 120 then
                    L9_2 = GetLandingGearState
                    L10_2 = GetVehiclePedIsIn
                    L11_2 = PlayerPedId
                    L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2()
                    L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                    if 0 == L9_2 then
                      L9_2 = SetRichPresence
                      L10_2 = "\227\128\161 "
                      L11_2 = L5_1
                      L12_2 = " "
                      L13_2 = "taking off at "
                      L14_2 = StreetName
                      L15_2 = " in a "
                      L16_2 = L8_2
                      L17_2 = [[
  
 Players: ]]
                      L18_2 = L6_2
                      L19_2 = "/"
                      L20_2 = queueConfig
                      L20_2 = L20_2.Discord
                      L20_2 = L20_2.MaxPlayers
                      L21_2 = " | Queue Size: "
                      L22_2 = L4_1
                      L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2 .. L20_2 .. L21_2 .. L22_2
                      L9_2(L10_2)
                  end
                  else
                    L9_2 = SetRichPresence
                    L10_2 = "\227\128\161 "
                    L11_2 = L5_1
                    L12_2 = " "
                    L13_2 = "landed at "
                    L14_2 = StreetName
                    L15_2 = " in a "
                    L16_2 = L8_2
                    L17_2 = [[
  
 Players: ]]
                    L18_2 = L6_2
                    L19_2 = "/"
                    L20_2 = queueConfig
                    L20_2 = L20_2.Discord
                    L20_2 = L20_2.MaxPlayers
                    L21_2 = " | Queue Size: "
                    L22_2 = L4_1
                    L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2 .. L20_2 .. L21_2 .. L22_2
                    L9_2(L10_2)
                    goto lbl_1272
                    ::lbl_1183::
                    L7_2 = IsEntityInWater
                    L8_2 = PlayerPedId
                    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                    if L7_2 then
                      L7_2 = SetRichPresence
                      L8_2 = "\227\128\161 "
                      L9_2 = L5_1
                      L10_2 = [[
 is swimming around.  
 Players: ]]
                      L11_2 = L6_2
                      L12_2 = "/"
                      L13_2 = queueConfig
                      L13_2 = L13_2.Discord
                      L13_2 = L13_2.MaxPlayers
                      L14_2 = " | Queue Size: "
                      L15_2 = L4_1
                      L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2
                      L7_2(L8_2)
                    else
                      L7_2 = IsPedInAnyBoat
                      L8_2 = PlayerPedId
                      L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                      L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                      if L7_2 then
                        L7_2 = IsEntityInWater
                        L8_2 = GetVehiclePedIsUsing
                        L9_2 = PlayerPedId
                        L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L9_2()
                        L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                        L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                        if L7_2 then
                          L7_2 = GetLabelText
                          L8_2 = GetDisplayNameFromVehicleModel
                          L9_2 = GetEntityModel
                          L10_2 = GetVehiclePedIsUsing
                          L11_2 = PlayerPedId
                          L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2()
                          L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                          L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                          L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                          L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                          L8_2 = SetRichPresence
                          L9_2 = "\227\128\161 "
                          L10_2 = L5_1
                          L11_2 = " "
                          L12_2 = "is sailing around in a "
                          L13_2 = L7_2
                          L14_2 = [[
  
 Players: ]]
                          L15_2 = L6_2
                          L16_2 = "/"
                          L17_2 = queueConfig
                          L17_2 = L17_2.Discord
                          L17_2 = L17_2.MaxPlayers
                          L18_2 = " | Queue Size: "
                          L19_2 = L4_1
                          L9_2 = L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2
                          L8_2(L9_2)
                      end
                      else
                        L7_2 = IsPedInAnySub
                        L8_2 = PlayerPedId
                        L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                        L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                        if L7_2 then
                          L7_2 = IsEntityInWater
                          L8_2 = GetVehiclePedIsUsing
                          L9_2 = PlayerPedId
                          L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L9_2()
                          L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                          L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                          if L7_2 then
                            L7_2 = SetRichPresence
                            L8_2 = "\227\128\161 "
                            L9_2 = L5_1
                            L10_2 = " "
                            L11_2 = [[
is in a yellow submarine.  
 Players: ]]
                            L12_2 = L6_2
                            L13_2 = "/"
                            L14_2 = queueConfig
                            L14_2 = L14_2.Discord
                            L14_2 = L14_2.MaxPlayers
                            L15_2 = " | Queue Size: "
                            L16_2 = L4_1
                            L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2
                            L7_2(L8_2)
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
      ::lbl_1272::
      L7_2 = queueConfig
      L7_2 = L7_2.Streetnames
      if L7_2 then
        L7_2 = queueConfig
        L7_2 = L7_2.vQueue
        if not L7_2 then
          L7_2 = queueConfig
          L7_2 = L7_2.n4Queue
          if not L7_2 and nil ~= L4_2 then
            L7_2 = GetStreetNameFromHashKey
            L8_2 = L4_2
            L7_2 = L7_2(L8_2)
            StreetName = L7_2
            L7_2 = IsPedOnFoot
            L8_2 = PlayerPedId
            L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
            L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
            if L7_2 then
              L7_2 = IsEntityInWater
              L8_2 = PlayerPedId
              L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
              L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
              if not L7_2 then
                L7_2 = IsEntityInArea
                L8_2 = PlayerPedId
                L8_2 = L8_2()
                L9_2 = 2631.851
                L10_2 = 2572.982
                L11_2 = 45.096
                L12_2 = -2449.445
                L13_2 = 711.613
                L14_2 = 264.987
                L15_2 = false
                L16_2 = false
                L17_2 = 0
                L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
                if not L7_2 then
                  L7_2 = IsPedSprinting
                  L8_2 = PlayerPedId
                  L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                  if L7_2 then
                    L7_2 = SetRichPresence
                    L8_2 = "\227\128\161 Sprinting down "
                    L9_2 = StreetName
                    L10_2 = [[
  
 Players: ]]
                    L11_2 = L6_2
                    L12_2 = "/"
                    L13_2 = queueConfig
                    L13_2 = L13_2.Discord
                    L13_2 = L13_2.MaxPlayers
                    L14_2 = " - ID: "
                    L15_2 = L3_2
                    L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2
                    L7_2(L8_2)
                  else
                    L7_2 = IsPedRunning
                    L8_2 = PlayerPedId
                    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                    if L7_2 then
                      L7_2 = SetRichPresence
                      L8_2 = "\227\128\161 Running down "
                      L9_2 = StreetName
                      L10_2 = [[
  
 Players: ]]
                      L11_2 = L6_2
                      L12_2 = "/"
                      L13_2 = queueConfig
                      L13_2 = L13_2.Discord
                      L13_2 = L13_2.MaxPlayers
                      L14_2 = " - ID: "
                      L15_2 = L3_2
                      L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2
                      L7_2(L8_2)
                    else
                      L7_2 = IsPedWalking
                      L8_2 = PlayerPedId
                      L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                      L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                      if L7_2 then
                        L7_2 = SetRichPresence
                        L8_2 = "\227\128\161 Walking down "
                        L9_2 = StreetName
                        L10_2 = [[
  
 Players: ]]
                        L11_2 = L6_2
                        L12_2 = "/"
                        L13_2 = queueConfig
                        L13_2 = L13_2.Discord
                        L13_2 = L13_2.MaxPlayers
                        L14_2 = " - ID: "
                        L15_2 = L3_2
                        L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2
                        L7_2(L8_2)
                      else
                        L7_2 = IsPedStill
                        L8_2 = PlayerPedId
                        L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                        L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                        if L7_2 then
                          L7_2 = SetRichPresence
                          L8_2 = "\227\128\161 Standing on "
                          L9_2 = StreetName
                          L10_2 = [[
  
 Players: ]]
                          L11_2 = L6_2
                          L12_2 = "/"
                          L13_2 = queueConfig
                          L13_2 = L13_2.Discord
                          L13_2 = L13_2.MaxPlayers
                          L14_2 = " - ID: "
                          L15_2 = L3_2
                          L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2
                          L7_2(L8_2)
                        end
                      end
                    end
                  end
                else
                  L7_2 = IsPedRunning
                  L8_2 = PlayerPedId
                  L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                  if not L7_2 then
                    L7_2 = GetEntitySpeed
                    L8_2 = PlayerPedId
                    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                    if not (L7_2 > 2.0) then
                      goto lbl_1423
                    end
                  end
                  L7_2 = SetRichPresence
                  L8_2 = "\227\128\161 Running afraid near "
                  L9_2 = StreetName
                  L10_2 = [[
  
 Players: ]]
                  L11_2 = L6_2
                  L12_2 = "/"
                  L13_2 = queueConfig
                  L13_2 = L13_2.Discord
                  L13_2 = L13_2.MaxPlayers
                  L14_2 = " - ID: "
                  L15_2 = L3_2
                  L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2
                  L7_2(L8_2)
                  goto lbl_1850
                  ::lbl_1423::
                  L7_2 = IsPedRunning
                  L8_2 = PlayerPedId
                  L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                  if not L7_2 then
                    L7_2 = GetEntitySpeed
                    L8_2 = PlayerPedId
                    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                    if L7_2 > 1.0 then
                      L7_2 = GetEntitySpeed
                      L8_2 = PlayerPedId
                      L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                      L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                      if L7_2 < 2.0 then
                        L7_2 = SetRichPresence
                        L8_2 = "\227\128\161 Exploring around "
                        L9_2 = StreetName
                        L10_2 = [[
  
 Players: ]]
                        L11_2 = L6_2
                        L12_2 = "/"
                        L13_2 = queueConfig
                        L13_2 = L13_2.Discord
                        L13_2 = L13_2.MaxPlayers
                        L14_2 = " - ID: "
                        L15_2 = L3_2
                        L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2
                        L7_2(L8_2)
                    end
                  end
                  else
                    L7_2 = SetRichPresence
                    L8_2 = "\227\128\161 Resting near "
                    L9_2 = StreetName
                    L10_2 = [[
  
 Players: ]]
                    L11_2 = L6_2
                    L12_2 = "/"
                    L13_2 = queueConfig
                    L13_2 = L13_2.Discord
                    L13_2 = L13_2.MaxPlayers
                    L14_2 = " - ID: "
                    L15_2 = L3_2
                    L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2
                    L7_2(L8_2)
                  end
                end
            end
            else
              L7_2 = IsPedInAnyVehicle
              L8_2 = PlayerPedId
              L8_2 = L8_2()
              L9_2 = false
              L7_2 = L7_2(L8_2, L9_2)
              if L7_2 then
                L7_2 = IsPedInAnyHeli
                L8_2 = PlayerPedId
                L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                if not L7_2 then
                  L7_2 = IsPedInAnyPlane
                  L8_2 = PlayerPedId
                  L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                  if not L7_2 then
                    L7_2 = IsPedOnFoot
                    L8_2 = PlayerPedId
                    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                    if not L7_2 then
                      L7_2 = IsPedInAnySub
                      L8_2 = PlayerPedId
                      L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                      L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                      if not L7_2 then
                        L7_2 = IsPedInAnyBoat
                        L8_2 = PlayerPedId
                        L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                        L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                        if not L7_2 then
                          L7_2 = math
                          L7_2 = L7_2.ceil
                          L8_2 = GetEntitySpeed
                          L9_2 = GetVehiclePedIsUsing
                          L10_2 = PlayerPedId
                          L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2()
                          L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                          L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                          L8_2 = L8_2 * 2.23693629205
                          L7_2 = L7_2(L8_2)
                          L8_2 = GetLabelText
                          L9_2 = GetDisplayNameFromVehicleModel
                          L10_2 = GetEntityModel
                          L11_2 = GetVehiclePedIsUsing
                          L12_2 = PlayerPedId
                          L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L12_2()
                          L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                          L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                          L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                          L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                          if L7_2 > 50 then
                            L9_2 = IsPedOnAnyBike
                            L10_2 = PlayerPedId
                            L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2()
                            L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                            if not L9_2 then
                              L9_2 = SetRichPresence
                              L10_2 = "\227\128\161 Speeding down "
                              L11_2 = StreetName
                              L12_2 = [[
  
 Players: ]]
                              L13_2 = L6_2
                              L14_2 = "/"
                              L15_2 = queueConfig
                              L15_2 = L15_2.Discord
                              L15_2 = L15_2.MaxPlayers
                              L16_2 = " - ID: "
                              L17_2 = L3_2
                              L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2
                              L9_2(L10_2)
                          end
                          elseif L7_2 <= 50 and L7_2 > 0 then
                            L9_2 = SetRichPresence
                            L10_2 = "\227\128\161 cruising  down "
                            L11_2 = StreetName
                            L12_2 = [[
  
 Players: ]]
                            L13_2 = L6_2
                            L14_2 = "/"
                            L15_2 = queueConfig
                            L15_2 = L15_2.Discord
                            L15_2 = L15_2.MaxPlayers
                            L16_2 = " - ID: "
                            L17_2 = L3_2
                            L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2
                            L9_2(L10_2)
                          elseif 0 == L7_2 then
                            L9_2 = SetRichPresence
                            L10_2 = "\227\128\161 parked on "
                            L11_2 = StreetName
                            L12_2 = [[
  
 Players: ]]
                            L13_2 = L6_2
                            L14_2 = "/"
                            L15_2 = queueConfig
                            L15_2 = L15_2.Discord
                            L15_2 = L15_2.MaxPlayers
                            L16_2 = " - ID: "
                            L17_2 = L3_2
                            L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2
                            L9_2(L10_2)
                          elseif L7_2 > 50 then
                            L9_2 = IsPedOnAnyBike
                            L10_2 = PlayerPedId
                            L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2()
                            L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                            if L9_2 then
                              L9_2 = SetRichPresence
                              L10_2 = "\227\128\161 riding near "
                              L11_2 = StreetName
                              L12_2 = [[
  
 Players: ]]
                              L13_2 = L6_2
                              L14_2 = "/"
                              L15_2 = queueConfig
                              L15_2 = L15_2.Discord
                              L15_2 = L15_2.MaxPlayers
                              L16_2 = " - ID: "
                              L17_2 = L3_2
                              L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2
                              L9_2(L10_2)
                            end
                          end
                      end
                    end
                  end
                end
              end
              else
                L7_2 = IsPedInAnyHeli
                L8_2 = PlayerPedId
                L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                if not L7_2 then
                  L7_2 = IsPedInAnyPlane
                  L8_2 = PlayerPedId
                  L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                  if not L7_2 then
                    goto lbl_1769
                  end
                end
                L7_2 = math
                L7_2 = L7_2.ceil
                L8_2 = GetEntitySpeed
                L9_2 = GetVehiclePedIsUsing
                L10_2 = PlayerPedId
                L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2()
                L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                L8_2 = L8_2 * 1.9438444924406046
                L7_2 = L7_2(L8_2)
                L8_2 = GetLabelText
                L9_2 = GetDisplayNameFromVehicleModel
                L10_2 = GetEntityModel
                L11_2 = GetVehiclePedIsUsing
                L12_2 = PlayerPedId
                L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L12_2()
                L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                L9_2 = IsEntityInAir
                L10_2 = GetVehiclePedIsUsing
                L11_2 = PlayerPedId
                L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2()
                L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                if L9_2 then
                  L9_2 = GetEntityHeightAboveGround
                  L10_2 = GetVehiclePedIsUsing
                  L11_2 = PlayerPedId
                  L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2()
                  L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                  if L9_2 > 25.0 and L7_2 > 90 then
                    L9_2 = SetRichPresence
                    L10_2 = "\227\128\161 Flying over "
                    L11_2 = StreetName
                    L12_2 = " in a "
                    L13_2 = L8_2
                    L14_2 = [[
  
 Players: ]]
                    L15_2 = L6_2
                    L16_2 = "/"
                    L17_2 = queueConfig
                    L17_2 = L17_2.Discord
                    L17_2 = L17_2.MaxPlayers
                    L18_2 = " - ID: "
                    L19_2 = L3_2
                    L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2
                    L9_2(L10_2)
                end
                else
                  L9_2 = IsEntityInAir
                  L10_2 = GetVehiclePedIsUsing
                  L11_2 = PlayerPedId
                  L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2()
                  L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                  if L9_2 then
                    L9_2 = GetEntityHeightAboveGround
                    L10_2 = GetVehiclePedIsUsing
                    L11_2 = PlayerPedId
                    L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2()
                    L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                    if L9_2 <= 25.0 and L7_2 < 90 and L7_2 > 40 then
                      L9_2 = GetLandingGearState
                      L10_2 = GetVehiclePedIsIn
                      L11_2 = PlayerPedId
                      L11_2 = L11_2()
                      L12_2 = false
                      L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2)
                      L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                      if 0 == L9_2 then
                        L9_2 = SetRichPresence
                        L10_2 = "\227\128\161 Landing at "
                        L11_2 = StreetName
                        L12_2 = " in a "
                        L13_2 = L8_2
                        L14_2 = [[
  
 Players: ]]
                        L15_2 = L6_2
                        L16_2 = "/"
                        L17_2 = queueConfig
                        L17_2 = L17_2.Discord
                        L17_2 = L17_2.MaxPlayers
                        L18_2 = " - ID: "
                        L19_2 = L3_2
                        L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2
                        L9_2(L10_2)
                    end
                  end
                  else
                    L9_2 = GetEntityHeightAboveGround
                    L10_2 = GetVehiclePedIsUsing
                    L11_2 = PlayerPedId
                    L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2()
                    L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                    if L9_2 <= 25.0 and L7_2 >= 90 and L7_2 < 120 then
                      L9_2 = GetLandingGearState
                      L10_2 = GetVehiclePedIsIn
                      L11_2 = PlayerPedId
                      L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2()
                      L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                      L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                      if 0 == L9_2 then
                        L9_2 = SetRichPresence
                        L10_2 = "\227\128\161 Taking off at "
                        L11_2 = StreetName
                        L12_2 = " in a "
                        L13_2 = L8_2
                        L14_2 = [[
  
 Players: ]]
                        L15_2 = L6_2
                        L16_2 = "/"
                        L17_2 = queueConfig
                        L17_2 = L17_2.Discord
                        L17_2 = L17_2.MaxPlayers
                        L18_2 = " - ID: "
                        L19_2 = L3_2
                        L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2
                        L9_2(L10_2)
                    end
                    else
                      L9_2 = SetRichPresence
                      L10_2 = "\227\128\161 Landed at "
                      L11_2 = StreetName
                      L12_2 = " in a "
                      L13_2 = L8_2
                      L14_2 = [[
  
 Players: ]]
                      L15_2 = L6_2
                      L16_2 = "/"
                      L17_2 = queueConfig
                      L17_2 = L17_2.Discord
                      L17_2 = L17_2.MaxPlayers
                      L18_2 = " - ID: "
                      L19_2 = L3_2
                      L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2
                      L9_2(L10_2)
                      goto lbl_1850
                      ::lbl_1769::
                      L7_2 = IsEntityInWater
                      L8_2 = PlayerPedId
                      L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                      L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                      if L7_2 then
                        L7_2 = SetRichPresence
                        L8_2 = "\227\128\161 Swimming around.  \n Players: "
                        L9_2 = L6_2
                        L10_2 = "/"
                        L11_2 = queueConfig
                        L11_2 = L11_2.Discord
                        L11_2 = L11_2.MaxPlayers
                        L12_2 = " - ID: "
                        L13_2 = L3_2
                        L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2
                        L7_2(L8_2)
                      else
                        L7_2 = IsPedInAnyBoat
                        L8_2 = PlayerPedId
                        L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                        L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                        if L7_2 then
                          L7_2 = IsEntityInWater
                          L8_2 = GetVehiclePedIsUsing
                          L9_2 = PlayerPedId
                          L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L9_2()
                          L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                          L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                          if L7_2 then
                            L7_2 = GetLabelText
                            L8_2 = GetDisplayNameFromVehicleModel
                            L9_2 = GetEntityModel
                            L10_2 = GetVehiclePedIsUsing
                            L11_2 = PlayerPedId
                            L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2()
                            L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                            L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                            L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                            L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                            L8_2 = SetRichPresence
                            L9_2 = "\227\128\161 Sailing around in a "
                            L10_2 = L7_2
                            L11_2 = [[
  
 Players: ]]
                            L12_2 = L6_2
                            L13_2 = "/"
                            L14_2 = queueConfig
                            L14_2 = L14_2.Discord
                            L14_2 = L14_2.MaxPlayers
                            L15_2 = " - ID: "
                            L16_2 = L3_2
                            L9_2 = L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2
                            L8_2(L9_2)
                        end
                        else
                          L7_2 = IsPedInAnySub
                          L8_2 = PlayerPedId
                          L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                          L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                          if L7_2 then
                            L7_2 = IsEntityInWater
                            L8_2 = GetVehiclePedIsUsing
                            L9_2 = PlayerPedId
                            L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L9_2()
                            L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                            L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                            if L7_2 then
                              L7_2 = SetRichPresence
                              L8_2 = "\227\128\161 In a yellow submarine.  \n Players: "
                              L9_2 = L6_2
                              L10_2 = "/"
                              L11_2 = queueConfig
                              L11_2 = L11_2.Discord
                              L11_2 = L11_2.MaxPlayers
                              L12_2 = " - ID: "
                              L13_2 = L3_2
                              L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2
                              L7_2(L8_2)
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
      ::lbl_1850::
      L7_2 = queueConfig
      L7_2 = L7_2.CharacterNames
      if L7_2 then
        L7_2 = queueConfig
        L7_2 = L7_2.Streetnames
        if L7_2 then
          L7_2 = queueConfig
          L7_2 = L7_2.vQueue
          if not L7_2 then
            L7_2 = queueConfig
            L7_2 = L7_2.n4Queue
            if not L7_2 and nil ~= L4_2 then
              L7_2 = GetStreetNameFromHashKey
              L8_2 = L4_2
              L7_2 = L7_2(L8_2)
              StreetName = L7_2
              L7_2 = IsPedOnFoot
              L8_2 = PlayerPedId
              L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
              L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
              if L7_2 then
                L7_2 = IsEntityInWater
                L8_2 = PlayerPedId
                L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                if not L7_2 then
                  L7_2 = IsEntityInArea
                  L8_2 = PlayerPedId
                  L8_2 = L8_2()
                  L9_2 = 2631.851
                  L10_2 = 2572.982
                  L11_2 = 45.096
                  L12_2 = -2449.445
                  L13_2 = 711.613
                  L14_2 = 264.987
                  L15_2 = false
                  L16_2 = false
                  L17_2 = 0
                  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
                  if not L7_2 then
                    L7_2 = IsPedSprinting
                    L8_2 = PlayerPedId
                    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                    if L7_2 then
                      L7_2 = SetRichPresence
                      L8_2 = "\227\128\161 "
                      L9_2 = L5_1
                      L10_2 = " "
                      L11_2 = "is sprinting down "
                      L12_2 = StreetName
                      L13_2 = [[
  
 Players: ]]
                      L14_2 = L6_2
                      L15_2 = "/"
                      L16_2 = queueConfig
                      L16_2 = L16_2.Discord
                      L16_2 = L16_2.MaxPlayers
                      L17_2 = " - ID: "
                      L18_2 = L3_2
                      L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2
                      L7_2(L8_2)
                    else
                      L7_2 = IsPedRunning
                      L8_2 = PlayerPedId
                      L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                      L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                      if L7_2 then
                        L7_2 = SetRichPresence
                        L8_2 = "\227\128\161 "
                        L9_2 = L5_1
                        L10_2 = " "
                        L11_2 = "is running down "
                        L12_2 = StreetName
                        L13_2 = [[
  
 Players: ]]
                        L14_2 = L6_2
                        L15_2 = "/"
                        L16_2 = queueConfig
                        L16_2 = L16_2.Discord
                        L16_2 = L16_2.MaxPlayers
                        L17_2 = " - ID: "
                        L18_2 = L3_2
                        L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2
                        L7_2(L8_2)
                      else
                        L7_2 = IsPedWalking
                        L8_2 = PlayerPedId
                        L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                        L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                        if L7_2 then
                          L7_2 = SetRichPresence
                          L8_2 = "\227\128\161 "
                          L9_2 = L5_1
                          L10_2 = " "
                          L11_2 = "is walking down "
                          L12_2 = StreetName
                          L13_2 = [[
  
 Players: ]]
                          L14_2 = L6_2
                          L15_2 = "/"
                          L16_2 = queueConfig
                          L16_2 = L16_2.Discord
                          L16_2 = L16_2.MaxPlayers
                          L17_2 = " - ID: "
                          L18_2 = L3_2
                          L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2
                          L7_2(L8_2)
                        else
                          L7_2 = IsPedStill
                          L8_2 = PlayerPedId
                          L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                          L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                          if L7_2 then
                            L7_2 = SetRichPresence
                            L8_2 = "\227\128\161 "
                            L9_2 = L5_1
                            L10_2 = " "
                            L11_2 = "is standing on "
                            L12_2 = StreetName
                            L13_2 = [[
  
 Players: ]]
                            L14_2 = L6_2
                            L15_2 = "/"
                            L16_2 = queueConfig
                            L16_2 = L16_2.Discord
                            L16_2 = L16_2.MaxPlayers
                            L17_2 = " - ID: "
                            L18_2 = L3_2
                            L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2
                            L7_2(L8_2)
                          end
                        end
                      end
                    end
                  else
                    L7_2 = IsPedRunning
                    L8_2 = PlayerPedId
                    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                    if not L7_2 then
                      L7_2 = GetEntitySpeed
                      L8_2 = PlayerPedId
                      L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                      L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                      if not (L7_2 > 2.0) then
                        goto lbl_2020
                      end
                    end
                    L7_2 = SetRichPresence
                    L8_2 = "\227\128\161 "
                    L9_2 = L5_1
                    L10_2 = " "
                    L11_2 = "is running afraid near "
                    L12_2 = StreetName
                    L13_2 = [[
  
 Players: ]]
                    L14_2 = L6_2
                    L15_2 = "/"
                    L16_2 = queueConfig
                    L16_2 = L16_2.Discord
                    L16_2 = L16_2.MaxPlayers
                    L17_2 = " - ID: "
                    L18_2 = L3_2
                    L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2
                    L7_2(L8_2)
                    goto lbl_2485
                    ::lbl_2020::
                    L7_2 = IsPedRunning
                    L8_2 = PlayerPedId
                    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                    if not L7_2 then
                      L7_2 = GetEntitySpeed
                      L8_2 = PlayerPedId
                      L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                      L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                      if L7_2 > 1.0 then
                        L7_2 = GetEntitySpeed
                        L8_2 = PlayerPedId
                        L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                        L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                        if L7_2 < 2.0 then
                          L7_2 = SetRichPresence
                          L8_2 = "\227\128\161 "
                          L9_2 = L5_1
                          L10_2 = " "
                          L11_2 = "is exploring around "
                          L12_2 = StreetName
                          L13_2 = [[
  
 Players: ]]
                          L14_2 = L6_2
                          L15_2 = "/"
                          L16_2 = queueConfig
                          L16_2 = L16_2.Discord
                          L16_2 = L16_2.MaxPlayers
                          L17_2 = " - ID: "
                          L18_2 = L3_2
                          L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2
                          L7_2(L8_2)
                      end
                    end
                    else
                      L7_2 = SetRichPresence
                      L8_2 = "\227\128\161 "
                      L9_2 = L5_1
                      L10_2 = " "
                      L11_2 = "is resting near "
                      L12_2 = StreetName
                      L13_2 = [[
  
 Players: ]]
                      L14_2 = L6_2
                      L15_2 = "/"
                      L16_2 = queueConfig
                      L16_2 = L16_2.Discord
                      L16_2 = L16_2.MaxPlayers
                      L17_2 = " - ID: "
                      L18_2 = L3_2
                      L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2
                      L7_2(L8_2)
                    end
                  end
              end
              else
                L7_2 = IsPedInAnyVehicle
                L8_2 = PlayerPedId
                L8_2 = L8_2()
                L9_2 = false
                L7_2 = L7_2(L8_2, L9_2)
                if L7_2 then
                  L7_2 = IsPedInAnyHeli
                  L8_2 = PlayerPedId
                  L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                  if not L7_2 then
                    L7_2 = IsPedInAnyPlane
                    L8_2 = PlayerPedId
                    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                    if not L7_2 then
                      L7_2 = IsPedOnFoot
                      L8_2 = PlayerPedId
                      L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                      L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                      if not L7_2 then
                        L7_2 = IsPedInAnySub
                        L8_2 = PlayerPedId
                        L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                        L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                        if not L7_2 then
                          L7_2 = IsPedInAnyBoat
                          L8_2 = PlayerPedId
                          L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                          L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                          if not L7_2 then
                            L7_2 = math
                            L7_2 = L7_2.ceil
                            L8_2 = GetEntitySpeed
                            L9_2 = GetVehiclePedIsUsing
                            L10_2 = PlayerPedId
                            L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2()
                            L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                            L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                            L8_2 = L8_2 * 2.23693629205
                            L7_2 = L7_2(L8_2)
                            L8_2 = GetLabelText
                            L9_2 = GetDisplayNameFromVehicleModel
                            L10_2 = GetEntityModel
                            L11_2 = GetVehiclePedIsUsing
                            L12_2 = PlayerPedId
                            L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L12_2()
                            L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                            L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                            L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                            L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                            if L7_2 > 50 then
                              L9_2 = IsPedOnAnyBike
                              L10_2 = PlayerPedId
                              L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2()
                              L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                              if not L9_2 then
                                L9_2 = SetRichPresence
                                L10_2 = "\227\128\161 "
                                L11_2 = L5_1
                                L12_2 = " "
                                L13_2 = "is speeding down "
                                L14_2 = StreetName
                                L15_2 = [[
  
 Players: ]]
                                L16_2 = L6_2
                                L17_2 = "/"
                                L18_2 = queueConfig
                                L18_2 = L18_2.Discord
                                L18_2 = L18_2.MaxPlayers
                                L19_2 = " - ID: "
                                L20_2 = L3_2
                                L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2 .. L20_2
                                L9_2(L10_2)
                            end
                            elseif L7_2 <= 50 and L7_2 > 0 then
                              L9_2 = SetRichPresence
                              L10_2 = "\227\128\161 "
                              L11_2 = L5_1
                              L12_2 = " "
                              L13_2 = "is cruising  down "
                              L14_2 = StreetName
                              L15_2 = [[
  
 Players: ]]
                              L16_2 = L6_2
                              L17_2 = "/"
                              L18_2 = queueConfig
                              L18_2 = L18_2.Discord
                              L18_2 = L18_2.MaxPlayers
                              L19_2 = " - ID: "
                              L20_2 = L3_2
                              L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2 .. L20_2
                              L9_2(L10_2)
                            elseif 0 == L7_2 then
                              L9_2 = SetRichPresence
                              L10_2 = "\227\128\161 "
                              L11_2 = L5_1
                              L12_2 = " "
                              L13_2 = "is parked on "
                              L14_2 = StreetName
                              L15_2 = [[
  
 Players: ]]
                              L16_2 = L6_2
                              L17_2 = "/"
                              L18_2 = queueConfig
                              L18_2 = L18_2.Discord
                              L18_2 = L18_2.MaxPlayers
                              L19_2 = " - ID: "
                              L20_2 = L3_2
                              L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2 .. L20_2
                              L9_2(L10_2)
                            elseif L7_2 > 50 then
                              L9_2 = IsPedOnAnyBike
                              L10_2 = PlayerPedId
                              L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2()
                              L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                              if L9_2 then
                                L9_2 = SetRichPresence
                                L10_2 = "\227\128\161 "
                                L11_2 = L5_1
                                L12_2 = " "
                                L13_2 = "is riding near "
                                L14_2 = StreetName
                                L15_2 = [[
  
 Players: ]]
                                L16_2 = L6_2
                                L17_2 = "/"
                                L18_2 = queueConfig
                                L18_2 = L18_2.Discord
                                L18_2 = L18_2.MaxPlayers
                                L19_2 = " - ID: "
                                L20_2 = L3_2
                                L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2 .. L20_2
                                L9_2(L10_2)
                              end
                            end
                        end
                      end
                    end
                  end
                end
                else
                  L7_2 = IsPedInAnyHeli
                  L8_2 = PlayerPedId
                  L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                  if not L7_2 then
                    L7_2 = IsPedInAnyPlane
                    L8_2 = PlayerPedId
                    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                    if not L7_2 then
                      goto lbl_2396
                    end
                  end
                  L7_2 = math
                  L7_2 = L7_2.ceil
                  L8_2 = GetEntitySpeed
                  L9_2 = GetVehiclePedIsUsing
                  L10_2 = PlayerPedId
                  L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2()
                  L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                  L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                  L8_2 = L8_2 * 1.9438444924406046
                  L7_2 = L7_2(L8_2)
                  L8_2 = GetLabelText
                  L9_2 = GetDisplayNameFromVehicleModel
                  L10_2 = GetEntityModel
                  L11_2 = GetVehiclePedIsUsing
                  L12_2 = PlayerPedId
                  L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L12_2()
                  L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                  L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                  L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                  L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                  L9_2 = IsEntityInAir
                  L10_2 = GetVehiclePedIsUsing
                  L11_2 = PlayerPedId
                  L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2()
                  L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                  if L9_2 then
                    L9_2 = GetEntityHeightAboveGround
                    L10_2 = GetVehiclePedIsUsing
                    L11_2 = PlayerPedId
                    L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2()
                    L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                    if L9_2 > 25.0 and L7_2 > 90 then
                      L9_2 = SetRichPresence
                      L10_2 = "\227\128\161 "
                      L11_2 = L5_1
                      L12_2 = " "
                      L13_2 = "flying over "
                      L14_2 = StreetName
                      L15_2 = " in a "
                      L16_2 = L8_2
                      L17_2 = [[
  
 Players: ]]
                      L18_2 = L6_2
                      L19_2 = "/"
                      L20_2 = queueConfig
                      L20_2 = L20_2.Discord
                      L20_2 = L20_2.MaxPlayers
                      L21_2 = " - ID: "
                      L22_2 = L3_2
                      L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2 .. L20_2 .. L21_2 .. L22_2
                      L9_2(L10_2)
                  end
                  else
                    L9_2 = IsEntityInAir
                    L10_2 = GetVehiclePedIsUsing
                    L11_2 = PlayerPedId
                    L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2()
                    L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                    if L9_2 then
                      L9_2 = GetEntityHeightAboveGround
                      L10_2 = GetVehiclePedIsUsing
                      L11_2 = PlayerPedId
                      L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2()
                      L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                      L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                      if L9_2 <= 25.0 and L7_2 < 90 and L7_2 > 40 then
                        L9_2 = GetLandingGearState
                        L10_2 = GetVehiclePedIsIn
                        L11_2 = PlayerPedId
                        L11_2 = L11_2()
                        L12_2 = false
                        L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2)
                        L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                        if 0 == L9_2 then
                          L9_2 = SetRichPresence
                          L10_2 = "\227\128\161 "
                          L11_2 = L5_1
                          L12_2 = " "
                          L13_2 = "landing at "
                          L14_2 = StreetName
                          L15_2 = " in a "
                          L16_2 = L8_2
                          L17_2 = [[
  
 Players: ]]
                          L18_2 = L6_2
                          L19_2 = "/"
                          L20_2 = queueConfig
                          L20_2 = L20_2.Discord
                          L20_2 = L20_2.MaxPlayers
                          L21_2 = " - ID: "
                          L22_2 = L3_2
                          L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2 .. L20_2 .. L21_2 .. L22_2
                          L9_2(L10_2)
                      end
                    end
                    else
                      L9_2 = GetEntityHeightAboveGround
                      L10_2 = GetVehiclePedIsUsing
                      L11_2 = PlayerPedId
                      L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2()
                      L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                      L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                      if L9_2 <= 25.0 and L7_2 >= 90 and L7_2 < 120 then
                        L9_2 = GetLandingGearState
                        L10_2 = GetVehiclePedIsIn
                        L11_2 = PlayerPedId
                        L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2()
                        L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                        L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                        if 0 == L9_2 then
                          L9_2 = SetRichPresence
                          L10_2 = "\227\128\161 "
                          L11_2 = L5_1
                          L12_2 = " "
                          L13_2 = "taking off at "
                          L14_2 = StreetName
                          L15_2 = " in a "
                          L16_2 = L8_2
                          L17_2 = [[
  
 Players: ]]
                          L18_2 = L6_2
                          L19_2 = "/"
                          L20_2 = queueConfig
                          L20_2 = L20_2.Discord
                          L20_2 = L20_2.MaxPlayers
                          L21_2 = " - ID: "
                          L22_2 = L3_2
                          L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2 .. L20_2 .. L21_2 .. L22_2
                          L9_2(L10_2)
                      end
                      else
                        L9_2 = SetRichPresence
                        L10_2 = "\227\128\161 "
                        L11_2 = L5_1
                        L12_2 = " "
                        L13_2 = "landed at "
                        L14_2 = StreetName
                        L15_2 = " in a "
                        L16_2 = L8_2
                        L17_2 = [[
  
 Players: ]]
                        L18_2 = L6_2
                        L19_2 = "/"
                        L20_2 = queueConfig
                        L20_2 = L20_2.Discord
                        L20_2 = L20_2.MaxPlayers
                        L21_2 = " - ID: "
                        L22_2 = L3_2
                        L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2 .. L20_2 .. L21_2 .. L22_2
                        L9_2(L10_2)
                        goto lbl_2485
                        ::lbl_2396::
                        L7_2 = IsEntityInWater
                        L8_2 = PlayerPedId
                        L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                        L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                        if L7_2 then
                          L7_2 = SetRichPresence
                          L8_2 = "\227\128\161 "
                          L9_2 = L5_1
                          L10_2 = [[
 is swimming around.  
 Players: ]]
                          L11_2 = L6_2
                          L12_2 = "/"
                          L13_2 = queueConfig
                          L13_2 = L13_2.Discord
                          L13_2 = L13_2.MaxPlayers
                          L14_2 = " - ID: "
                          L15_2 = L3_2
                          L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2
                          L7_2(L8_2)
                        else
                          L7_2 = IsPedInAnyBoat
                          L8_2 = PlayerPedId
                          L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                          L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                          if L7_2 then
                            L7_2 = IsEntityInWater
                            L8_2 = GetVehiclePedIsUsing
                            L9_2 = PlayerPedId
                            L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L9_2()
                            L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                            L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                            if L7_2 then
                              L7_2 = GetLabelText
                              L8_2 = GetDisplayNameFromVehicleModel
                              L9_2 = GetEntityModel
                              L10_2 = GetVehiclePedIsUsing
                              L11_2 = PlayerPedId
                              L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2()
                              L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                              L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                              L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                              L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                              L8_2 = SetRichPresence
                              L9_2 = "\227\128\161 "
                              L10_2 = L5_1
                              L11_2 = " "
                              L12_2 = "is sailing around in a "
                              L13_2 = L7_2
                              L14_2 = [[
  
 Players: ]]
                              L15_2 = L6_2
                              L16_2 = "/"
                              L17_2 = queueConfig
                              L17_2 = L17_2.Discord
                              L17_2 = L17_2.MaxPlayers
                              L18_2 = " - ID: "
                              L19_2 = L3_2
                              L9_2 = L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2
                              L8_2(L9_2)
                          end
                          else
                            L7_2 = IsPedInAnySub
                            L8_2 = PlayerPedId
                            L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2()
                            L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                            if L7_2 then
                              L7_2 = IsEntityInWater
                              L8_2 = GetVehiclePedIsUsing
                              L9_2 = PlayerPedId
                              L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L9_2()
                              L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                              L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                              if L7_2 then
                                L7_2 = SetRichPresence
                                L8_2 = "\227\128\161 "
                                L9_2 = L5_1
                                L10_2 = " "
                                L11_2 = [[
is in a yellow submarine.  
 Players: ]]
                                L12_2 = L6_2
                                L13_2 = "/"
                                L14_2 = queueConfig
                                L14_2 = L14_2.Discord
                                L14_2 = L14_2.MaxPlayers
                                L15_2 = " - ID: "
                                L16_2 = L3_2
                                L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2
                                L7_2(L8_2)
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
      ::lbl_2485::
      L7_2 = queueConfig
      L7_2 = L7_2.CharacterNames
      if L7_2 then
        L7_2 = queueConfig
        L7_2 = L7_2.vQueue
        if not L7_2 then
          L7_2 = queueConfig
          L7_2 = L7_2.n4Queue
          if not L7_2 then
            L7_2 = queueConfig
            L7_2 = L7_2.Streetnames
            if not L7_2 then
              L7_2 = SetRichPresence
              L8_2 = "\227\128\161 "
              L9_2 = L5_1
              L10_2 = " "
              L11_2 = L6_1
              L12_2 = [[
  
 Players: ]]
              L13_2 = L6_2
              L14_2 = "/"
              L15_2 = queueConfig
              L15_2 = L15_2.Discord
              L15_2 = L15_2.MaxPlayers
              L16_2 = " - ID: "
              L17_2 = L3_2
              L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2
              L7_2(L8_2)
            end
          end
        end
      end
      L7_2 = queueConfig
      L7_2 = L7_2.CharacterNames
      if not L7_2 then
        L7_2 = queueConfig
        L7_2 = L7_2.vQueue
        if not L7_2 then
          L7_2 = queueConfig
          L7_2 = L7_2.n4Queue
          if not L7_2 then
            L7_2 = queueConfig
            L7_2 = L7_2.Streetnames
            if not L7_2 then
              L7_2 = SetRichPresence
              L8_2 = "\227\128\161 "
              L9_2 = L6_1
              L10_2 = [[
  
 Players: ]]
              L11_2 = L6_2
              L12_2 = "/"
              L13_2 = queueConfig
              L13_2 = L13_2.Discord
              L13_2 = L13_2.MaxPlayers
              L14_2 = " - ID: "
              L15_2 = L3_2
              L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2
              L7_2(L8_2)
            end
          end
        end
      end
    end
  end
  L7_1(L8_1)
end
