local ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)


TriggerEvent('esx_phone:registerNumber', 'lost', 'Lost', true, true)

TriggerEvent('esx_society:registerSociety', 'lost', 'Lost', 'society_lost', 'society_lost', 'society_lost', {type = 'public'})

ESX.RegisterServerCallback('esx_lostjob:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	cb({items = xPlayer.inventory})
end)

ESX.RegisterServerCallback('esx_lostjob:getFridgeStockItems', function(source, cb, society)
	local societyName = 'society_lost'
	if society then
		societyName = society
	end
	TriggerEvent('esx_addoninventory:getSharedInventory', societyName, function(inventory)
		cb(inventory.items)
	end)
end)

RegisterServerEvent('esx_lostjob:getFridgeStockItem')
AddEventHandler('esx_lostjob:getFridgeStockItem', function(itemName, count, society)
	local xPlayer = ESX.GetPlayerFromId(source)
	local societyName = 'society_lost'
	if society then
		societyName = society
	end

	TriggerEvent('esx_addoninventory:getSharedInventory', societyName, function(inventory)
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

RegisterServerEvent('esx_lostjob:putFridgeStockItems')
AddEventHandler('esx_lostjob:putFridgeStockItems', function(itemName, count, society)
	local xPlayer = ESX.GetPlayerFromId(source)
	local societyName = 'society_lost'
	if society then
		societyName = society
	end

	TriggerEvent('esx_addoninventory:getSharedInventory', societyName, function(inventory)
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


-- ZBROJKA
ESX.RegisterServerCallback('esx_lostjob:removeArmoryWeapon', function(source, cb, weaponName)

	local xPlayer = ESX.GetPlayerFromId(source)
  
	xPlayer.addWeapon(weaponName, 250)
  
	TriggerEvent('esx_datastore:getSharedDataStore', 'society_lost', function(store)
  
	  local weapons = store.get('weapons')
  
	  if weapons == nil then
		weapons = {}
	  end
  
	  local foundWeapon = false
  
	  for i=1, #weapons, 1 do
		if weapons[i].name == weaponName then
		  weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
		  foundWeapon = true
		end
	  end
  
	  if not foundWeapon then
		table.insert(weapons, {
		  name  = weaponName,
		  count = 0
		})
	  end
  
	   store.set('weapons', weapons)
  
	   cb()
  
	end)
  
  end)
  
  ESX.RegisterServerCallback('esx_lostjob:getArmoryWeapons', function(source, cb)

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_lost', function(store)
  
	  local weapons = store.get('weapons')
  
	  if weapons == nil then
		weapons = {}
	  end
  
	  cb(weapons)
  
	end)
  
  end)

  
ESX.RegisterServerCallback('esx_lostjob:addArmoryWeapon', function(source, cb, weaponName)

	local xPlayer = ESX.GetPlayerFromId(source)
  
	xPlayer.removeWeapon(weaponName)
  
	TriggerEvent('esx_datastore:getSharedDataStore', 'society_lost', function(store)
  
	  local weapons = store.get('weapons')
  
	  if weapons == nil then
		weapons = {}
	  end
  
	  local foundWeapon = false
  
	  for i=1, #weapons, 1 do
		if weapons[i].name == weaponName then
		  weapons[i].count = weapons[i].count + 1
		  foundWeapon = true
		end
	  end
  
	  if not foundWeapon then
		table.insert(weapons, {
		  name  = weaponName,
		  count = 1
		})
	  end
  
	   store.set('weapons', weapons)
  
	   cb()
  
	end)
  
  end)