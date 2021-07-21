ESX = nil
local playersHealing = {}
local PeopleInsurance = {}

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

RegisterServerEvent('esx_ambulancejob:reILovePizzavive')
AddEventHandler('esx_ambulancejob:reILovePizzavive', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'ambulance' then
		xPlayer.addMoney(Config.ReviveReward)
		TriggerClientEvent('esx_ambulancejob:reILovePizzavive', target)
		TriggerClientEvent('mythic_hospital:client:ResetLimbs', target)
		TriggerClientEvent('mythic_hospital:client:RemoveBleed', target)
	else
		print(('esx_ambulancejob: %s attempted to revive!'):format(xPlayer.identifier))
	end
end)

RegisterServerEvent('esx_ambulancejob:heal')
AddEventHandler('esx_ambulancejob:heal', function(target, type)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'ambulance' then
		TriggerClientEvent('esx_ambulancejob:heal', target, type)
		TriggerClientEvent('mythic_hospital:client:ResetLimbs', target, type)
		TriggerClientEvent('mythic_hospital:client:RemoveBleed', target, type)
	else
		print(('esx_ambulancejob: %s attempted to heal!'):format(xPlayer.identifier))
	end
end)

RegisterServerEvent('esx_ambulancejob:putInVehicle')
AddEventHandler('esx_ambulancejob:putInVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'ambulance' then
		TriggerClientEvent('esx_ambulancejob:putInVehicle', target)
	else
		print(('esx_ambulancejob: %s attempted to put in vehicle!'):format(xPlayer.identifier))
	end
end)

--[[
Citizen.CreateThread(function()
    Citizen.Wait(1000)
    TriggerClientEvent("CUSTOM_esx_ambulance:playCPR", 4)
end)
]]

function sendDiscordLog (url, source, text)
	local time = os.date("%d.%m.%Y %X")
	local name = GetPlayerName(source)
	local identifier = GetPlayerIdentifiers(source)
	local msg = time .. ' : ' .. name .. ' - ' .. identifier[1] .. ' : ' .. text
	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end

RegisterServerEvent('esx_ambulancejob:sendCekarnaLog')
AddEventHandler('esx_ambulancejob:sendCekarnaLog', function()
	local _source = source
	local url = 'https://discordapp.com/api/webhooks/732653164846645288/yBj3WN3cAu1VaS1ZTLsMC_MpQ6Xx0r-J65Ar7wAxVjqXdcw83aovN0pP0rFngGXReoRt'
	sendDiscordLog(url, _source, "se prihlasil/a na recepci do cekarny")
end)

RegisterServerEvent('esx_ambulancejob:handlePassiveDoctor')
AddEventHandler('esx_ambulancejob:handlePassiveDoctor', function(price, time)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local url = 'https://discordapp.com/api/webhooks/732655185683415112/-yWbJOeEm1T7L3rTag2M6MR1lGwTNvgmgrQpBztj2EVI6IkLqs3AzOY-soYOLP176yeV'
	sendDiscordLog(url, _source, "se nechal osetrit zalozakem. Doba: **" .. tonumber(time / 1000) .. "** sekund za cenu **" .. price .. '**')
	local societyAccount = nil

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_galdin' , function(account)
        societyAccount = account
    end)

	xPlayer.showNotification("Zaplatil/a jsi poplatek $" .. price .. " za osetreni")
	xPlayer.removeAccountMoney("bank", price)
	societyAccount.addMoney(price)
	TriggerClientEvent("esx_ambulancejob:handlePassiveDoctor", _source, time)
end)


-- INSURANCE
function sendInsuranceInfo (text)
	local time = os.date("%d.%m.%Y %X")
	local url = 'https://discordapp.com/api/webhooks/733705712726835210/D5kO6QWCwlXq4U85HfuPCeBUdb_RFk8HNUuKfiB8qluUVUDwxeBHVn2YhCXpzBO-X4Hx'
	local msg = time .. ' : ' .. text
	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end

