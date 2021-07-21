TriggerEvent('es:addGroupCommand', 'sendgps', 'user', function(source, args, user)
	TriggerClientEvent('gpsPhone:sendGPS', source, args[1])
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = 'Odeslat GPS pozici pres SMS', params = {{
    name = "TELEFONNI CISLO",
}}})

TriggerEvent('es:addGroupCommand', 'servertime', 'helper', function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Server time: ' .. os.time() } })
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = 'Vrati serverovy cas'})