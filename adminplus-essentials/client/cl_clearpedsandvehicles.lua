local L0_1, L1_1, L2_1
L0_1 = clearpedsandvehiclesConfig
L0_1 = L0_1.Enable
if L0_1 then
  L0_1 = clearpedsandvehiclesConfig
  L0_1 = L0_1.ClearPedsAndVehicle
  L1_1 = CreateThread
  function L2_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
    while true do
      L0_2 = GetEntityCoords
      L1_2 = PlayerPedId
      L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L1_2()
      L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
      L1_2 = 1500
      L2_2 = pairs
      L3_2 = L0_1
      L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
      for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
        L8_2 = L7_2.coords
        L8_2 = L0_2 - L8_2
        L8_2 = #L8_2
        L9_2 = L7_2.radius
        if L8_2 < L9_2 then
          L9_2 = ClearAreaOfVehicles
          L10_2 = L7_2.coords
          L11_2 = L7_2.radius
          L9_2(L10_2, L11_2)
          L9_2 = ClearAreaOfPeds
          L10_2 = L7_2.coords
          L11_2 = L7_2.radius
          L12_2 = 1
          L9_2(L10_2, L11_2, L12_2)
          L1_2 = 8
        end
      end
      L2_2 = Wait
      L3_2 = L1_2
      L2_2(L3_2)
    end
  end
  L1_1(L2_1)
end
