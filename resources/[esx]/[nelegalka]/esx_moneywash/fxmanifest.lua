fx_version 'adamant'
games { 'gta5' }

description 'ESX Money Wash'
version '0.1.2'

client_scripts {

	'@es_extended/locale.lua',
	'locales/cs.lua',
	'config.lua',
	'client/main.lua',

}

server_scripts {

	'@es_extended/locale.lua',
	'locales/cs.lua',
	'config.lua',
	'server/main.lua',

}

dependencies {

    'es_extended',

}