MySQL.ready(function()
	MySQL.Async.fetchAll('SELECT * FROM emsinsurance', {}, function(result)
		local serverTime = os.time()
		for i=1, #result, 1 do
			PeopleInsurance[result[i].identifier] = result[i]
			local timeDiff = tonumber(result[i]['endDate']) - serverTime
			if timeDiff < 86400 and timeDiff > 0 then
				sendInsuranceInfo('Pacientovi/pacientce ' .. result[i].name .. ' bude jiz brzy koncit pojisteni ' .. os.date("%d/%m/%Y %X", result[i]['endDate']))
			end
			if timeDiff <= 0 then
				MySQL.Async.execute('DELETE from emsinsurance WHERE identifier = @identifier', {
					['@identifier'] = result[i].identifier
				}, function(rowsChanged)
				end)
			end
		end
	end)
end)

ESX.RegisterServerCallback('esx_ambulancejob:getinsurance', function(source, cb, target)
	local xTarget = ESX.GetPlayerFromId(target)
	cb(PeopleInsurance[xTarget.identifier])
end)

ESX.RegisterServerCallback('esx_ambulancejob:getinsurancever', function(source, cb, target)
	local xTarget = ESX.GetPlayerFromId(source)
	cb(PeopleInsurance[xTarget.identifier])
end)

ESX.RegisterServerCallback('esx_ambulancejob:getinsurancedate', function(source, cb)
	local xTarget = ESX.GetPlayerFromId(source)
	cb(PeopleInsurance[xTarget.identifier])
	if not PeopleInsurance[xTarget.identifier] then
		cb(nil)
	else
		cb(os.date("%d/%m/%Y %X", PeopleInsurance[xTarget.identifier]['endDate']))
	end
end)

RegisterServerEvent('esx_ambulancejob:giveinsurance')
AddEventHandler('esx_ambulancejob:giveinsurance', function(target, length, company)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xTarget = ESX.GetPlayerFromId(target)
	local timeLength = {
		week = 7 * 86400,
		month = 28 * 86400,
	}
	local targetCompany = nil

	if company then
		targetCompany = xTarget.job.label
	end

	if PeopleInsurance[xTarget.identifier] then
		local newEndDate = PeopleInsurance[xTarget.identifier]['endDate'] + timeLength[length]
		MySQL.Async.execute('UPDATE emsinsurance SET endDate = @endDate WHERE identifier = @identifier', {
			['@endDate']      = newEndDate,
			['@identifier'] = xTarget.identifier
		}, function(rowsChanged)
			if rowsChanged > 0 then
				xPlayer.showNotification('Pojisteni prodlouzeno')
				PeopleInsurance[xTarget.identifier]['endDate'] = newEndDate
				sendInsuranceInfo('Pacientovi/pacientce ' .. PeopleInsurance[xTarget.identifier].name .. ' bylo prodlouzeno pojisteni do ' .. os.date("%d/%m/%Y %X", PeopleInsurance[xTarget.identifier]['endDate']))
			else
				xPlayer.showNotification('Pojisteni se nepodarilo prodlouzit')
			end
		end)
	else
		MySQL.Async.fetchAll('SELECT firstname, lastname FROM users WHERE `identifier` = @identifier;', {identifier = xTarget.identifier}, function(users)
			if users[1] then
				local endDate = os.time() + timeLength[length]
				local fullName = users[1].firstname .. ' ' .. users[1].lastname
				MySQL.Async.execute('INSERT INTO emsinsurance (`identifier`, `name`, `company`, `endDate`) VALUES (@identifier, @name, @company, @endDate);',
				{
					identifier = xTarget.identifier,
					name = fullName,
					company = targetCompany,
					endDate = endDate,
				}, function(rowsChanged)
					if rowsChanged > 0 then
						xPlayer.showNotification('Pojisteni zapsano')
						PeopleInsurance[xTarget.identifier] = {
							identifier = xTarget.identifier,
							name = fullName,
							company = targetCompany,
							endDate = endDate,
						}
						sendInsuranceInfo('Pacientovi/pacientce ' .. PeopleInsurance[xTarget.identifier].name .. ' bylo vystaveno pojisteni do ' .. os.date("%d/%m/%Y %X", PeopleInsurance[xTarget.identifier]['endDate']))
					else
						xPlayer.showNotification('Pojisteni se nepodarilo zapsat')
					end
				end)
			else
				xPlayer.showNotification('Pojisteni se nepodarilo zapsat')
			end
		end)
	end
end)

