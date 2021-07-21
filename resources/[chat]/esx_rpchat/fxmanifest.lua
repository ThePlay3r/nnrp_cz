fx_version 'adamant'
games { 'gta5' }

client_scripts {
  'client/main.lua',
}

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  '@es_extended/locale.lua',
  'locales/cs.lua',
  'config.lua',
  'server/main.lua'
}

dependency 'es_extended'