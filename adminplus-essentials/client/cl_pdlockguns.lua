local L0_1, L1_1, L2_1, L3_1
L0_1 = restrictedpolicegunsConfig
L0_1 = L0_1.RestrictedPoliceGuns
L1_1 = restrictedpolicegunsConfig
L1_1 = L1_1.Enable
if L1_1 then
  L1_1 = AddEventHandler
  L2_1 = "ox_inventory:currentWeapon"
  function L3_1(A0_2)
    local L1_2, L2_2
    L1_2 = A0_2
    if L1_2 then
      L1_2 = L1_2.name
    end
    L2_2 = L0_1
    L1_2 = L2_2[L1_2]
    if L1_2 then
      L1_2 = ESX
      L1_2 = L1_2.PlayerData
      L1_2 = L1_2.job
      L1_2 = L1_2.name
      if "police" ~= L1_2 then
        L1_2 = TriggerEvent
        L2_2 = "ox_inventory:disarm"
        L1_2(L2_2)
        L1_2 = TriggerServerEvent
        L2_2 = "whyyou:gotagun"
        L1_2(L2_2)
      end
    end
  end
  L1_1(L2_1, L3_1)
end
