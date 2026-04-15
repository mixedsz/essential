local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = busConfig
L0_1 = L0_1.Enable
if L0_1 then
  ESX = nil
  QBCore = nil
  L0_1 = nil
  L1_1 = nil
  L2_1 = nil
  L3_1 = CreateThread
  function L4_1()
    local L0_2, L1_2, L2_2
    L0_2 = L0_1
    if L0_2 then
      return
    end
    L0_2 = GetResourceState
    L1_2 = "es_extended"
    L0_2 = L0_2(L1_2)
    if "started" == L0_2 then
      L0_2 = "ESX"
      if L0_2 then
        goto lbl_30
      end
    end
    L0_2 = GetResourceState
    L1_2 = "crm-core"
    L0_2 = L0_2(L1_2)
    if "started" == L0_2 then
      L0_2 = "ESX"
      if L0_2 then
        goto lbl_30
      end
    end
    L0_2 = GetResourceState
    L1_2 = "qb-core"
    L0_2 = L0_2(L1_2)
    if "started" == L0_2 then
      L0_2 = "QB"
      if L0_2 then
        goto lbl_30
      end
    end
    L0_2 = nil
    ::lbl_30::
    L0_1 = L0_2
    L0_2 = L0_1
    if not L0_2 then
      return
    end
    L0_2 = L0_1
    if "ESX" == L0_2 then
      L0_2 = exports
      L1_2 = frameworkConfig
      L1_2 = L1_2.FrameworkExport
      L0_2 = L0_2[L1_2]
      L1_2 = L0_2
      L0_2 = L0_2.getSharedObject
      L0_2 = L0_2(L1_2)
      ESX = L0_2
      L0_2 = ESX
      L0_2 = L0_2.GetPlayerData
      L0_2 = L0_2()
      L1_1 = L0_2
      while true do
        L0_2 = L1_1
        if L0_2 then
          L0_2 = L1_1.job
          if L0_2 then
            break
          end
        end
        L0_2 = Wait
        L1_2 = 100
        L0_2(L1_2)
        L0_2 = ESX
        L0_2 = L0_2.GetPlayerData
        L0_2 = L0_2()
        L1_1 = L0_2
      end
      L0_2 = RegisterNetEvent
      L1_2 = "esx:setJob"
      function L2_2(A0_3)
        local L1_3
        L1_1.job = A0_3
      end
      L0_2(L1_2, L2_2)
    else
      L0_2 = L0_1
      if "QB" == L0_2 then
        L0_2 = exports
        L0_2 = L0_2["qb-core"]
        L1_2 = L0_2
        L0_2 = L0_2.GetCoreObject
        L0_2 = L0_2(L1_2)
        QBCore = L0_2
        L0_2 = QBCore
        L0_2 = L0_2.Functions
        L0_2 = L0_2.GetPlayerData
        L0_2 = L0_2()
        L1_1 = L0_2
        L0_2 = RegisterNetEvent
        L1_2 = "QBCore:Client:OnJobUpdate"
        function L2_2(A0_3)
          local L1_3
          L1_1.job = A0_3
        end
        L0_2(L1_2, L2_2)
      end
    end
  end
  L3_1(L4_1)
  L3_1 = CreateThread
  function L4_1()
    local L0_2, L1_2
    while true do
      L0_2 = L0_1
      if L0_2 then
        break
      end
      L0_2 = Wait
      L1_2 = 500
      L0_2(L1_2)
    end
    L0_2 = L0_1
    if "ESX" == L0_2 then
      L0_2 = "qtarget"
      L2_1 = L0_2
    else
      L0_2 = "qb-target"
      L2_1 = L0_2
    end
  end
  L3_1(L4_1)
  L3_1 = AddEventHandler
  L4_1 = "adminplus_busstop:goToStop"
  function L5_1(A0_2)
    local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
    L1_2 = A0_2.bus
    L2_2 = A0_2.stop
    L3_2 = busConfig
    L3_2 = L3_2.BusStops
    L3_2 = L3_2[L1_2]
    L3_2 = L3_2[L2_2]
    L3_2 = L3_2.coords
    L4_2 = busConfig
    L4_2 = L4_2.BusStops
    L4_2 = L4_2[L1_2]
    L4_2 = L4_2[L2_2]
    L4_2 = L4_2.heading
    L5_2 = cache
    L5_2 = L5_2.ped
    L6_2 = L0_1
    if "ESX" == L6_2 then
      L6_2 = ESX
      L6_2 = L6_2.TriggerServerCallback
      L7_2 = "adminplus_bus:checkMoney"
      function L8_2(A0_3)
        local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
        if A0_3 then
          L1_3 = RequestCollisionAtCoord
          L2_3 = L3_2.x
          L3_3 = L3_2.y
          L4_3 = L3_2.z
          L1_3(L2_3, L3_3, L4_3)
          while true do
            L1_3 = HasCollisionLoadedAroundEntity
            L2_3 = L5_2
            L1_3 = L1_3(L2_3)
            if L1_3 then
              break
            end
            L1_3 = Wait
            L1_3()
          end
          L1_3 = DoScreenFadeOut
          L2_3 = 3000
          L1_3(L2_3)
          L1_3 = busConfig
          L1_3 = L1_3.OxLibProgress
          if L1_3 then
            while true do
              L1_3 = IsScreenFadedOut
              L1_3 = L1_3()
              if L1_3 then
                break
              end
              L1_3 = ProgressBar
              L1_3()
            end
          else
            while true do
              L1_3 = IsScreenFadedOut
              L1_3 = L1_3()
              if L1_3 then
                break
              end
              L1_3 = Wait
              L2_3 = busConfig
              L2_3 = L2_3.TeleportTime
              L1_3(L2_3)
            end
          end
          L1_3 = DoScreenFadeIn
          L2_3 = 1500
          L1_3(L2_3)
          L1_3 = SetEntityCoords
          L2_3 = L5_2
          L3_3 = L3_2.x
          L4_3 = L3_2.y
          L5_3 = L3_2.z
          L6_3 = false
          L7_3 = false
          L8_3 = false
          L9_3 = false
          L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3)
          L1_3 = SetEntityHeading
          L2_3 = L5_2
          L3_3 = L4_2
          if L3_3 then
            L3_3 = L4_2
            if L3_3 then
              goto lbl_62
            end
          end
          L3_3 = 0.0
          ::lbl_62::
          L1_3(L2_3, L3_3)
          L1_3 = ClearPedTasksImmediately
          L2_3 = PlayerPedId
          L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3 = L2_3()
          L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3)
        end
      end
      L6_2(L7_2, L8_2)
      L6_2 = L0_1
      if "QB" == L6_2 then
        L6_2 = QBCore
        L6_2 = L6_2.Functions
        L6_2 = L6_2.TriggerCallback
        L7_2 = "adminplus_bus:checkMoneyqb"
        function L8_2(A0_3)
          local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
          if A0_3 then
            L1_3 = RequestCollisionAtCoord
            L2_3 = L3_2.x
            L3_3 = L3_2.y
            L4_3 = L3_2.z
            L1_3(L2_3, L3_3, L4_3)
            while true do
              L1_3 = HasCollisionLoadedAroundEntity
              L2_3 = L5_2
              L1_3 = L1_3(L2_3)
              if L1_3 then
                break
              end
              L1_3 = Wait
              L1_3()
            end
            L1_3 = DoScreenFadeOut
            L2_3 = 3000
            L1_3(L2_3)
            L1_3 = busConfig
            L1_3 = L1_3.OxLibProgress
            if L1_3 then
              while true do
                L1_3 = IsScreenFadedOut
                L1_3 = L1_3()
                if L1_3 then
                  break
                end
                L1_3 = ProgressBar
                L1_3()
              end
            else
              while true do
                L1_3 = IsScreenFadedOut
                L1_3 = L1_3()
                if L1_3 then
                  break
                end
                L1_3 = Wait
                L2_3 = busConfig
                L2_3 = L2_3.TeleportTime
                L1_3(L2_3)
              end
            end
            L1_3 = DoScreenFadeIn
            L2_3 = 1500
            L1_3(L2_3)
            L1_3 = SetEntityCoords
            L2_3 = L5_2
            L3_3 = L3_2.x
            L4_3 = L3_2.y
            L5_3 = L3_2.z
            L6_3 = false
            L7_3 = false
            L8_3 = false
            L9_3 = false
            L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3)
            L1_3 = SetEntityHeading
            L2_3 = L5_2
            L3_3 = L4_2
            if L3_3 then
              L3_3 = L4_2
              if L3_3 then
                goto lbl_62
              end
            end
            L3_3 = 0.0
            ::lbl_62::
            L1_3(L2_3, L3_3)
            L1_3 = ClearPedTasksImmediately
            L2_3 = PlayerPedId
            L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3 = L2_3()
            L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3)
          end
        end
        L6_2(L7_2, L8_2)
      end
    end
  end
  L3_1(L4_1, L5_1)
  L3_1 = AddEventHandler
  L4_1 = "adminplus_busstop:noAccess"
  function L5_1()
    local L0_2, L1_2, L2_2
    L0_2 = lib
    L0_2 = L0_2.notify
    L1_2 = {}
    L2_2 = busConfig
    L2_2 = L2_2.Text
    L2_2 = L2_2.NoAccessTitle
    L1_2.title = L2_2
    L2_2 = busConfig
    L2_2 = L2_2.Text
    L2_2 = L2_2.NoAccessDescription
    L1_2.description = L2_2
    L1_2.type = "error"
    L0_2(L1_2)
  end
  L3_1(L4_1, L5_1)
  L3_1 = AddEventHandler
  L4_1 = "adminplus_busstop:openMenu"
  function L5_1(A0_2)
    local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
    L1_2 = A0_2.bus
    L2_2 = A0_2.stop
    L3_2 = busConfig
    L3_2 = L3_2.BusStops
    L3_2 = L3_2[L1_2]
    L4_2 = {}
    L5_2 = pairs
    L6_2 = L3_2
    L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
    for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
      if L9_2 == L2_2 then
        L11_2 = table
        L11_2 = L11_2.insert
        L12_2 = L4_2
        L13_2 = {}
        L14_2 = L10_2.title
        L15_2 = " (Current)"
        L14_2 = L14_2 .. L15_2
        L13_2.title = L14_2
        L14_2 = L10_2.description
        L13_2.description = L14_2
        L13_2.event = ""
        L11_2(L12_2, L13_2)
      else
        L11_2 = L10_2.groups
        if L11_2 then
          L11_2 = nil
          L12_2 = 1
          L13_2 = L10_2.groups
          L13_2 = #L13_2
          L14_2 = 1
          for L15_2 = L12_2, L13_2, L14_2 do
            L16_2 = L1_1.job
            L16_2 = L16_2.name
            L17_2 = L10_2.groups
            L17_2 = L17_2[L15_2]
            if L16_2 == L17_2 then
              L11_2 = true
            end
          end
          if L11_2 then
            L12_2 = table
            L12_2 = L12_2.insert
            L13_2 = L4_2
            L14_2 = {}
            L15_2 = L10_2.title
            L14_2.title = L15_2
            L15_2 = L10_2.description
            L14_2.description = L15_2
            L14_2.event = "adminplus_busstop:goToStop"
            L15_2 = {}
            L15_2.bus = L1_2
            L15_2.stop = L9_2
            L14_2.args = L15_2
            L12_2(L13_2, L14_2)
          else
            L12_2 = table
            L12_2 = L12_2.insert
            L13_2 = L4_2
            L14_2 = {}
            L15_2 = L10_2.title
            L14_2.title = L15_2
            L15_2 = L10_2.description
            L14_2.description = L15_2
            L14_2.event = "adminplus_busstop:noAccess"
            L12_2(L13_2, L14_2)
          end
        else
          L11_2 = L10_2.groups
          if not L11_2 then
            L11_2 = table
            L11_2 = L11_2.insert
            L12_2 = L4_2
            L13_2 = {}
            L14_2 = L10_2.title
            L13_2.title = L14_2
            L14_2 = L10_2.description
            L13_2.description = L14_2
            L13_2.event = "adminplus_busstop:goToStop"
            L14_2 = {}
            L14_2.bus = L1_2
            L14_2.stop = L9_2
            L13_2.args = L14_2
            L11_2(L12_2, L13_2)
          else
            L11_2 = table
            L11_2 = L11_2.insert
            L12_2 = L4_2
            L13_2 = {}
            L14_2 = L10_2.title
            L13_2.title = L14_2
            L14_2 = L10_2.description
            L13_2.description = L14_2
            L13_2.event = "adminplus_busstop:noAccess"
            L11_2(L12_2, L13_2)
          end
        end
      end
    end
    L5_2 = lib
    L5_2 = L5_2.registerContext
    L6_2 = {}
    L6_2.id = "bus_menu"
    L6_2.title = "Bus Stops"
    L6_2.options = L4_2
    L5_2(L6_2)
    L5_2 = lib
    L5_2 = L5_2.showContext
    L6_2 = "bus_menu"
    L5_2(L6_2)
  end
  L3_1(L4_1, L5_1)
  L3_1 = pairs
  L4_1 = busConfig
  L4_1 = L4_1.BusStops
  L3_1, L4_1, L5_1, L6_1 = L3_1(L4_1)
  for L7_1, L8_1 in L3_1, L4_1, L5_1, L6_1 do
    L9_1 = {}
    L10_1 = 1888204845
    L11_1 = 2142033519
    L12_1 = 1681727376
    L9_1[1] = L10_1
    L9_1[2] = L11_1
    L9_1[3] = L12_1
    L10_1 = exports
    L10_1 = L10_1.ox_target
    L11_1 = L10_1
    L10_1 = L10_1.addModel
    L12_1 = L9_1
    L13_1 = {}
    L14_1 = {}
    L14_1.event = "adminplus_busstop:openMenu"
    L14_1.icon = "fa-solid fa-hand"
    L15_1 = busConfig
    L15_1 = L15_1.Text
    L15_1 = L15_1.Interact
    L14_1.label = L15_1
    L15_1 = {}
    L16_1 = busConfig
    L16_1 = L16_1.Item
    L15_1[1] = L16_1
    L14_1.items = L15_1
    L14_1.bus = L7_1
    L13_1[1] = L14_1
    L10_1(L11_1, L12_1, L13_1)
  end
end
