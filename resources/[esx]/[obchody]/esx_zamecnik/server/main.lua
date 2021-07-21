local ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

RegisterServerEvent('zamecnik:getPlayerKeys')
AddEventHandler('zamecnik:getPlayerKeys', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local allItems = xPlayer.getInventory()
	local keys = {}

	for k, v in pairs(allItems) do
		if v.count > 0 and string.match(v.name, "key") and v.name ~= 'keycardweapon' then
			table.insert(keys, {
				value = v.name,
				label = v.label,
			})
		end
	end

	TriggerClientEvent("zamecnik:openItemsMenu", source, keys, 'Klíče')
end)

RegisterServerEvent('zamecnik:getPlayerRemotes')
AddEventHandler('zamecnik:getPlayerRemotes', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local allItems = xPlayer.getInventory()
	local remotes = {}

	for k, v in pairs(allItems) do
		if v.count > 0 and string.match(v.name, "remote") then
			table.insert(remotes, {
				value = v.name,
				label = v.label,
			})
		end
	end

	TriggerClientEvent("zamecnik:openItemsMenu", source, remotes, 'Dálkové ovladače')
end)

RegisterServerEvent('zamecnik:copyItem')
AddEventHandler('zamecnik:copyItem', function(item)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = 10000
	
	if not string.match(item, "key_weed") and not string.match(item, "key_pracka") then
		xPlayer.removeAccountMoney('bank', price)
		xPlayer.addInventoryItem(item, 1)
		xPlayer.showNotification('Zamecnik: tady mas ten novy klic')
		discordLog(source, "namnozil klic " .. item)
	else
		xPlayer.showNotification('Zamecnik: tyhle klice jsou tezke na duplikaci, s tim ti nepomuzu')
	end
end)

function discordLog (source, text)
	local url = 'https://discordapp.com/api/webhooks/719247508894777384/_1NVOAHFEdjmOaDZbptDAmfbp2cyR5gtGvRLct_60oIBwTqVk6sWo6IQiJnlE11WeQ6c'
	local time = os.date("%d.%m.%Y %X")
	local name = GetPlayerName(source)
	local identifier = GetPlayerIdentifiers(source)
	local msg = time .. ' : ' .. name .. ' - ' .. identifier[1] .. ' : ' .. text
	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end