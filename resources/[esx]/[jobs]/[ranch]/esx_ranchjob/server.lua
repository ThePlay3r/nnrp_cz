local ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)


TriggerEvent('esx_phone:registerNumber', 'ranch', 'Ranch', true, true)

TriggerEvent('esx_society:registerSociety', 'ranch', 'Ranch', 'society_ranch', 'society_ranch', 'society_ranch', {type = 'public'})

ESX.RegisterServerCallback('esx_ranchjob:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	cb({items = xPlayer.inventory})
end)

RegisterServerEvent('esx_ranchjob:getStockItem')
AddEventHandler('esx_ranchjob:getStockItem', function(itemName, count)
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_ranch_boss', function(inventory)

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

ESX.RegisterServerCallback('esx_ranchjob:getStockItems', function(source, cb)
  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_ranch_boss', function(inventory)

    cb(inventory.items)
  end)
end)

RegisterServerEvent('esx_ranchjob:putStockItems')
AddEventHandler('esx_ranchjob:putStockItems', function(itemName, count)
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_ranch_boss', function(inventory)

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
ESX.RegisterServerCallback('esx_ranchjob:removeArmoryWeapon', function(source, cb, weaponName)

	local xPlayer = ESX.GetPlayerFromId(source)
  
	xPlayer.addWeapon(weaponName, 250)
  
	TriggerEvent('esx_datastore:getSharedDataStore', 'society_ranch', function(store)
  
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
  
  ESX.RegisterServerCallback('esx_ranchjob:getArmoryWeapons', function(source, cb)

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_ranch', function(store)
  
	  local weapons = store.get('weapons')
  
	  if weapons == nil then
		weapons = {}
	  end
  
	  cb(weapons)
  
	end)
  
  end)

  
ESX.RegisterServerCallback('esx_ranchjob:addArmoryWeapon', function(source, cb, weaponName)

	local xPlayer = ESX.GetPlayerFromId(source)
  
	xPlayer.removeWeapon(weaponName)
  
	TriggerEvent('esx_datastore:getSharedDataStore', 'society_ranch', function(store)
  
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

ESX.RegisterServerCallback('esx_ranchjob:getFridgeStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_ranch', function(inventory)
		cb(inventory.items)
	end)
end)

RegisterServerEvent('esx_ranchjob:getFridgeStockItem')
AddEventHandler('esx_ranchjob:getFridgeStockItem', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_ranch', function(inventory)
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

RegisterServerEvent('esx_ranchjob:putFridgeStockItems')
AddEventHandler('esx_ranchjob:putFridgeStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_ranch', function(inventory)
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

local function Sell(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local itemsSold = 0
    local totalCash = 0
    local itemsToSold = Config.Zones['Sell'].Items

    for k,v in ipairs(itemsToSold) do
        if xPlayer.getInventoryItem(v.item) and xPlayer.getInventoryItem(v.item).count > 0 then
            local playerCount = xPlayer.getInventoryItem(v.item).count
            itemsSold = itemsSold + playerCount
            totalCash = totalCash + (playerCount * v.price)
            xPlayer.removeInventoryItem(v.item, playerCount)
        end
    end

    if itemsSold == 0 then
        xPlayer.showNotification('Nemas nic na prodej.')
    else
        local societyAccount = nil
        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_ranch', function(account)
            societyAccount = account
        end)

        if societyAccount ~= nil then
            societyAccount.addMoney(totalCash * 0.55)
            xPlayer.addMoney(totalCash * 0.45)
            xPlayer.showNotification('Prodal/a jsi ' .. itemsSold .. ' vyrobku za ' .. totalCash * 0.45 .. ' pro sebe a ' .. totalCash * 0.55 .. ' pro ranch.')

            local msg = GetPlayerName(source) .. " prodal/a " .. itemsSold .. " vyrobku za " .. totalCash * 0.45 .. ' pro sebe a ' .. totalCash * 0.55 .. ' pro ranch.'
		    local url = "https://discordapp.com/api/webhooks/733321952521093151/WF4v-A1b1pN_uZmskKq-3scq8PO1nIguc_R2WRBDHA6tfAZO77LYOVQXdBACwam4c8MO"
            PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})

            itemsSold = 0
            totalCash = 0
        end
    end
end

RegisterServerEvent('esx_ranchjob:startSell')
AddEventHandler('esx_ranchjob:startSell', function()
	local _source = source
    Sell(_source)
end)


-- FARMING
local FarmingPlayers = {}


RegisterServerEvent('esx_ranchjob:startFarming')
AddEventHandler('esx_ranchjob:startFarming', function(item)
    local _source = source
    
    if not FarmingPlayers[_source] then
        local timeHash = os.time()
        FarmingPlayers[_source] = timeHash

        local xPlayer = ESX.GetPlayerFromId(_source)
        harvest(_source, xPlayer, item, timeHash)
    end
end)


function harvest (source, xPlayer, item, timeHash)
    if FarmingPlayers[source] then
        local itemQuantity = xPlayer.getInventoryItem(item).count
        if itemQuantity >= xPlayer.getInventoryItem(item).limit then
            xPlayer.showNotification(_U('not_enough_place'))
            return
        else
            SetTimeout(Config.HarvestTime, function()
                if FarmingPlayers[source] == timeHash then
                    xPlayer.addInventoryItem(item, 1)
                    harvest(source, xPlayer, item, timeHash)
                end
            end)
        end
	end
end

RegisterServerEvent('esx_ranchjob:stopFarming')
AddEventHandler('esx_ranchjob:stopFarming', function()
    local _source = source
    FarmingPlayers[_source] = false
end)

-- TRANSFORMING
local TransformingPlayers = {}

RegisterServerEvent('esx_ranchjob:startTransform')
AddEventHandler('esx_ranchjob:startTransform', function(zone)
    local _source = source
    
    if not TransformingPlayers[_source] then
        local timeHash = os.time()
        TransformingPlayers[_source] = timeHash

        local xPlayer = ESX.GetPlayerFromId(_source)
        transform(_source, xPlayer, timeHash, zone)
    end
end)


function transform (source, xPlayer, timeHash, zone)
    if TransformingPlayers[source] then
        local fromItem = Config.Zones[zone].FromItem
        local toItem = Config.Zones[zone].ToItem
        local mlekoQ = xPlayer.getInventoryItem(fromItem).count
        local vyrobekQ = xPlayer.getInventoryItem(toItem).count
        local vyrobekL = xPlayer.getInventoryItem(toItem).limit

        if vyrobekQ + 1 <= vyrobekL then
            if mlekoQ >= 3 then
                SetTimeout(Config.CookTime, function()
                    if TransformingPlayers[source] == timeHash then
                        xPlayer.removeInventoryItem(fromItem, 3)
                        xPlayer.addInventoryItem(toItem, 2)
                        transform(source, xPlayer, timeHash, zone)
                    end
                end)
            else
                xPlayer.showNotification('Nemas dostatek mleka')
                return
            end
        else
            xPlayer.showNotification('Nemas dostatek mista v inventari')
            return
        end
	end
end

RegisterServerEvent('esx_ranchjob:stopTransform')
AddEventHandler('esx_ranchjob:stopTransform', function()
    local _source = source
    TransformingPlayers[_source] = false
end)
