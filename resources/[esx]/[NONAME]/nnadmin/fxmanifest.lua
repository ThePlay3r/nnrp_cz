fx_version 'adamant'
games { 'gta5' }

client_scripts {
    '@es_extended/locale.lua',
    'locales/cs.lua',
    'config.lua',
    -- TOOLS
    'tools/adminchat/client.lua',
    'tools/adminTag/client.lua',
    'tools/coords/client.lua',
    'tools/playerIds/client.lua',
    'tools/spectate/client.lua',
    'tools/tpa/client.lua',
    'tools/tpm/client.lua',
    'tools/warnings/client.lua',
    'tools/adminMenu/client.lua',
    -- COMMANDS
    'commands/noclip/client.lua',
    'commands/kill/c_kill.lua',
    'commands/freeze/client.lua',
    'commands/pm/client.lua',
    'commands/vehdeleter/client.lua',
    'commands/clother/client.lua',
    'commands/userControl/client.lua',
    'commands/car/client.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    '@es_extended/locale.lua',
    'locales/cs.lua',
    'config.lua',
    -- SERVER
    'server/main.lua',
    -- TOOLS
    'tools/adminchat/server.lua',
    'tools/adminTag/server.lua',
    'tools/coords/server.lua',
    'tools/playerIds/server.lua',
    'tools/spectate/server.lua',
    'tools/tpa/server.lua',
    'tools/tpm/server.lua',
    'tools/warnings/server.lua',
    'tools/adminMenu/server.lua',
    -- COMMANDS
    'commands/announce/server.lua',
    'commands/report/server.lua',
    'commands/heal/server.lua',
    'commands/revive/server.lua',
    'commands/setters/s_setgroup.lua',
    'commands/kill/s_die.lua',
    'commands/kill/s_slay.lua',
    'commands/kill/s_slap.lua',
    'commands/kick/server.lua',
    'commands/pm/server.lua',
    'commands/money/server.lua',
    'commands/noclip/server.lua',
    'commands/freeze/server.lua',
    'commands/teleports/s_bring.lua',
    'commands/teleports/s_goto.lua',
    'commands/vehdeleter/server.lua',
    'commands/clother/server.lua',
    'commands/userControl/server.lua',
    'commands/car/server.lua',
}

shared_scripts {
    'config.lua',
    'shared/discord.lua'
}

dependency 'es_extended'