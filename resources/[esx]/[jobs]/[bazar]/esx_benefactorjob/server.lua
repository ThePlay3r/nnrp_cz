local ESX = nil
local CarPrices = {}

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)


TriggerEvent('esx_phone:registerNumber', 'benefactor', 'Benefactor', true, true)

TriggerEvent('esx_society:registerSociety', 'benefactor', 'Benefactor', 'society_benefactor', 'society_benefactor', 'society_benefactor', {type = 'public'})

ESX.RegisterServerCallback('esx_benefactorjob:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	cb({items = xPlayer.inventory})
end)

local isOpened = false

RegisterServerEvent('esx_benefactorjob:handleOpenSign')
AddEventHandler('esx_benefactorjob:handleOpenSign', function()
	isOpened = not isOpened
	TriggerClientEvent('esx_benefactorjob:handleOpenSign', -1, isOpened)
end)

ESX.RegisterServerCallback('esx_benefactorjob:getOpenSign', function(source, cb)
	cb(isOpened)
end)

ESX.RegisterServerCallback('esx_benefactorjob:getFridgeStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_benefactor', function(inventory)
		cb(inventory.items)
	end)
end)

RegisterServerEvent('esx_benefactorjob:getFridgeStockItem')
AddEventHandler('esx_benefactorjob:getFridgeStockItem', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_benefactor', function(inventory)
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


RegisterServerEvent('esx_benefactorjob:putFridgeStockItems')
AddEventHandler('esx_benefactorjob:putFridgeStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_benefactor', function(inventory)
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

RegisterServerEvent('esx_benefactorjob:sendDiagnostic')
AddEventHandler('esx_benefactorjob:sendDiagnostic', function(diagnostic)
	TriggerClientEvent('esx_benefactorjob:sendDiagnostic', -1, diagnostic)
end)

RegisterServerEvent('esx_benefactorjob:sendCarPrices')
AddEventHandler('esx_benefactorjob:sendCarPrices', function(prices)
	CarPrices = prices
	TriggerClientEvent('esx_benefactorjob:sendCarPrices', -1, prices)
end)

ESX.RegisterServerCallback('esx_benefactorjob:getCarPrices', function(source, cb)
	cb(CarPrices)
end)

RegisterServerEvent('esx_benefactorjob:sendDobropis')
AddEventHandler('esx_benefactorjob:sendDobropis', function(target, amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xTarget = ESX.GetPlayerFromId(target)

	local societyAccount = nil

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_benefactor' , function(account)
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
	local url = 'https://discordapp.com/api/webhooks/730073011184730162/LoBdOe6mcYpLnDYC5hm3pW50IDhEjEn-65hOPSBZG6gWZJOnLHQ8n2l-DSHrFir5gbKX'
	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end