RegisterServerEvent('esx_ambulancejob:odberyKrve')
AddEventHandler('esx_ambulancejob:odberyKrve', function(target)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.addInventoryItem('transfusion', 1)
	local url = 'https://discordapp.com/api/webhooks/733700259259219971/IqtDTewK188EssL13Jg60cCul1BGQq7mnjO3UeW6hv7zTDPKrIkf5riyyc1PeMeh5Gc2'
	sendDiscordLog(url, _source, 'odebral krev od ' .. GetPlayerName(target))
end)

RegisterServerEvent('CUSTOM_esx_ambulance:requestCPR')
AddEventHandler('CUSTOM_esx_ambulance:requestCPR', function(target, playerheading, playerCoords, playerlocation)
    TriggerClientEvent("CUSTOM_esx_ambulance:playCPR", target, playerheading, playerCoords, playerlocation)
end)

TriggerEvent('esx_phone:registerNumber', 'ambulance', _U('alert_ambulance'), true, true)

TriggerEvent('esx_society:registerSociety', 'ambulance', 'Ambulance', 'society_ambulance', 'society_ambulance', 'society_ambulance', {type = 'public'})

ESX.RegisterServerCallback('esx_ambulancejob:removeItemsAfterRPDeath', function(source, cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if Config.RemoveCashAfterRPDeath then
		if xPlayer.getMoney() > 0 then
			xPlayer.removeMoney(xPlayer.getMoney())
		end

		if xPlayer.getAccount('black_money').money > 0 then
			xPlayer.setAccountMoney('black_money', 0)
		end
	end

	if Config.RemoveItemsAfterRPDeath then
		for i=1, #xPlayer.inventory, 1 do
			if xPlayer.inventory[i].count > 0 then
				xPlayer.setInventoryItem(xPlayer.inventory[i].name, 0)
			end
		end
	end

	sendDiscordLog('https://discordapp.com/api/webhooks/732644000527548556/NFxU_v8Ot1ceG3AM9cnQfiDGSDaFoGVZALBt7mBxt7qsh45suBVK0c14lp7brTrevGX_', _source, "[ID: " .. _source .. "] si dal respawn")
	sendDiscordLog('https://discordapp.com/api/webhooks/732646148094820392/ad2cUFuoBg7c7VD-mdDPyRY__rFZhjKGGgralv0qrAUt88LIhflpf0h5wklbN6_RGmrr', _source, "[ID: " .. _source .. "] byl/a prevezen/a Frantou do nemocnice")

	local playerLoadout = {}
	if Config.RemoveWeaponsAfterRPDeath then
		for i=1, #xPlayer.loadout, 1 do
			xPlayer.removeWeapon(xPlayer.loadout[i].name)
		end
	else -- save weapons & restore em' since spawnmanager removes them
		for i=1, #xPlayer.loadout, 1 do
			table.insert(playerLoadout, xPlayer.loadout[i])
		end

		-- give back wepaons after a couple of seconds
		Citizen.CreateThread(function()
			Citizen.Wait(5000)
			for i=1, #playerLoadout, 1 do
				if playerLoadout[i].label ~= nil then
					xPlayer.addWeapon(playerLoadout[i].name, playerLoadout[i].ammo)
				end
			end
		end)
	end

	cb()
end)

if Config.EarlyRespawnFine then
	ESX.RegisterServerCallback('esx_ambulancejob:checkBalance', function(source, cb)
		local xPlayer = ESX.GetPlayerFromId(source)
		local bankBalance = xPlayer.getAccount('bank').money

		cb(bankBalance >= Config.EarlyRespawnFineAmount)
	end)

	RegisterServerEvent('esx_ambulancejob:payFine')
	AddEventHandler('esx_ambulancejob:payFine', function()
		local xPlayer = ESX.GetPlayerFromId(source)
		local fineAmount = Config.EarlyRespawnFineAmount

		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('respawn_bleedout_fine_msg', ESX.Math.GroupDigits(fineAmount)))
		xPlayer.removeAccountMoney('bank', fineAmount)
	end)
