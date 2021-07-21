local ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

RegisterServerEvent('esx_casinojob:getStockItem')
AddEventHandler('esx_casinojob:getStockItem', function(itemName, count)
  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_casino', function(inventory)
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

ESX.RegisterServerCallback('esx_casinojob:getStockItems', function(source, cb)
  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_casino', function(inventory)
	cb(inventory.items)
  end)
end)

RegisterServerEvent('esx_casinojob:putStockItems')
AddEventHandler('esx_casinojob:putStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)
  local sourceItem = xPlayer.getInventoryItem(itemName)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_casino', function(inventory)

	local inventoryItem = inventory.getItem(itemName)

	if sourceItem.count >= count and count > 0 then
	  xPlayer.removeInventoryItem(itemName, count)
	  inventory.addItem(itemName, count)
	else
	  TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
	end

	TriggerClientEvent('esx:showNotification', xPlayer.source, _U('added') .. count .. ' ' .. item.label)

  end)

end)