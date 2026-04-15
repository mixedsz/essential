-- ============================================================
-- sv_bus.lua | AdminPlus Essentials
-- Server-side callbacks for the bus stop system.
-- Checks player balance and deducts the bus fare.
-- ============================================================

if not busConfig.Enable then return end

-- ── ESX callback ─────────────────────────────────────────────
if frameworkConfig.Framework == "ESX" then
    ESX.RegisterServerCallback("adminplus_bus:checkMoney", function(source, cb)
        local xPlayer = ESX.GetPlayerFromId(source)

        if not xPlayer then
            print(("[AdminPlus | Bus] ERROR: Could not find ESX player for source %d"):format(source))
            return cb(false)
        end

        local fare = busConfig.Price

        if xPlayer.getMoney() >= fare then
            xPlayer.removeMoney(fare)
            print(("[AdminPlus | Bus] Player %s (%d) paid $%d bus fare."):format(xPlayer.getName(), source, fare))
            cb(true)
        else
            print(("[AdminPlus | Bus] Player %s (%d) cannot afford bus fare ($%d)."):format(xPlayer.getName(), source, fare))
            cb(false)
        end
    end)

-- ── QB callback ───────────────────────────────────────────────
elseif frameworkConfig.Framework == "QB" then
    QBCore.Functions.CreateCallback("adminplus_bus:checkMoneyqb", function(source, cb)
        local Player = QBCore.Functions.GetPlayer(source)

        if not Player then
            print(("[AdminPlus | Bus] ERROR: Could not find QB player for source %d"):format(source))
            return cb(false)
        end

        local fare = busConfig.Price

        if Player.PlayerData.money["cash"] >= fare then
            Player.Functions.RemoveMoney("cash", fare, "bus-fare")
            print(("[AdminPlus | Bus] Player %d paid $%d bus fare."):format(source, fare))
            cb(true)
        else
            print(("[AdminPlus | Bus] Player %d cannot afford bus fare ($%d)."):format(source, fare))
            cb(false)
        end
    end)
end
