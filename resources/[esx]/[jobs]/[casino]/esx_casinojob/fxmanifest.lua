fx_version 'adamant'
games { 'gta5' }

version '1.0.0'

client_scripts {
	'@es_extended/locale.lua',
	'locales/cs.lua',
	
	'config/config.lua',
	'config/clothes.lua',
	'config/keys.lua',
	'config/vehicles.lua',

	'config/markers/zones.lua',
	'config/markers/vaults.lua',
		
	'client/menu/cloakroom.lua',
	'client/menu/societyActions.lua',
	'client/menu/vehicles.lua',

	'client/vaults/fridge.lua',
	'client/vaults/vault.lua',
	'client/vaults/stocks.lua',
	'client/vaults/weapons.lua',
	'client/blips.lua',
	'client/main.lua',
}

server_scripts {
	'@es_extended/locale.lua',
	'locales/cs.lua',

	'config/config.lua',
	'config/blips.lua',
	'config/clothes.lua',
	'config/keys.lua',
	'config/vehicles.lua',

	'config/markers/zones.lua',
	'config/markers/vaults.lua',

	'server/vaults/fridge.lua',
	'server/vaults/vault.lua',
	'server/vaults/weapons.lua',

	'server/main.lua'
}