end

ESX.RegisterServerCallback('esx_ambulancejob:getItemAmount', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	local quantity = xPlayer.getInventoryItem(item).count

	cb(quantity)
end)

ESX.RegisterServerCallback('esx_ambulancejob:buyJobVehicle', function(source, cb, vehicleProps, type)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = getPriceFromHash(vehicleProps.model, xPlayer.job.grade_name, type)

	-- vehicle model not found
	if price == 0 then
		print(('esx_ambulancejob: %s attempted to exploit the shop! (invalid vehicle model)'):format(xPlayer.identifier))
		cb(false)
	else
		if xPlayer.getMoney() >= price then
			xPlayer.removeMoney(price)
	
			MySQL.Async.execute('INSERT INTO owned_vehicles (owner, vehicle, plate, type, job, `stored`) VALUES (@owner, @vehicle, @plate, @type, @job, @stored)', {
				['@owner'] = xPlayer.identifier,
				['@vehicle'] = json.encode(vehicleProps),
				['@plate'] = vehicleProps.plate,
				['@type'] = type,
				['@job'] = xPlayer.job.name,
				['@stored'] = true
			}, function (rowsChanged)
				cb(true)
			end)
		else
			cb(false)
		end
	end
end)

ESX.RegisterServerCallback('esx_ambulancejob:storeNearbyVehicle', function(source, cb, nearbyVehicles)
	local xPlayer = ESX.GetPlayerFromId(source)
	local foundPlate, foundNum

	for k,v in ipairs(nearbyVehicles) do
		local result = MySQL.Sync.fetchAll('SELECT plate FROM owned_vehicles WHERE owner = @owner AND plate = @plate AND job = @job', {
			['@owner'] = xPlayer.identifier,
			['@plate'] = v.plate,
			['@job'] = xPlayer.job.name
		})

		if result[1] then
			foundPlate, foundNum = result[1].plate, k
			break
		end
	end

	if not foundPlate then
		cb(false)
	else
		MySQL.Async.execute('UPDATE owned_vehicles SET `stored` = true WHERE owner = @owner AND plate = @plate AND job = @job', {
			['@owner'] = xPlayer.identifier,
			['@plate'] = foundPlate,
			['@job'] = xPlayer.job.name
		}, function (rowsChanged)
			if rowsChanged == 0 then
				print(('esx_ambulancejob: %s has exploited the garage!'):format(xPlayer.identifier))
				cb(false)
			else
				cb(true, foundNum)
			end
		end)
	end

end)

function getPriceFromHash(hashKey, jobGrade, type)
	if type == 'helicopter' then
		local vehicles = Config.AuthorizedHelicopters[jobGrade]

		for k,v in ipairs(vehicles) do
			if GetHashKey(v.model) == hashKey then
				return v.price
			end
		end
	elseif type == 'car' then
		local vehicles = Config.AuthorizedVehicles[jobGrade]

		for k,v in ipairs(vehicles) do
			if GetHashKey(v.model) == hashKey then
				return v.price
			end
		end
	end

	return 0
end

RegisterServerEvent('esx_ambulancejob:removeItem')
AddEventHandler('esx_ambulancejob:removeItem', function(item)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem(item, 1)

	if item == 'bandage' then
		TriggerClientEvent('esx:showNotification', _source, _U('used_bandage'))
	elseif item == 'medikit' then
		TriggerClientEvent('esx:showNotification', _source, _U('used_medikit'))
	end
end)

