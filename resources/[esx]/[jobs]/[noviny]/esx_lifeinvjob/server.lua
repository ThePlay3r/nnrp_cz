local ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)


TriggerEvent('esx_phone:registerNumber', 'lifeinvader', 'Lifeinvader', true, true)

TriggerEvent('esx_society:registerSociety', 'lifeinvader', 'Lifeinvader', 'society_lifeinvader', 'society_lifeinvader', 'society_lifeinvader', {type = 'public'})

ESX.RegisterServerCallback('esx_lifeinvaderjob:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	cb({items = xPlayer.inventory})
end)

ESX.RegisterServerCallback('esx_lifeinvaderjob:getFridgeStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_lifeinvader', function(inventory)
		cb(inventory.items)
	end)
end)

RegisterServerEvent('esx_lifeinvaderjob:getFridgeStockItem')
AddEventHandler('esx_lifeinvaderjob:getFridgeStockItem', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_lifeinvader', function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= count then
			inventory.removeItem(itemName, count)
			xPlayer.addInventoryItem(itemName, count)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end

		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)
	end)
end)

RegisterServerEvent('esx_lifeinvaderjob:putFridgeStockItems')
AddEventHandler('esx_lifeinvaderjob:putFridgeStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_lifeinvader', function(inventory)
		local item = inventory.getItem(itemName)
		local playerItemCount = xPlayer.getInventoryItem(itemName).count

		if item.count >= 0 and count <= playerItemCount then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
		end

		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. item.label)
	end)
end)