local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = freezeConfig
L0_1 = L0_1.Enable
if L0_1 then
  L0_1 = {}
  function L1_1(A0_2)
    local L1_2, L2_2
    L1_2 = A0_2.destructor
    if L1_2 then
      L1_2 = A0_2.handle
      if L1_2 then
        L1_2 = A0_2.destructor
        L2_2 = A0_2.handle
        L1_2(L2_2)
      end
    end
    A0_2.destructor = nil
    A0_2.handle = nil
  end
  L0_1.__gc = L1_1
  function L1_1(A0_2, A1_2, A2_2)
    local L3_2, L4_2
    L3_2 = coroutine
    L3_2 = L3_2.wrap
    function L4_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
      L0_3 = A0_2
      L0_3, L1_3 = L0_3()
      if not L1_3 or 0 == L1_3 then
        L2_3 = A2_2
        L3_3 = L0_3
        L2_3(L3_3)
        return
      end
      L2_3 = {}
      L2_3.handle = L0_3
      L3_3 = A2_2
      L2_3.destructor = L3_3
      L3_3 = setmetatable
      L4_3 = L2_3
      L5_3 = L0_1
      L3_3(L4_3, L5_3)
      L3_3 = true
      repeat
        L4_3 = coroutine
        L4_3 = L4_3.yield
        L5_3 = L1_3
        L4_3(L5_3)
        L4_3 = A1_2
        L5_3 = L0_3
        L4_3, L5_3 = L4_3(L5_3)
        L1_3 = L5_3
        L3_3 = L4_3
      until not L3_3
      L4_3 = nil
      L2_3.handle = nil
      L2_3.destructor = L4_3
      L4_3 = A2_2
      L5_3 = L0_3
      L4_3(L5_3)
    end
    return L3_2(L4_2)
  end
  function L2_1()
    local L0_2, L1_2, L2_2, L3_2
    L0_2 = L1_1
    L1_2 = FindFirstObject
    L2_2 = FindNextObject
    L3_2 = EndFindObject
    return L0_2(L1_2, L2_2, L3_2)
  end
  EnumerateObjects = L2_1
  L2_1 = freezeConfig
  L2_1 = L2_1.Props
  L3_1 = Citizen
  L3_1 = L3_1.CreateThread
  function L4_1()
    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
    L0_2 = {}
    L1_2 = GetVehiclePedIsIn
    L2_2 = PlayerPedId
    L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = L2_2()
    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
    L2_2 = 1
    L3_2 = L2_1
    L3_2 = #L3_2
    L4_2 = 1
    for L5_2 = L2_2, L3_2, L4_2 do
      L6_2 = GetHashKey
      L7_2 = L2_1
      L7_2 = L7_2[L5_2]
      L6_2 = L6_2(L7_2)
      L0_2[L6_2] = true
    end
    while true do
      L2_2 = IsPedInAnyVehicle
      L3_2 = PlayerPedId
      L3_2 = L3_2()
      L4_2 = false
      L2_2 = L2_2(L3_2, L4_2)
      if L2_2 then
        L2_2 = EnumerateObjects
        L2_2, L3_2, L4_2, L5_2 = L2_2()
        for L6_2 in L2_2, L3_2, L4_2, L5_2 do
          L7_2 = GetEntityModel
          L8_2 = L6_2
          L7_2 = L7_2(L8_2)
          L7_2 = L0_2[L7_2]
          if L7_2 then
            L7_2 = FreezeEntityPosition
            L8_2 = L6_2
            L9_2 = true
            L7_2(L8_2, L9_2)
            L7_2 = SetEntityCanBeDamaged
            L8_2 = L6_2
            L9_2 = false
            L7_2(L8_2, L9_2)
          end
        end
      end
      L2_2 = Citizen
      L2_2 = L2_2.Wait
      L3_2 = 500
      L2_2(L3_2)
    end
  end
  L3_1(L4_1)
end
