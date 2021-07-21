-- relisoft.cz
-- Some-RP.cz
-- forum.some-rp.cz

local ESX = nil
local AdminPlayers = {}

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

TriggerEvent('es:addAdminCommand', 'adminTag', 1, function(source, args, user)
    local xPlayer = ESX.GetPlayerFromId(source)
    if AdminPlayers[xPlayer.identifier] == nil then
        AdminPlayers[xPlayer.identifier] = {source = source, permission = xPlayer.getPermissions(), group = xPlayer.getGroup()}
        TriggerClientEvent('relisoft_tag:owned',source, true,xPlayer.getGroup())
        TriggerClientEvent('nnadmin:handleTagIdsChange', source, 'AdminTag', true)
    else
        AdminPlayers[xPlayer.identifier] = nil
        TriggerClientEvent('relisoft_tag:owned',source, false)
        TriggerClientEvent('nnadmin:handleTagIdsChange', source, 'AdminTag', false)
    end
    TriggerClientEvent('relisoft_tag:set_admins',-1,AdminPlayers)
end, function(source, args, user)
    TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Nedostatečné oprávnění!' } })
end, {help = '/tag admin command'})

ESX.RegisterServerCallback('relisoft_tag:getAdminsPlayers',function(source,cb)
    cb(AdminPlayers)
end)

RegisterServerEvent('relisoft_tag:turnTagOn')
AddEventHandler('relisoft_tag:turnTagOn', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if AdminPlayers[xPlayer.identifier] == nil then
        AdminPlayers[xPlayer.identifier] = {source = source, permission = xPlayer.getPermissions(), group = xPlayer.getGroup()}
        TriggerClientEvent('relisoft_tag:owned',source, true,xPlayer.getGroup(), true)
    end
    TriggerClientEvent('relisoft_tag:set_admins',-1,AdminPlayers)
end)

RegisterServerEvent('relisoft_tag:turnTagOff')
AddEventHandler('relisoft_tag:turnTagOff', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if AdminPlayers[xPlayer.identifier] ~= nil then
        AdminPlayers[xPlayer.identifier] = nil
        TriggerClientEvent('relisoft_tag:owned',source, false, true, true)
    end
    TriggerClientEvent('relisoft_tag:set_admins',-1,AdminPlayers)
end)

AddEventHandler('esx:playerDropped', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if AdminPlayers[xPlayer.identifier] ~= nil then
        AdminPlayers[xPlayer.identifier] = nil
    end
    TriggerClientEvent('relisoft_tag:set_admins',-1,AdminPlayers)
end)

ESX.RegisterServerCallback('relisoft_tag:removePlayer',function(source,cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    if AdminPlayers[xPlayer.identifier] ~= nil then
        AdminPlayers[xPlayer.identifier] = nil
    end
    TriggerClientEvent('relisoft_tag:set_admins',-1,AdminPlayers)
    cb()
end)

RegisterNetEvent('relisoft_tag:get_admins')
AddEventHandler('relisoft_tag:get_admins',function(source, cb)
    return cb(AdminPlayers);
end)