RegisterServerEvent('esx_ambulancejob:giveItem')
AddEventHandler('esx_ambulancejob:giveItem', function(itemName)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer.job.name ~= 'ambulance' then
		print(('esx_ambulancejob: %s attempted to spawn in an item!'):format(xPlayer.identifier))
		return
	elseif (itemName ~= 'medikit' and itemName ~= 'bandage' and itemName ~= 'carmedkit') then
		print(('esx_ambulancejob: %s attempted to spawn in an item!'):format(xPlayer.identifier))
		return
	end

	local xItem = xPlayer.getInventoryItem(itemName)
	local count = 1

	if xItem.limit ~= -1 then
		count = xItem.limit - xItem.count
	end

	if xItem.count < xItem.limit then
		xPlayer.addInventoryItem(itemName, count)
		sendDiscordLog(
			'https://discordapp.com/api/webhooks/732645267316277248/F7NwNc3YGuZXAR-aSoTEFEsMfj7Bj5xDF1xX6YcXPKQuK6sENtzuGxb09oRXsE3FiHtY', _source, 'si vzal/a ' .. xItem.label .. ' x' .. count
		)
	else
		TriggerClientEvent('esx:showNotification', _source, _U('max_item'))
	end
end)

ESX.RegisterUsableItem('medikit', function(source)
	if not playersHealing[source] then
		local xPlayer = ESX.GetPlayerFromId(source)
		xPlayer.removeInventoryItem('medikit', 1)
	
		playersHealing[source] = true
		TriggerClientEvent('esx_ambulancejob:useItem', source, 'medikit')
		TriggerClientEvent('mythic_hospital:client:ResetLimbs', source)
        TriggerClientEvent('mythic_hospital:client:RemoveBleed', source)

		Citizen.Wait(10000)
		playersHealing[source] = nil
	end
end)

ESX.RegisterUsableItem('bandage', function(source)
	if not playersHealing[source] then
		local xPlayer = ESX.GetPlayerFromId(source)
		xPlayer.removeInventoryItem('bandage', 1)
	
		playersHealing[source] = true
		TriggerClientEvent('esx_ambulancejob:useItem', source, 'bandage')
		TriggerClientEvent('mythic_hospital:client:ResetLimbs', source)
	        TriggerClientEvent('mythic_hospital:client:RemoveBleed', source)

		Citizen.Wait(10000)
		playersHealing[source] = nil
	end
end)

ESX.RegisterUsableItem('carmedkit', function(source)
	if not playersHealing[source] then
		local xPlayer = ESX.GetPlayerFromId(source)
		xPlayer.removeInventoryItem('carmedkit', 1)
	
		playersHealing[source] = true
		TriggerClientEvent('esx_ambulancejob:useItem', source, 'carmedkit')
		TriggerClientEvent('mythic_hospital:client:ResetLimbs', source)
		TriggerClientEvent('mythic_hospital:client:RemoveBleed', source)

		Citizen.Wait(10000)
		playersHealing[source] = nil
	end
end)

