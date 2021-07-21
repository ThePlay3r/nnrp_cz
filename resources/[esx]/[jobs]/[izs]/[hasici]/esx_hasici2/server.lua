local ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

local function Sell(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local itemsSold = 0
    local totalCash = 0
    local itemsToSold = Config.Zones['Sell'].Items

	for k,v in ipairs(itemsToSold) do
        if xPlayer.hasWeapon(v.item:upper()) then
            local playerCount = 1
            itemsSold = itemsSold + playerCount
            totalCash = totalCash + (playerCount * v.price)
            xPlayer.removeWeapon(v.item:upper())
        end
    end

    if itemsSold == 0 then
        xPlayer.showNotification('Nemas nic na prodej.')
    else
        local societyAccount = nil
        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_hasici', function(account)
            societyAccount = account
        end)

        if societyAccount ~= nil then
            societyAccount.addMoney(totalCash * 0.60)
            xPlayer.addMoney(totalCash * 0.40)
            xPlayer.showNotification('Prodal/a jsi ' .. itemsSold .. ' vyrobku za ' .. totalCash * 0.40 .. ' pro sebe a ' .. totalCash * 0.60 .. ' pro firmu.')

            local msg = GetPlayerName(source) .. " prodal/a " .. itemsSold .. " vyrobku za " .. totalCash * 0.40 .. ' pro sebe a ' .. totalCash * 0.60 .. ' pro firmu.'
		    local url = "https://discordapp.com/api/webhooks/732961295183380608/Dp6jnz-P-yvwKGRXE3zRn5mnihvCkzlFS2RcFWku1VaW3XevtgiRQYHieTJGOKv_sKK9"
            PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})

            itemsSold = 0
            totalCash = 0
        end
    end
end

RegisterServerEvent('esx_hasici2:startSell')
AddEventHandler('esx_hasici2:startSell', function()
	local _source = source
    Sell(_source)
end)


-- FARMING
local FarmingPlayers = {}


RegisterServerEvent('esx_hasici2:startFarming')
AddEventHandler('esx_hasici2:startFarming', function(item)
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

RegisterServerEvent('esx_hasici2:stopFarming')
AddEventHandler('esx_hasici2:stopFarming', function()
    local _source = source
    FarmingPlayers[_source] = false
end)

RegisterNetEvent('esx_hasicijob:craftHasicak')
AddEventHandler('esx_hasicijob:craftHasicak', function()
	local xPlayer    = ESX.GetPlayerFromId(source)
    local weaponName = string.upper('WEAPON_FIREEXTINGUISHER')
    local copper = xPlayer.getInventoryItem('copper')
    local gaz = xPlayer.getInventoryItem('gazbottle')
    local requiredCopper = Config.CopperReq
    local requiredGaz = Config.GazReq
    
    if copper.count >= requiredCopper and gaz.count >= requiredGaz then
        if xPlayer.hasWeapon(weaponName) then
            xPlayer.showNotification("Neuneses vic hasicaku")
        else
            xPlayer.removeInventoryItem('copper', requiredCopper)
            xPlayer.removeInventoryItem('gazbottle', requiredGaz)
            xPlayer.addWeapon(weaponName, tonumber(2000))
            xPlayer.showNotification("Vyrobil/a si hasici pristroj")
        end
    else
        xPlayer.showNotification("Nemas dostatek materialu")
    end
end)


-- SKLAD
ESX.RegisterServerCallback('esx_hasici2:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	cb({items = xPlayer.inventory})
end)

ESX.RegisterServerCallback('esx_hasici2:getFridgeStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_hasici', function(inventory)
		cb(inventory.items)
	end)
end)

RegisterServerEvent('esx_hasici2:getFridgeStockItem')
AddEventHandler('esx_hasici2:getFridgeStockItem', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_hasici', function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= count then
			inventory.removeItem(itemName, count)
			xPlayer.addInventoryItem(itemName, count)
			SkladLog(source, "vytahl/a ze skladu " .. item.label .. " v mnozstvi x" .. count)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end

		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)
	end)
end)

RegisterServerEvent('esx_hasici2:putFridgeStockItems')
AddEventHandler('esx_hasici2:putFridgeStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_hasici', function(inventory)
		local item = inventory.getItem(itemName)
		local playerItemCount = xPlayer.getInventoryItem(itemName).count

		if item.count >= 0 and count <= playerItemCount then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			SkladLog(source, "vlozil/a do skladu " .. item.label .. " v mnozstvi x" .. count)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
		end

		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. item.label)
	end)
end)

ESX.RegisterServerCallback('esx_hasici2:removeArmoryWeapon', function(source, cb, weaponName)

	local xPlayer = ESX.GetPlayerFromId(source)
  
	xPlayer.addWeapon(weaponName, 250)
	SkladLog(source, "vytahl/a ze zbrojnice zbran" .. weaponName)
  
	TriggerEvent('esx_datastore:getSharedDataStore', 'society_hasici', function(store)
  
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
  
  ESX.RegisterServerCallback('esx_hasici2:getArmoryWeapons', function(source, cb)

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_hasici', function(store)
  
	  local weapons = store.get('weapons')
  
	  if weapons == nil then
		weapons = {}
	  end
  
	  cb(weapons)
  
	end)
  
  end)

  
ESX.RegisterServerCallback('esx_hasici2:addArmoryWeapon', function(source, cb, weaponName)

	local xPlayer = ESX.GetPlayerFromId(source)
  
	xPlayer.removeWeapon(weaponName)
	SkladLog(source, "vlozil/a do zbrojnice zbran" .. weaponName)
  
	TriggerEvent('esx_datastore:getSharedDataStore', 'society_hasici', function(store)
  
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


function SkladLog (source, text)
	local url = 'https://discordapp.com/api/webhooks/733668804256858172/a8NzGPbXHY52_VAOISfOAEdwxQNvliueHyXGwrirXw9f3fl76X4gkF-62tUWnWwbp9IY'
	local time = os.date("%d.%m.%Y %X")
	local name = GetPlayerName(source)
	local identifier = GetPlayerIdentifiers(source)
	local msg = time .. ' : ' .. name .. ' - ' .. identifier[1] .. ' : ' .. text
	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end