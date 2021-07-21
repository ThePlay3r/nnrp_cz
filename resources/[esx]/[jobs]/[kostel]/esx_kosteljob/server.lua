local ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)


TriggerEvent('esx_phone:registerNumber', 'kostel', 'kostel', true, true)

TriggerEvent('esx_society:registerSociety', 'kostel', 'kostel', 'society_kostel', 'society_kostel', 'society_kostel', {type = 'public'})

ESX.RegisterServerCallback('esx_kosteljob:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	cb({items = xPlayer.inventory})
end)

ESX.RegisterServerCallback('esx_kosteljob:getFridgeStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_kostel', function(inventory)
		cb(inventory.items)
	end)
end)

RegisterServerEvent('esx_kosteljob:getFridgeStockItem')
AddEventHandler('esx_kosteljob:getFridgeStockItem', function(itemName, count)
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_kostel', function(inventory)
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

RegisterServerEvent('esx_kosteljob:putFridgeStockItems')
AddEventHandler('esx_kosteljob:putFridgeStockItems', function(itemName, count)
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_kostel', function(inventory)
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
        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_kostel', function(account)
            societyAccount = account
        end)

        if societyAccount ~= nil then
            societyAccount.addMoney(totalCash * 0.70)
            xPlayer.addMoney(totalCash * 0.30)
            xPlayer.showNotification('Prodal/a jsi ' .. itemsSold .. ' vyrobku za ' .. totalCash * 0.40 .. ' pro sebe a ' .. totalCash * 0.60 .. ' pro kostel.')

            local msg = GetPlayerName(source) .. " prodal/a " .. itemsSold .. " vyrobku za " .. totalCash * 0.40 .. ' pro sebe a ' .. totalCash * 0.60 .. ' pro kostel.'
		    local url = "https://discordapp.com/api/webhooks/739034129944805398/HFo7Hh3y2f1rsPfStXpEqM4lgMrqFJwdMP6PWkzRzCa2OD-3SVhe7s17yUMGgbQlBbOM"
            PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})

            itemsSold = 0
            totalCash = 0
        end
    end
end

RegisterServerEvent('esx_kosteljob:startSell')
AddEventHandler('esx_kosteljob:startSell', function()
	local _source = source
    Sell(_source)
end)

-- TRANSFORMING
local TransformingPlayers = {}

RegisterServerEvent('esx_kosteljob:startTransform')
AddEventHandler('esx_kosteljob:startTransform', function()
    local _source = source
    
    if not TransformingPlayers[_source] then
        local timeHash = os.time()
        TransformingPlayers[_source] = timeHash

        local xPlayer = ESX.GetPlayerFromId(_source)
        transform(_source, xPlayer, timeHash)
    end
end)


function transform (source, xPlayer, timeHash)
    if TransformingPlayers[source] then
        local crossQ = xPlayer.getInventoryItem('cross').count
        local ruzenecQ = xPlayer.getInventoryItem('ruzenec').count
        local ruzenecL = xPlayer.getInventoryItem('ruzenec').limit
        
        if ruzenecQ + 1 <= ruzenecL then
            if crossQ >= 7 then
                SetTimeout(Config.CookTime, function()
                    if TransformingPlayers[source] == timeHash then
                        xPlayer.removeInventoryItem('cross', 7)
                        xPlayer.addInventoryItem('ruzenec', 1)
                        transform(source, xPlayer, timeHash)
                    end
                end)
            else
                xPlayer.showNotification('Nemas dostatek krizku')
                return
            end
        else
            xPlayer.showNotification('Nemas dostatek mista v inventari')
            return
        end
	end
end

RegisterServerEvent('esx_kosteljob:stopTransform')
AddEventHandler('esx_kosteljob:stopTransform', function()
    local _source = source
    TransformingPlayers[_source] = false
end)

-- FARMING
local FarmingPlayers = {}


RegisterServerEvent('esx_kosteljob:startFarming')
AddEventHandler('esx_kosteljob:startFarming', function(item)
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

RegisterServerEvent('esx_kosteljob:stopFarming')
AddEventHandler('esx_kosteljob:stopFarming', function()
    local _source = source
    FarmingPlayers[_source] = false
end)