fx_version 'adamant'
games { 'gta5' }

version '1.0.0'

client_scripts {
	'@es_extended/locale.lua',
	'locales/cs.lua',
	
	'config/config.lua',
	'config/blips.lua',
	'config/clothes.lua',
	'config/keys.lua',
	'config/vehicles.lua',
	'config/crafting.lua',

	'config/markers/zones.lua',
	'config/markers/vaults.lua',
	'config/markers/shops.lua',
		
	'client/menu/cloakroom.lua',
	'client/menu/shop.lua',
	'client/menu/societyActions.lua',
	'client/menu/vehicles.lua',

	'client/vaults/fridge.lua',
	'client/vaults/vault.lua',
	'client/vaults/stocks.lua',
	'client/vaults/weapons.lua',

	'client/doAnimation.lua',
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
	'config/crafting.lua',

	'config/markers/zones.lua',
	'config/markers/vaults.lua',
	'config/markers/shops.lua',

	'server/vaults/fridge.lua',
	'server/vaults/vault.lua',
	'server/vaults/weapons.lua',

	'server/main.lua',
	'server/buyItems.lua',
	'server/crafting.lua',
	'server/sell.lua',
}

