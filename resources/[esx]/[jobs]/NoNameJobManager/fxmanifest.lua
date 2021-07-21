fx_version 'bodacious'
games { 'gta5' }

server_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'configs/*.lua',
	'locales/cs.lua',
	'server/main.lua',
}

client_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'configs/*.lua',
	'locales/cs.lua',
	'client/main.lua',
}

dependencies {
	'es_extended'
}