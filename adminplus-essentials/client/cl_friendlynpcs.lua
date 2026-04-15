-- ============================================================
-- cl_friendlynpcs.lua | AdminPlus Essentials
-- Sets relationship group values so ambient NPCs treat the
-- player as neutral / friendly instead of attacking on sight.
-- Hashes correspond to GTA V NPC gang/faction relationship groups.
-- ============================================================

if not friendlynpcsConfig.Enable then return end

-- Relationship value 1 = "Respect" (neutral/friendly — will not attack)
-- 1862763509 = GetHashKey("PLAYER") — the player's own group

local playerGroup = 1862763509
local npcGroups = {
    -1285976420,  -- AMBIENT_GANG_LOST
    -1033021910,  -- AMBIENT_GANG_BALLAS
     296331235,   -- AMBIENT_GANG_VAGOS
     1166638144,  -- AMBIENT_GANG_SALVA
     2037579709,  -- AMBIENT_GANG_MARAUDE
    -1821475077,  -- AMBIENT_GANG_CULT
    -1865950624,  -- AMBIENT_GANG_WEICHENG
     1126561930,  -- AMBIENT_GANG_HILLBILLY
     299800060,   -- AMBIENT_GANG_RACIST
    -1916596797,  -- AMBIENT_GANG_PRISONER
     230631217,   -- AMBIENT_GANG_ALTRUIST
    -64182425,    -- AMBIENT_GANG_SECURITY
    -1337836896,  -- HATES_PLAYER
    -1533126372,  -- AMBIENT_GANG_CHINESE
     2124571506,  -- AMBIENT_GANG_KOREAN
}

for _, groupHash in ipairs(npcGroups) do
    SetRelationshipBetweenGroups(1, groupHash, playerGroup)
end