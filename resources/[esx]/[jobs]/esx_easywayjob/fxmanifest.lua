fx_version 'adamant'
games { 'gta5' }

client_scripts {
	'@es_extended/locale.lua',
	'cs.lua',
	"config.lua",
	'blips.lua',
	'vaults.lua',
	"client.lua",
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'cs.lua',
	'config.lua',
	'server.lua'
}

dependency 'es_extended'