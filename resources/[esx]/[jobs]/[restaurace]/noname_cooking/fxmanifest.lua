fx_version 'adamant'
games { 'gta5' }

version '1.0.0'

client_scripts {
	'@es_extended/locale.lua',
	'locales/cs.lua',
	'config/config.lua',
	'config/steakhouse/recepty.lua',
	'config/steakhouse/shopy.lua',
	'config/zensai/recepty.lua',
	'config/zensai/shopy.lua',
	'config/coffee/recepty.lua',
	'config/coffee/shopy.lua',
	'client/main.lua',
}

server_scripts {
	'@es_extended/locale.lua',
	'locales/cs.lua',
	'config/config.lua',
	'config/steakhouse/recepty.lua',
	'config/steakhouse/shopy.lua',
	'config/zensai/recepty.lua',
	'config/zensai/shopy.lua',
	'config/coffee/recepty.lua',
	'config/coffee/shopy.lua',
	'server/main.lua',
}

