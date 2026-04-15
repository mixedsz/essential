local L0_1, L1_1, L2_1
L0_1 = blipsConfig
L0_1 = L0_1.Enable
if L0_1 then
  L0_1 = blipsConfig
  L0_1 = L0_1.Blips
  L1_1 = Citizen
  L1_1 = L1_1.CreateThread
  function L2_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
    L0_2 = pairs
    L1_2 = L0_1
    L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
    for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
      L6_2 = AddBlipForCoord
      L7_2 = L5_2.x
      L8_2 = L5_2.y
      L9_2 = L5_2.z
      L6_2 = L6_2(L7_2, L8_2, L9_2)
      L5_2.blip = L6_2
      L6_2 = SetBlipSprite
      L7_2 = L5_2.blip
      L8_2 = L5_2.id
      L6_2(L7_2, L8_2)
      L6_2 = SetBlipDisplay
      L7_2 = L5_2.blip
      L8_2 = 2
      L6_2(L7_2, L8_2)
      L6_2 = SetBlipScale
      L7_2 = L5_2.blip
      L8_2 = L5_2.scale
      L6_2(L7_2, L8_2)
      L6_2 = SetBlipColour
      L7_2 = L5_2.blip
      L8_2 = L5_2.colour
      L6_2(L7_2, L8_2)
      L6_2 = SetBlipAsShortRange
      L7_2 = L5_2.blip
      L8_2 = true
      L6_2(L7_2, L8_2)
      L6_2 = BeginTextCommandSetBlipName
      L7_2 = "STRING"
      L6_2(L7_2)
      L6_2 = AddTextComponentString
      L7_2 = L5_2.title
      L6_2(L7_2)
      L6_2 = EndTextCommandSetBlipName
      L7_2 = L5_2.blip
      L6_2(L7_2)
    end
  end
  L1_1(L2_1)
end
