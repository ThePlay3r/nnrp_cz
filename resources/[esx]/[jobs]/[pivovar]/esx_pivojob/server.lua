local ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)


TriggerEvent('esx_phone:registerNumber', 'pivovar', 'pivovar', true, true)

TriggerEvent('esx_society:registerSociety', 'pivovar', 'pivovar', 'society_pivovar', 'society_pivovar', 'society_pivovar', {type = 'public'})

ESX.RegisterServerCallback('esx_pivovarjob:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	cb({items = xPlayer.inventory})
end)

ESX.RegisterServerCallback('esx_pivovarjob:getFridgeStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pivovar', function(inventory)
		cb(inventory.items)
	end)
end)

RegisterServerEvent('esx_pivovarjob:getFridgeStockItem')
AddEventHandler('esx_pivovarjob:getFridgeStockItem', function(itemName, count)
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pivovar', function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= count then
			inventory.removeItem(itemName, count)
            xPlayer.addInventoryItem(itemName, count)
            local msg = GetPlayerName(_source) .. " vytahl/a ze skladu " .. item.label .. " v mnozstvi " .. count .. "x"
            local url = "https://discordapp.com/api/webhooks/727852009247735928/Il0FFA0y6HQprclj_Op7FQMGVD50J6SUpVMdwCJVpOPmxSnfuxVE3DYE3WB3Xnc6w-pP"
            PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end

		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)
	end)
end)

RegisterServerEvent('esx_pivovarjob:putFridgeStockItems')
AddEventHandler('esx_pivovarjob:putFridgeStockItems', function(itemName, count)
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pivovar', function(inventory)
		local item = inventory.getItem(itemName)
		local playerItemCount = xPlayer.getInventoryItem(itemName).count

		if item.count >= 0 and count <= playerItemCount then
			xPlayer.removeInventoryItem(itemName, count)
            inventory.addItem(itemName, count)
            
            local msg = GetPlayerName(_source) .. " vlozil/a do skladu " .. item.label .. " v mnozstvi " .. count .. "x"
		    local url = "https://discordapp.com/api/webhooks/727852009247735928/Il0FFA0y6HQprclj_Op7FQMGVD50J6SUpVMdwCJVpOPmxSnfuxVE3DYE3WB3Xnc6w-pP"
            PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})

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
        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_pivovar', function(account)
            societyAccount = account
        end)

        if societyAccount ~= nil then
            societyAccount.addMoney(totalCash * 0.55)
            xPlayer.addMoney(totalCash * 0.45)
            xPlayer.showNotification('Prodal/a jsi ' .. itemsSold .. ' vyrobku za ' .. totalCash * 0.45 .. ' pro sebe a ' .. totalCash * 0.55 .. ' pro pivovar.')

            local msg = GetPlayerName(source) .. " prodal/a " .. itemsSold .. " vyrobku za " .. totalCash * 0.45 .. ' pro sebe a ' .. totalCash * 0.55 .. ' pro pivovar.'
		    local url = "https://discordapp.com/api/webhooks/727106454821142529/7ZP-xzBAL5kujlfjOnHTi9R_P5Gq462ETTixUblpU8Hp1cfPWo6PfveZehJegZtkLvrZ"
            PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})

            itemsSold = 0
            totalCash = 0
        end
    end
end

RegisterServerEvent('esx_pivovarjob:startSell')
AddEventHandler('esx_pivovarjob:startSell', function()
	local _source = source
    Sell(_source)
end)

-- TRANSFORMING
local TransformingPlayers = {}

RegisterServerEvent('esx_pivovarjob:startTransform')
AddEventHandler('esx_pivovarjob:startTransform', function(zone)
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
        local fromItem2 = Config.Zones[zone].FromItem2
        local fromItem3 = Config.Zones[zone].FromItem3
        local count1 = Config.Zones[zone].Count1
        local count2 = Config.Zones[zone].Count2
        local count3 = Config.Zones[zone].Count3
        local toItem = Config.Zones[zone].ToItem
        local chmelQ = xPlayer.getInventoryItem(fromItem).count
        local jecmenQ = xPlayer.getInventoryItem(fromItem2).count
        local appleQ = xPlayer.getInventoryItem(fromItem3).count
        local vyrobekQ = xPlayer.getInventoryItem(toItem).count
        local vyrobekL = xPlayer.getInventoryItem(toItem).limit
        
        if vyrobekQ + 1 <= vyrobekL then
            if chmelQ >= count1 and jecmenQ >= count2 and appleQ >= count3 then
                SetTimeout(Config.CookTime, function()
                    if TransformingPlayers[source] == timeHash then
                        xPlayer.removeInventoryItem(fromItem, count1)
                        xPlayer.removeInventoryItem(fromItem2, count2)
                        if count3 == 0 then
                            xPlayer.addInventoryItem(toItem, 1)
                        else
                            xPlayer.removeInventoryItem(fromItem3, count3)
                            xPlayer.addInventoryItem(toItem, 1)
                        end
                        transform(source, xPlayer, timeHash, zone)
                    end
                end)
            else
                xPlayer.showNotification('Nemas dostatek surovin')
                return
            end
        else
            xPlayer.showNotification('Nemas dostatek mista v inventari')
            return
        end
	end
end

RegisterServerEvent('esx_pivovarjob:stopTransform')
AddEventHandler('esx_pivovarjob:stopTransform', function()
    local _source = source
    TransformingPlayers[_source] = false
end)

-- FARMING
local FarmingPlayers = {}


RegisterServerEvent('esx_pivovarjob:startFarming')
AddEventHandler('esx_pivovarjob:startFarming', function(item)
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
        local itemLimit = xPlayer.getInventoryItem(item).limit
        if itemLimit < itemQuantity + 1 then
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

RegisterServerEvent('esx_pivovarjob:stopFarming')
AddEventHandler('esx_pivovarjob:stopFarming', function()
    local _source = source
    FarmingPlayers[_source] = false
end)