function sendMessageToDiscord (msg)
	local webhook = 'https://discordapp.com/api/webhooks/702475575981244436/acze80PRRQ5zLWV4hlo7U7RaonQuzo-L552dufpJh0L3x6uqHdXfP9bf30A59Yv7g5eG'
	PerformHttpRequest(webhook, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end

ESX.RegisterServerCallback('esx_ambulancejob:getDeathStatus', function(source, cb)
	local identifier = GetPlayerIdentifiers(source)[1]
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchScalar('SELECT is_dead FROM users WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(isDead)
		if isDead then
			local message = ('%s HEX: %s se pokusil o combat log!'):format(xPlayer.getName(), identifier)
			sendMessageToDiscord(message)
		end

		cb(isDead)
	end)
end)

RegisterServerEvent('esx_ambulancejob:setDeathStatus')
AddEventHandler('esx_ambulancejob:setDeathStatus', function(isDead)
	local identifier = GetPlayerIdentifiers(source)[1]

	if type(isDead) ~= 'boolean' then
		print(('esx_ambulancejob: %s attempted to parse something else than a boolean to setDeathStatus!'):format(identifier))
		return
	end

	MySQL.Sync.execute('UPDATE users SET is_dead = @isDead WHERE identifier = @identifier', {
		['@identifier'] = identifier,
		['@isDead'] = isDead
	})
end)


-- SKLAD
ESX.RegisterServerCallback('esx_ambulancejob:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	cb({items = xPlayer.inventory})
end)

ESX.RegisterServerCallback('esx_ambulancejob:getVaultWeapons', function(source, cb)
    TriggerEvent('esx_datastore:getSharedDataStore', 'society_ambulance', function(store)
        local weapons = store.get('weapons')

        if weapons == nil then
            weapons = {}
        end

        cb(weapons)
    end)
end)

ESX.RegisterServerCallback('esx_ambulancejob:addVaultWeapon', function(source, cb, weaponName)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeWeapon(weaponName)

    TriggerEvent('esx_datastore:getSharedDataStore', 'society_ambulance', function(store)
        local weapons = store.get('weapons')

        if weapons == nil then
            weapons = {}
        end

        local foundWeapon = false

        for i=1, #weapons, 1 do
            if weapons[i].name == weaponName then
            weapons[i].count = weapons[i].count + 1
            foundWeapon = true
            end
        end

        if not foundWeapon then
            table.insert(weapons, {
            name  = weaponName,
            count = 1
            })
        end

        store.set('weapons', weapons)
        cb()
    end)
end)

ESX.RegisterServerCallback('esx_ambulancejob:removeVaultWeapon', function(source, cb, weaponName)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addWeapon(weaponName, 1000)

    TriggerEvent('esx_datastore:getSharedDataStore', 'society_ambulance', function(store)
        local weapons = store.get('weapons')

        if weapons == nil then
            weapons = {}
        end

        local foundWeapon = false

        for i=1, #weapons, 1 do
            if weapons[i].name == weaponName then
                weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
                foundWeapon = true
            end
        end

        if not foundWeapon then
            table.insert(weapons, {
                name  = weaponName,
                count = 0
            })
        end

        store.set('weapons', weapons)
        cb()
    end)
end)

ESX.RegisterServerCallback('esx_ambulancejob:getFridgeStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_ambulance', function(inventory)
		cb(inventory.items)
	end)
end)

RegisterServerEvent('esx_ambulancejob:getFridgeStockItem')
AddEventHandler('esx_ambulancejob:getFridgeStockItem', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_ambulance', function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= count then
			inventory.removeItem(itemName, count)
			xPlayer.addInventoryItem(itemName, count)
			discordLog("vytahl **" .. itemName .. "** v mnozstvi **x" .. count .. "**", source)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, 'Neplatne mnozstvi')
		end

		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)
	end)
end)

RegisterServerEvent('esx_ambulancejob:putFridgeStockItems')
AddEventHandler('esx_ambulancejob:putFridgeStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_ambulance', function(inventory)
		local item = inventory.getItem(itemName)
		local playerItemCount = xPlayer.getInventoryItem(itemName).count

		if item.count >= 0 and count <= playerItemCount then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			discordLog("vlozil **" .. itemName .. "** v mnozstvi **x" .. count .. "**", source)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
		end

		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. item.label)
	end)
end)

function discordLog(text, source)
	local time = os.date("%d.%m.%Y %X")
	local name = GetPlayerName(source)
	local identifier = GetPlayerIdentifiers(source)
	local msg = time .. ' : ' .. name .. ' - ' .. identifier[1] .. ' : ' .. text
	local url = "https://discordapp.com/api/webhooks/732645267316277248/F7NwNc3YGuZXAR-aSoTEFEsMfj7Bj5xDF1xX6YcXPKQuK6sENtzuGxb09oRXsE3FiHtY"
	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end
