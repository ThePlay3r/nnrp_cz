local ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

TriggerEvent('esx_phone:registerNumber', 'galdin', _U('galdin_customer'), true, true)
TriggerEvent('esx_society:registerSociety', 'galdin', 'galdin', 'society_galdin', 'society_galdin', 'society_galdin', {type = 'private'})

ESX.RegisterServerCallback('esx_galdinjob:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	cb({items = xPlayer.inventory})
end)


local isOpened = false

RegisterServerEvent('esx_galdinjob:handleOpenSign')
AddEventHandler('esx_galdinjob:handleOpenSign', function()
	isOpened = not isOpened
	TriggerClientEvent('esx_galdinjob:handleOpenSign', -1, isOpened)
end)

ESX.RegisterServerCallback('esx_galdinjob:getOpenSign', function(source, cb)
	cb(isOpened)
end)