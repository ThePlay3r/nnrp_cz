fx_version 'adamant'
games { 'gta5' }

version '1.0.0'

client_scripts {
	'@es_extended/locale.lua',
	'locales/cs.lua',
	'config/config.lua',

	'client/main.lua',
}

server_scripts {
	'@es_extended/locale.lua',
	'locales/cs.lua',
	'config/config.lua',
	
	'server/main.lua',
}

