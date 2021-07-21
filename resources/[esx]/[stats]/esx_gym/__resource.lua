resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

server_scripts {
  '@es_extended/locale.lua',
  '@mysql-async/lib/MySQL.lua',
  'config.lua',
  'server/main.lua'
}

client_scripts {
  '@es_extended/locale.lua',
  'config.lua',
  'client/util.lua',
  'client/main.lua',
  'client/blips.lua'
}
