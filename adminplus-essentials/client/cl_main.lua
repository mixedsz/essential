-- ============================================================
-- cl_main.lua | AdminPlus Essentials
-- Freeze props (traffic lights, gas pumps, street lights, etc.)
-- when a player is inside a vehicle so they cannot be knocked
-- over / destroyed, preventing dsync and lag.
-- ============================================================

if not freezeConfig.Enable then return end

-- ── Object enumerator ─────────────────────────────────────────
local enumeratorMeta = {}
enumeratorMeta.__gc = function(self)
    if self.destructor and self.handle then
        self.destructor(self.handle)
    end
    self.destructor = nil
    self.handle     = nil
end

local function makeEnumerator(initFn, nextFn, destroyFn)
    local co = coroutine.wrap(function()
        local handle, id = initFn()

        if not id or id == 0 then
            destroyFn(handle)
            return
        end

        local obj  = setmetatable({ handle = handle, destructor = destroyFn }, enumeratorMeta)
        local more = true

        repeat
            coroutine.yield(id)
            more, id = nextFn(handle)
        until not more

        obj.handle     = nil
        obj.destructor = nil
        destroyFn(handle)
    end)
    return co
end

local function EnumerateObjects()
    return makeEnumerator(FindFirstObject, FindNextObject, EndFindObject)
end

-- ── Build hash lookup table for configured prop models ────────
local propHashes = {}
for _, modelName in ipairs(freezeConfig.Props) do
    propHashes[GetHashKey(modelName)] = true
end

-- ── Main freeze loop ──────────────────────────────────────────
Citizen.CreateThread(function()
    while true do
        -- Only run the expensive object scan while the player is in a vehicle
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            for obj in EnumerateObjects() do
                local modelHash = GetEntityModel(obj)

                if propHashes[modelHash] then
                    FreezeEntityPosition(obj, true)
                    SetEntityCanBeDamaged(obj, false)
                end
            end
        end

        Citizen.Wait(500)
    end
end)