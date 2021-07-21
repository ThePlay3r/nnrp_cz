local ESX = nil
local CarPrices = {}

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)


TriggerEvent('esx_phone:registerNumber', 'bazar', 'Bazar', true, true)

TriggerEvent('esx_society:registerSociety', 'bazar', 'Bazar', 'society_bazar', 'society_bazar', 'society_bazar', {type = 'public'})

ESX.RegisterServerCallback('esx_bazarjob:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	cb({items = xPlayer.inventory})
end)

ESX.RegisterServerCallback('esx_bazarjob:getFridgeStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_bazar', function(inventory)
		cb(inventory.items)
	end)
end)

RegisterServerEvent('esx_bazarjob:getFridgeStockItem')
AddEventHandler('esx_bazarjob:getFridgeStockItem', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_bazar', function(inventory)
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


RegisterServerEvent('esx_bazarjob:putFridgeStockItems')
AddEventHandler('esx_bazarjob:putFridgeStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_bazar', function(inventory)
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

RegisterServerEvent('esx_bazarjob:sendDiagnostic')
AddEventHandler('esx_bazarjob:sendDiagnostic', function(diagnostic)
	TriggerClientEvent('esx_bazarjob:sendDiagnostic', -1, diagnostic)
end)

RegisterServerEvent('esx_bazarjob:sendCarPrices')
AddEventHandler('esx_bazarjob:sendCarPrices', function(prices)
	CarPrices = prices
	TriggerClientEvent('esx_bazarjob:sendCarPrices', -1, prices)
end)

ESX.RegisterServerCallback('esx_bazarjob:getCarPrices', function(source, cb)
	cb(CarPrices)
end)

RegisterServerEvent('esx_bazarjob:sendDobropis')
AddEventHandler('esx_bazarjob:sendDobropis', function(target, amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xTarget = ESX.GetPlayerFromId(target)

	local societyAccount = nil

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_bazar' , function(account)
        societyAccount = account
	end)
	
	societyAccount.removeMoney(amount)
	xTarget.addAccountMoney('bank', amount)
	xPlayer.showNotification("Odeslal/a jsi dobropis na $" .. amount)
	xTarget.showNotification("Obdrzel/a jsi dobropis na $" .. amount)
	sendDobropisLog(_source, target, amount)
end)

function sendDobropisLog (source, target, amount)
    local time = os.date("%d/%m/%Y %X")
	local name = GetPlayerName(source)
	local identifier = GetPlayerIdentifiers(source)
	local msg = time .. ' : ' .. name .. ' - ' .. identifier[1] .. ' : vydal dobropis na $' .. amount .. ' pro ' .. GetPlayerName(target)
	local url = 'https://discordapp.com/api/webhooks/721700757736521819/3U1SayUV1O5bcwTqz8LCbaaSHsb2Lawui73Ojf7b8jhXm7M0XE0ylVzy7o7TE4SLdQ3t'
	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end