local ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

local playerData = {}

-- Open ID card
RegisterServerEvent('emsbadge:open')
AddEventHandler('emsbadge:open', function(ID, targetID, type)
	local identifier = ESX.GetPlayerFromId(ID).identifier
	local _source 	 = ESX.GetPlayerFromId(targetID).source

	if playerData[identifier] then
		local array = playerData[identifier]
		TriggerClientEvent('emsbadge:open', _source, array, type)
		return
	end

	MySQL.Async.fetchAll('SELECT firstname, lastname, dateofbirth, sex, height FROM users WHERE identifier = @identifier', {['@identifier'] = identifier},
	function (user)
		if (user[1] ~= nil) then
			MySQL.Async.fetchAll('SELECT type FROM user_licenses WHERE owner = @identifier', {['@identifier'] = identifier},
			function (licenses)
				local array = {
					user = user,
					licenses = licenses
				}
				playerData[identifier] = array
				TriggerClientEvent('emsbadge:open', _source, array, type)
			end)
		end
	end)
end)

ESX.RegisterServerCallback('emsbadge:getItemAmount', function(source, cb, item)
    local xPlayer = ESX.GetPlayerFromId(source)
    local qtty = xPlayer.getInventoryItem(item).count
    cb(qtty)
end)