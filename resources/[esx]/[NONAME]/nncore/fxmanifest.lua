fx_version 'adamant'
games {'gta5'}


ui_page 'index.html'

files {
    'index.html',
}

client_scripts {
    '@es_extended/locale.lua',
    'locales/cs.lua',
    'config.lua',
    'client/vehicles.lua',
    'client/vehicleRewards.lua',
    'client/escMenu.lua',
    'client/gpsPhone.lua',
    'client/keepVehicleOpen.lua',
    'client/klicenka.lua',
    'client/f4menu.lua',
    'client/rollWindows.lua',
    'client/gpslocs.lua',
    'client/pointZero.lua',
    'client/smsNotify.lua',
    'client/parachuteHeight.lua',
    'client/underwaterBreath.lua',
    'client/kotva.lua',
    -- 'client/pouta.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    '@es_extended/locale.lua',
    'locales/cs.lua',
    'config.lua',
    'server/vehicles.lua',
    'server/gpsPhone.lua',
    'server/klicenka.lua',
    'server/anmoney.lua',
    'server/moneyHash.lua',
    'server/gpslocs.lua',
    'server/pointZero.lua',
    'server/outfits.lua',
    'server/fractionsPay.lua',
    -- 'server/pouta.lua'
}