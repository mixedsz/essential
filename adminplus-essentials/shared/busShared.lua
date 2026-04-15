busConfig = {}

busConfig.Enable = false

--[[

    add this under "description" if you want to job lock who can access what teleport.

    groups = {
        'none',
    },

    example:

        [1] = {
            coords = vec3(57.07, -1539.88, 29.29),
            heading = 45.1057,
            title = 'LSPD',
            description = '',
            groups = {
                'police',
            },
        },

]]

busConfig.Text = {
    ['NoAccessTitle'] = 'No Access',
    ['NoAccessDescription'] = 'You do not have access to this bus stop.',
    ['Interact'] = 'Interact'
}

--  ____                                                      ____                 
-- |  _ \   _ __    ___     __ _   _ __    ___   ___   ___    | __ )    __ _   _ __ 
-- | |_) | | '__|  / _ \   / _` | | '__|  / _ \ / __| / __|   |  _ \   / _` | | '__|
-- |  __/  | |    | (_) | | (_| | | |    |  __/ \__ \ \__ \   | |_) | | (_| | | |   
-- |_|     |_|     \___/   \__, | |_|     \___| |___/ |___/   |____/   \__,_| |_|   
--                         |___/                                                    

busConfig.TeleportTime = 10000

busConfig.OxLibProgress = true

function ProgressBar()
    if busConfig.OxLibProgress then
        lib.progressCircle({
            label = "Taking a Bus",
            duration = busConfig.TeleportTime,
            position = 'bottom',
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
            },
        })
    else
        -- export here
        print("taking a bus")
    end
end

-- ____                    ____    _                         
-- | __ )   _   _   ___    / ___|  | |_    ___    _ __    ___ 
-- |  _ \  | | | | / __|   \___ \  | __|  / _ \  | '_ \  / __|
-- | |_) | | |_| | \__ \    ___) | | |_  | (_) | | |_) | \__ \
-- |____/   \__,_| |___/   |____/   \__|  \___/  | .__/  |___/
--                                               |_|          

busConfig.Price = 25

-- used to be able to third eye the bus stops
busConfig.Item = 'lametro'

busConfig.BusStops = {
    Busses = { -- Bus Stop
        [1] = {
            coords = vec3(-1166.4708, -3298.7832, 101.1001),
            heading = 321.33,
            title = 'E Marquette RD',
            description = '',
        },
        [2] = {
            coords = vec3(-531.9120, -3575.8044, 101.0971),
            heading = 45.1057,
            title = 'E 133rd ST',
            description = '',
        },
        [3] = {
            coords = vec3(-788.8786, -2687.1113, 101.0974),
            heading = 0.0,
            title = 'W 18th ST',
            description = '',
        },
        [4] = {
            coords = vec3(-1214.73, -1218.43, 7.69),
            heading = 0.0,
            title = 'S Western Ave',
            description = '',
        },
        [5] = {
            coords = vec3(-1937.2482, -2282.5627, 101.1012),
            heading = 0.0,
            title = 'W 24th ST',
            description = '',
        },
        [6] = {
            coords = vec3(-2358.7883, -2725.5310, 101.1011),
            heading = 0.0,
            title = 'S Wentworth Ave',
            description = '',
            groups = {
                'police',
            },
        },
    },
}