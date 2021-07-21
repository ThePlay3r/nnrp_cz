local ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)


TriggerEvent('esx_phone:registerNumber', 'farma', 'Farma', true, true)

TriggerEvent('esx_society:registerSociety', 'farma', 'Farma', 'society_farma', 'society_farma', 'society_farma', {type = 'public'})

ESX.RegisterServerCallback('esx_farmajob:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	cb({items = xPlayer.inventory})
end)

ESX.RegisterServerCallback('esx_farmajob:getFridgeStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_farma', function(inventory)
		cb(inventory.items)
	end)
end)

function logSklad (text, source)
	local time = os.date("%d.%m.%Y %X")
	local name = GetPlayerName(source)
	local identifier = GetPlayerIdentifiers(source)
	local msg = time .. ' : ' .. name .. ' - ' .. identifier[1] .. ' : ' .. text
	local url = "https://discordapp.com/api/webhooks/740071918413152327/nsO9P3xf5DheBh24l3J-2iFLbpiF6EBqaiwWSEvtKQkM3z1WFQ6ft12yqiF7qXOc2lRS"
	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end

RegisterServerEvent('esx_farmajob:getFridgeStockItem')
AddEventHandler('esx_farmajob:getFridgeStockItem', function(itemName, count)
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_farma', function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= count then
			inventory.removeItem(itemName, count)
            xPlayer.addInventoryItem(itemName, count)
            logSklad("vytahl **" .. item.label .. "** v mnozstvi **x" .. count .. "**", _source)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end

		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)
	end)
end)

RegisterServerEvent('esx_farmajob:putFridgeStockItems')
AddEventHandler('esx_farmajob:putFridgeStockItems', function(itemName, count)
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_farma', function(inventory)
		local item = inventory.getItem(itemName)
		local playerItemCount = xPlayer.getInventoryItem(itemName).count

		if item.count >= 0 and count <= playerItemCount then
			xPlayer.removeInventoryItem(itemName, count)
            inventory.addItem(itemName, count)
            logSklad("vlozil **" .. item.label .. "** v mnozstvi **x" .. count .. "**", _source)
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
        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_farma', function(account)
            societyAccount = account
        end)

        if societyAccount ~= nil then
            societyAccount.addMoney(totalCash * 0.55)
            xPlayer.addMoney(totalCash * 0.45)
            xPlayer.showNotification('Prodal/a jsi ' .. itemsSold .. ' vyrobku za ' .. totalCash * 0.45 .. ' pro sebe a ' .. totalCash * 0.55 .. ' pro farmu.')

            local msg = GetPlayerName(source) .. " prodal/a " .. itemsSold .. " vyrobku za " .. totalCash * 0.45 .. ' pro sebe a ' .. totalCash * 0.55 .. ' pro farmu.'
		    local url = "https://discordapp.com/api/webhooks/720620068177707149/YCvBmNQwBL1LH-vSuo_XFun9UqM-Aq7-5mBlXx2NQUEzUNiSaMouLyg8myqVjb3pWJwE"
            PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})

            itemsSold = 0
            totalCash = 0
        end
    end
end

RegisterServerEvent('esx_farmajob:startSell')
AddEventHandler('esx_farmajob:startSell', function()
	local _source = source
    Sell(_source)
end)


-- FARMING
local FarmingPlayers = {}


RegisterServerEvent('esx_farmajob:startFarming')
AddEventHandler('esx_farmajob:startFarming', function(item)
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

RegisterServerEvent('esx_farmajob:stopFarming')
AddEventHandler('esx_farmajob:stopFarming', function()
    local _source = source
    FarmingPlayers[_source] = false
end)