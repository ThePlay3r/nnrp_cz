TriggerEvent('es:addGroupCommand', 'entdel', 'helper', function(source, args, user)
    TriggerClientEvent('nnadmin:vehicleDeleterSend', source)
end, function(source, args, user)
    TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, { help = 'Musis namirit na entitu pro smazani' })

RegisterServerEvent('nnadmin:deleteEntityWithNetworkId')
AddEventHandler('nnadmin:deleteEntityWithNetworkId', function(networkId)
    TriggerClientEvent('nnadmin:vehicleDeleter', -1, networkId)
end)