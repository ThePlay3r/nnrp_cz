local ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

ESX.RegisterServerCallback('gpslocs:getCustomLocations', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.Async.fetchAll('SELECT * FROM gpslocations WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier,
	}, function(result)
		if #result then
			cb(result)
		else
			cb({})
		end
	end)
end)

ESX.RegisterServerCallback('gpslocs:saveCustomLocation', function(source, cb, label, coords)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.execute('INSERT INTO gpslocations (identifier, label, location) VALUES (@identifier, @label, @location)', {
		['@identifier'] = xPlayer.identifier,
		['@label'] = label,
		['@location'] = coords
	}, function(rowsChanged)
		if rowsChanged > 0 then
			cb(true)
		else
			cb(false)
		end
	end)
end)


ESX.RegisterServerCallback('gpslocs:deleteCustomLocation', function(source, cb, id)
	local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.Async.execute('DELETE FROM gpslocations WHERE identifier = @identifier AND id = @id', {
		['@identifier'] = xPlayer.identifier,
		['@id'] = id,
	}, function(rowsChanged)
		if rowsChanged > 0 then
			cb(true)
		else
			cb(false)
		end
	end)
end)