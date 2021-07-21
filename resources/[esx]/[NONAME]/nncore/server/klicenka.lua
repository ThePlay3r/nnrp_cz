local ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

RegisterServerEvent('nncore:getPlayerKeys')
AddEventHandler('nncore:getPlayerKeys', function()
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

	TriggerClientEvent("nncore:openKeysMenu", source, keys)
end)

RegisterServerEvent('nncore:getPlayerRemotes')
AddEventHandler('nncore:getPlayerRemotes', function()
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

	TriggerClientEvent("nncore:openRemotesMenu", source, remotes)
end)