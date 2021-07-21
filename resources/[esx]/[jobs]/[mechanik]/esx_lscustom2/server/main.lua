ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
local Vehicles = nil

RegisterServerEvent('esx_lscustom2:buyMod')
AddEventHandler('esx_lscustom2:buyMod', function(price)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	price = tonumber(price)

	if Config.IsmecanoJobOnly then
		local societyAccount = nil
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mecano', function(account)
			societyAccount = account
		end)

		if price < societyAccount.money then
			TriggerClientEvent('esx_lscustom2:installMod', _source)
			TriggerClientEvent('esx:showNotification', _source, _U('purchased'))
			societyAccount.removeMoney(price)
		else
			TriggerClientEvent('esx_lscustom2:cancelInstallMod', _source)
			TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
		end
	else
		if price < xPlayer.getMoney() then
			TriggerClientEvent('esx_lscustom2:installMod', _source)
			TriggerClientEvent('esx:showNotification', _source, _U('purchased'))
			xPlayer.removeMoney(price)
		else
			TriggerClientEvent('esx_lscustom2:cancelInstallMod', _source)
			TriggerClientEvent('esx:showNotification', _source, _U('not_enough_money'))
		end

	end
end)

RegisterServerEvent('esx_lscustom2:addInLog')
AddEventHandler('esx_lscustom2:addInLog', function(name, mod, price, spz, vehicleName)
	local msg = 'Zaměstnanec: ' .. name .. '\n Tuning: ' .. mod .. '\n Cena: ' .. price .. '\n SPZ Vozidla: ' .. spz .. '\nVozidlo: ' .. vehicleName
        PerformHttpRequest(Config.LogHook, function(a,b,c)end, "POST", json.encode({embeds={{title="NoName Logy",description=msg:gsub("%^%d",""),color=65280,}}}), {["Content-Type"]="application/json"})
end)

RegisterServerEvent('esx_lscustom2:refreshOwnedVehicle')
AddEventHandler('esx_lscustom2:refreshOwnedVehicle', function(myCar)
	MySQL.Async.execute('UPDATE `owned_vehicles` SET `vehicle` = @vehicle WHERE `plate` = @plate',
	{
		['@plate']   = myCar.plate,
		['@vehicle'] = json.encode(myCar)
	})
end)

ESX.RegisterServerCallback('esx_lscustom2:getVehiclesPrices', function(source, cb)
	if Vehicles == nil then
		MySQL.Async.fetchAll('SELECT * FROM vehicles', {}, function(result)
			local vehicles = {}

			for i=1, #result, 1 do
				local price = result[i].price

				if result[i].category == 'exclusive' then
					price = 25000
				end

				if result[i].category == 'drift' then
					price = 999999
				end

				if result[i].category == 'vip' or result[i].category == 'automesice' then
					price = 40000
				end

				table.insert(vehicles, {
					model = result[i].model,
					price = price
				})
			end

			Vehicles = vehicles
			cb(Vehicles)
		end)
	else
		cb(Vehicles)
	end
end)