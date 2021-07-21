ESX = nil
local categories, vehicles = {}, {}

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

TriggerEvent('esx_phone:registerNumber', 'cardealer', _U('dealer_customers'), false, false)
TriggerEvent('esx_society:registerSociety', 'cardealer', _U('car_dealer'), 'society_cardealer', 'society_cardealer', 'society_cardealer', {type = 'private'})

Citizen.CreateThread(function()
	local char = Config.PlateLetters
	char = char + Config.PlateNumbers
	if Config.PlateUseSpace then char = char + 1 end

	if char > 8 then
		print(('[esx_vehicleshop] [^3WARNING^7] Plate character count reached, %s/8 characters!'):format(char))
	end
end)

function RemoveOwnedVehicle(plate)
	MySQL.Async.execute('DELETE FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	})
end

function DeleteVehicleTrunk(plate)
	MySQL.Async.execute('DELETE FROM trunk_inventory WHERE plate = @plate', {
		['@plate'] = plate
	})
end

function loadVehicles ()
	MySQL.Async.fetchAll('SELECT * FROM vehicle_categories', {}, function(_categories)
		categories = _categories

		MySQL.Async.fetchAll('SELECT * FROM vehicles', {}, function(_vehicles)
			vehicles = _vehicles

			for k,v in ipairs(vehicles) do
				for k2,v2 in ipairs(categories) do
					if v2.name == v.category then
						vehicles[k].categoryLabel = v2.label
						break
					end
				end
			end

			-- send information after db has loaded, making sure everyone gets vehicle information
			TriggerClientEvent('esx_vehicleshop:sendCategories', -1, categories)
			TriggerClientEvent('esx_vehicleshop:sendVehicles', -1, vehicles)
		end)
	end)
end

MySQL.ready(function()
	loadVehicles()
end)

TriggerEvent('es:addGroupCommand', 'reloadpdm', 'superadmin', function(source, args, user)
	loadVehicles()
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = 'Prenacist PDM'})

function getVehicleLabelFromModel(model)
	for k,v in ipairs(vehicles) do
		if v.model == model then
			return v.name
		end
	end

	return
end

RegisterNetEvent('esx_vehicleshop:setVehicleOwnedILovePizzaPlayerId')
AddEventHandler('esx_vehicleshop:setVehicleOwnedILovePizzaPlayerId', function(playerId, vehicleProps, model, label)
	local xPlayer, xTarget = ESX.GetPlayerFromId(source), ESX.GetPlayerFromId(playerId)

	if xPlayer.job.name == 'cardealer' and xTarget then
		MySQL.Async.fetchAll('SELECT id FROM cardealer_vehicles WHERE vehicle = @vehicle LIMIT 1', {
			['@vehicle'] = model
		}, function(result)
			if result[1] then
				local id = result[1].id

				MySQL.Async.execute('DELETE FROM cardealer_vehicles WHERE id = @id', {
					['@id'] = id
				}, function(rowsChanged)
					if rowsChanged == 1 then
						MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)', {
							['@owner']   = xTarget.identifier,
							['@plate']   = vehicleProps.plate,
							['@vehicle'] = json.encode(vehicleProps)
						}, function(rowsChanged)
							xPlayer.showNotification(_U('vehicle_set_owned', vehicleProps.plate, xTarget.getName()))
							xTarget.showNotification(_U('vehicle_belongs', vehicleProps.plate))
						end)

						local dateNow = os.date('%Y-%m-%d %H:%M')

						MySQL.Async.execute('INSERT INTO vehicle_sold (client, model, plate, soldby, date) VALUES (@client, @model, @plate, @soldby, @date)', {
							['@client'] = xTarget.getName(),
							['@model'] = label,
							['@plate'] = vehicleProps.plate,
							['@soldby'] = xPlayer.getName(),
							['@date'] = dateNow
						})
					end
				end)
			end
		end)
	end
end)

ESX.RegisterServerCallback('esx_vehicleshop:getSoldVehicles', function(source, cb)
	MySQL.Async.fetchAll('SELECT client, model, plate, soldby, date FROM vehicle_sold', {}, function(result)
		cb(result)
	end)
end)

RegisterNetEvent('esx_vehicleshop:rentVehicle')
AddEventHandler('esx_vehicleshop:rentVehicle', function(vehicle, plate, rentPrice, playerId)
	local xPlayer, xTarget = ESX.GetPlayerFromId(source), ESX.GetPlayerFromId(playerId)

	if xPlayer.job.name == 'cardealer' and xTarget then
		MySQL.Async.fetchAll('SELECT id, price FROM cardealer_vehicles WHERE vehicle = @vehicle LIMIT 1', {
			['@vehicle'] = vehicle
		}, function(result)
			if result[1] then
				local price = result[1].price

				MySQL.Async.execute('DELETE FROM cardealer_vehicles WHERE id = @id', {
					['@id'] = result[1].id
				}, function(rowsChanged)
					if rowsChanged == 1 then
						MySQL.Async.execute('INSERT INTO rented_vehicles (vehicle, plate, player_name, base_price, rent_price, owner) VALUES (@vehicle, @plate, @player_name, @base_price, @rent_price, @owner)', {
							['@vehicle']     = vehicle,
							['@plate']       = plate,
							['@player_name'] = xTarget.getName(),
							['@base_price']  = price,
							['@rent_price']  = rentPrice,
							['@owner']       = xTarget.identifier
						}, function(rowsChanged2)
							xPlayer.showNotification(_U('vehicle_set_rented', plate, xTarget.getName()))
						end)
					end
				end)
			end
		end)
	end
end)

RegisterNetEvent('esx_vehicleshop:getStockItem')
AddEventHandler('esx_vehicleshop:getStockItem', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_cardealer', function(inventory)
		local item = inventory.getItem(itemName)

		-- is there enough in the society?
		if count > 0 and item.count >= count then

			-- can the player carry the said amount of x item?
			inventory.removeItem(itemName, count)
			xPlayer.addInventoryItem(itemName, count)
			xPlayer.showNotification(_U('have_withdrawn', count, item.label))
		else
			xPlayer.showNotification(_U('not_enough_in_society'))
		end
	end)
end)

RegisterNetEvent('esx_vehicleshop:putStockItems')
AddEventHandler('esx_vehicleshop:putStockItems', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_cardealer', function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			xPlayer.showNotification(_U('have_deposited', count, item.label))
		else
			xPlayer.showNotification(_U('invalid_amount'))
		end
	end)
end)

ESX.RegisterServerCallback('esx_vehicleshop:getCategories', function(source, cb)
	cb(categories)
end)

ESX.RegisterServerCallback('esx_vehicleshop:getVehicles', function(source, cb)
	cb(vehicles)
end)

local function discordLog (text, source)
	local time = os.date("%d.%m.%Y %X")
	local name = GetPlayerName(source)
	local identifier = GetPlayerIdentifiers(source)
	local msg = time .. ' : ' .. name .. ' - ' .. identifier[1] .. ' : ' .. text
	local url = "https://discordapp.com/api/webhooks/722036897551220746/WFOyvaaKr3bkSvIRrXroTIu_-i_shRlTS9VF0p_qvDrkQTUCaWYfWVRHB-RKb22RXZxG"
	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end

ESX.RegisterServerCallback('esx_vehicleshop:buyVehicle', function(source, cb, model, plate, type, rentprice)
	local xPlayer = ESX.GetPlayerFromId(source)
	local modelPrice
	local isRented = 0

	if type == 'rent' then
		modelPrice = rentprice
		isRented = 1
	elseif type == 'loan' then
		modelPrice = 0
	else
		for k,v in ipairs(vehicles) do
			if model == v.model then
				modelPrice = v.price
				break
			end
		end
	end

	local currentMoney = 0

	if type == 'bank' or type == 'rent' then
		currentMoney = xPlayer.getAccount('bank').money
	else
		currentMoney = xPlayer.getMoney()
	end
	if modelPrice and currentMoney >= modelPrice then
		if type == 'bank' or type == 'rent' then
			xPlayer.removeAccountMoney('bank', modelPrice)
		else
			xPlayer.removeMoney(modelPrice)
		end

		MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle, bought, rented) VALUES (@owner, @plate, @vehicle, @bought, @rented)', {
			['@owner']   = xPlayer.identifier,
			['@plate']   = plate,
			['@vehicle'] = json.encode({model = GetHashKey(model), plate = plate}),
			['@rented'] = isRented,
			['@bought'] = os.time()
		}, function(rowsChanged)
			cb(true, plate)
			if type == 'rent' then
				discordLog("pujcil auto s SPZ " .. plate .. " za cenu " .. modelPrice .. " **(model: " .. model .. " )**", source)
			elseif type == 'loan' then
				discordLog("si vzal na splatky auto s SPZ " .. plate .. " **(model: " .. model .. " )**", source)
			else
				discordLog("koupil auto s SPZ " .. plate .. " za cenu " .. modelPrice .. " **(model: " .. model .. " )**", source)
			end
		end)
	else
		cb(false)
	end
end)


ESX.RegisterServerCallback('esx_vehicleshop:getCommercialVehicles', function(source, cb)
	MySQL.Async.fetchAll('SELECT price, vehicle FROM cardealer_vehicles ORDER BY vehicle ASC', {}, function(result)
		cb(result)
	end)
end)

ESX.RegisterServerCallback('esx_vehicleshop:buyCarDealerVehicle', function(source, cb, model)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'cardealer' then
		local modelPrice

		for k,v in ipairs(vehicles) do
			if model == v.model then
				modelPrice = v.price
				break
			end
		end

		if modelPrice then
			TriggerEvent('esx_addonaccount:getSharedAccount', 'society_cardealer', function(account)
				if account.money >= modelPrice then
					account.removeMoney(modelPrice)

					MySQL.Async.execute('INSERT INTO cardealer_vehicles (vehicle, price) VALUES (@vehicle, @price)', {
						['@vehicle'] = model,
						['@price'] = modelPrice
					}, function(rowsChanged)
						cb(true)
					end)
				else
					cb(false)
				end
			end)
		end
	end
end)

RegisterNetEvent('esx_vehicleshop:returnProvider')
AddEventHandler('esx_vehicleshop:returnProvider', function(vehicleModel)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'cardealer' then
		MySQL.Async.fetchAll('SELECT id, price FROM cardealer_vehicles WHERE vehicle = @vehicle LIMIT 1', {
			['@vehicle'] = vehicleModel
		}, function(result)
			if result[1] then
				local id = result[1].id

				MySQL.Async.execute('DELETE FROM cardealer_vehicles WHERE id = @id', {
					['@id'] = id
				}, function(rowsChanged)
					if rowsChanged == 1 then
						TriggerEvent('esx_addonaccount:getSharedAccount', 'society_cardealer', function(account)
							local price = ESX.Math.Round(result[1].price * 0.75)
							local vehicleLabel = getVehicleLabelFromModel(vehicleModel)

							account.addMoney(price)
							xPlayer.showNotification(_U('vehicle_sold_for', vehicleLabel, ESX.Math.GroupDigits(price)))
						end)
					end
				end)
			else
				print(('[esx_vehicleshop] [^3WARNING^7] %s attempted selling an invalid vehicle!'):format(xPlayer.identifier))
			end
		end)
	end
end)

ESX.RegisterServerCallback('esx_vehicleshop:getRentedVehicles', function(source, cb)
	MySQL.Async.fetchAll('SELECT * FROM rented_vehicles ORDER BY player_name ASC', {}, function(result)
		local vehicles = {}

		for i=1, #result, 1 do
			table.insert(vehicles, {
				name = result[i].vehicle,
				plate = result[i].plate,
				playerName = result[i].player_name
			})
		end

		cb(vehicles)
	end)
end)

ESX.RegisterServerCallback('esx_vehicleshop:giveBackVehicle', function(source, cb, plate)
	MySQL.Async.fetchAll('SELECT base_price, vehicle FROM rented_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)
		if result[1] then
			local vehicle = result[1].vehicle
			local basePrice = result[1].base_price

			MySQL.Async.execute('DELETE FROM rented_vehicles WHERE plate = @plate', {
				['@plate'] = plate
			}, function(rowsChanged)
				MySQL.Async.execute('INSERT INTO cardealer_vehicles (vehicle, price) VALUES (@vehicle, @price)', {
					['@vehicle'] = vehicle,
					['@price']   = basePrice
				})

				RemoveOwnedVehicle(plate)
				cb(true)
			end)
		else
			cb(false)
		end
	end)
end)

ESX.RegisterServerCallback('esx_vehicleshop:destroyVehicle', function(source, cb, plate, isRented)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner AND plate = @plate AND rented = @rented', {
		['@owner'] = xPlayer.identifier,
		['@plate'] = plate,
		['@rented'] = isRented
	}, function(data)
		if data[1] then
			if isRented then
				local rentDate = data[1].bought
				local now = os.time()
				local rentTime = now + 86400
				local overlimit = rentDate - rentTime
				local isInTime = overlimit <= 0

				if not isInTime then
					xPlayer.removeAccountMoney('bank', 300000)
					xPlayer.showNotification('Byl ti nauctovan poplatek $300 000 za vraceni auta po temrinu')
				end
			end

			RemoveOwnedVehicle(plate)
			DeleteVehicleTrunk(plate)
			
			discordLog("znicil vozidlo s SPZ **" .. plate .. "**", source)
			cb(true)
		else
			cb(false)
		end
	end)
end)

ESX.RegisterServerCallback('esx_vehicleshop:resellVehicle', function(source, cb, plate, model)
	local xPlayer, resellPrice = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'cardealer' then
		-- calculate the resell price
		for i=1, #vehicles, 1 do
			if GetHashKey(vehicles[i].model) == model then
				resellPrice = ESX.Math.Round(vehicles[i].price / 100 * Config.ResellPercentage)
				break
			end
		end

		if not resellPrice then
			print(('[esx_vehicleshop] [^3WARNING^7] %s attempted to sell an unknown vehicle!'):format(xPlayer.identifier))
			cb(false)
		else
			MySQL.Async.fetchAll('SELECT * FROM rented_vehicles WHERE plate = @plate', {
				['@plate'] = plate
			}, function(result)
				if result[1] then -- is it a rented vehicle?
					cb(false) -- it is, don't let the player sell it since he doesn't own it
				else
					MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner AND @plate = plate', {
						['@owner'] = xPlayer.identifier,
						['@plate'] = plate
					}, function(result)
						if result[1] then -- does the owner match?
							local vehicle = json.decode(result[1].vehicle)

							if vehicle.model == model then
								if vehicle.plate == plate then
									xPlayer.addMoney(resellPrice)
									RemoveOwnedVehicle(plate)
									cb(true)
								else
									print(('[esx_vehicleshop] [^3WARNING^7] %s attempted to sell an vehicle with plate mismatch!'):format(xPlayer.identifier))
									cb(false)
								end
							else
								print(('[esx_vehicleshop] [^3WARNING^7] %s attempted to sell an vehicle with model mismatch!'):format(xPlayer.identifier))
								cb(false)
							end
						end
					end)
				end
			end)
		end
	end
end)

ESX.RegisterServerCallback('esx_vehicleshop:getStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_cardealer', function(inventory)
		cb(inventory.items)
	end)
end)

ESX.RegisterServerCallback('esx_vehicleshop:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items = xPlayer.inventory

	cb({items = items})
end)

ESX.RegisterServerCallback('esx_vehicleshop:isPlateTaken', function(source, cb, plate)
	MySQL.Async.fetchAll('SELECT 1 FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)
		cb(result[1] ~= nil)
	end)
end)

ESX.RegisterServerCallback('esx_vehicleshop:retrieveJobVehicles', function(source, cb, type)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner AND type = @type AND job = @job', {
		['@owner'] = xPlayer.identifier,
		['@type'] = type,
		['@job'] = xPlayer.job.name
	}, function(result)
		cb(result)
	end)
end)

RegisterNetEvent('esx_vehicleshop:setJobVehicleState')
AddEventHandler('esx_vehicleshop:setJobVehicleState', function(plate, state)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.execute('UPDATE owned_vehicles SET `stored` = @stored WHERE plate = @plate AND job = @job', {
		['@stored'] = state,
		['@plate'] = plate,
		['@job'] = xPlayer.job.name
	}, function(rowsChanged)
		if rowsChanged == 0 then
			print(('[esx_vehicleshop] [^3WARNING^7] %s exploited the garage!'):format(xPlayer.identifier))
		end
	end)
end)

function PayRent(d, h, m)
	local tasks, timeStart = {}, os.clock()
	print('[esx_vehicleshop] [^2INFO^7] Paying rent cron job started')

	MySQL.Async.fetchAll('SELECT owner, rent_price FROM rented_vehicles', {}, function(result)
		for i=1, #result, 1 do
			table.insert(tasks, function(cb)
				local xPlayer = ESX.GetPlayerFromIdentifier(result[i].owner)

				if xPlayer then -- message player if connected
					xPlayer.removeAccountMoney('bank', result[i].rent_price)
					xPlayer.showNotification(_U('paid_rental', ESX.Math.GroupDigits(result[i].rent_price)))
				else -- pay rent by updating SQL
					MySQL.Sync.execute('UPDATE users SET bank = bank - @bank WHERE identifier = @identifier', {
						['@bank'] = result[i].rent_price,
						['@identifier'] = result[i].owner
					})
				end

				TriggerEvent('esx_addonaccount:getSharedAccount', 'society_cardealer', function(account)
					account.addMoney(result[i].rent_price)
				end)

				cb()
			end)
		end

		Async.parallelLimit(tasks, 5, function(results) end)

		local elapsedTime = os.clock() - timeStart
		print(('[esx_vehicleshop] [^2INFO^7] Paying rent cron job took %s seconds'):format(elapsedTime))
	end)
end

local remainingLoans = {}

ESX.RegisterServerCallback('esx_vehicleshop:takeLoan', function(source, cb, model)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getAccount('bank').money
	local identifier = xPlayer.identifier
	local carPrice = 0

	for k,v in ipairs(vehicles) do
		if model == v.model then
			carPrice = v.price
			break
		end
	end

	MySQL.Async.fetchAll('SELECT `car_rent_amount` FROM users WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(result)
		if result and result[1] then
			local currentLoan = result[1].car_rent_amount
			
			if carPrice < 1000000 or carPrice > 7000000 then
				xPlayer.showNotification('Na vozidla v teto cenove kategorii neposkytujeme pujcky.')
			elseif currentLoan > 0 then
				xPlayer.showNotification('Uz ti jedny splatky bezi.')
			else
				local partOfPrice = carPrice * 0.25
		
				if playerMoney < partOfPrice then
					xPlayer.showNotification('Nemas dostatek financi na zaplaceni zakladu pro uzavreni pujcky')
				else
					xPlayer.showNotification('Zaplatil/a jsi 25% ceny tveho noveho vozidla. Bazar ti prave pripravuje splatky')
					xPlayer.removeAccountMoney('bank', partOfPrice)
					local missingPart = carPrice * 0.75
					local loanTax = carPrice * 0.15
					local loan = missingPart + loanTax
				
					remainingLoans[tostring(identifier)] = loan
				
					MySQL.Async.execute('UPDATE users SET `car_rent_amount` = @loan WHERE identifier = @identifier', {
						['@identifier'] = identifier,
						['@loan'] = loan
					}, function(rowsChanged)
						if rowsChanged ~= 0 then
							xPlayer.showNotification('Vzal/a sis pujcku ve vysi $' .. loan)
							cb(true)
						else
							cb(false)
						end
					end)
				end
			end
		end
	end)
end)

ESX.RegisterServerCallback('esx_vehicleshop:getRemainingLoan', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = xPlayer.identifier

	if remainingLoans[tostring(identifier)] then
		cb(remainingLoans[tostring(identifier)])
	else
		MySQL.Async.fetchAll('SELECT `car_rent_amount` FROM users WHERE identifier = @identifier', {
			['@identifier'] = identifier
		}, function(result)
			if result and result[1] then
				remainingLoans[tostring(identifier)] = result[1].car_rent_amount
				cb(result[1].car_rent_amount)
			end
		end)
	end
end)

ESX.RegisterServerCallback('esx_vehicleshop:payRemainingLoan', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = xPlayer.identifier

	MySQL.Async.fetchAll('SELECT `car_rent_amount` FROM users WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(result)
		if result and result[1] then
			local remainingLoan = result[1].car_rent_amount

			if remainingLoan < 1 then
				cb(false)
			else
				local playerMoney = xPlayer.getAccount('bank').money

				if playerMoney >= remainingLoan then
					MySQL.Async.execute('UPDATE users SET `car_rent_amount` = 0 WHERE identifier = @identifier', {
						['@identifier'] = identifier,
					}, function(rowsChanged)
						if rowsChanged ~= 0 then
							xPlayer.removeAccountMoney('bank', remainingLoan)
							remainingLoans[tostring(identifier)] = nil
							cb(true)
						else
							cb(false)
						end
					end)
				else
					cb(false)
				end
			end
		else
			cb(false)
		end
	end)
end)


function sendCarLoanPayLog(text)
	local time = os.date("%d.%m.%Y %X")
	local msg = time .. '\n' .. text
	local url = 'https://discordapp.com/api/webhooks/722036897551220746/WFOyvaaKr3bkSvIRrXroTIu_-i_shRlTS9VF0p_qvDrkQTUCaWYfWVRHB-RKb22RXZxG'
	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end

function PayCarLoans (d, h, m)
	if d == 4 then
		local tasks, timeStart = {}, os.clock()
		print('[esx_vehicleshop] [^2INFO^7] Paying car loans cron job started')

		MySQL.Async.fetchAll('SELECT identifier, `car_rent_amount`, bank, name FROM users WHERE car_rent_amount > 0', {}, function(result)
			local finalMessage = ''
			local finalAmount = 0

			for i=1, #result, 1 do
				local xPlayer = ESX.GetPlayerFromIdentifier(result[i].identifier)
				local currentLoan = result[i].car_rent_amount
				local moneyAmount = 0

				if currentLoan and currentLoan > 0 then
					if currentLoan < 1 * 1000000 then
						moneyAmount = 200000
					elseif currentLoan < 3 * 1000000 then
						moneyAmount = 450000
						-- moneyAmount = 700000
					elseif currentLoan < 5 * 1000000 then
						-- moneyAmount = 1200000
						moneyAmount = 650000
					elseif currentLoan < 10 * 1000000 then
						moneyAmount = 900000
					elseif currentLoan >= 10 * 1000000 then
						moneyAmount = 1500000
					-- elseif currentLoan >= 5 * 1000000 then
					-- 	moneyAmount = 2000000
					end

					if currentLoan < moneyAmount then
						moneyAmount = currentLoan
					end
					
					if xPlayer then -- message player if connected
						xPlayer.removeAccountMoney('bank', moneyAmount)
						xPlayer.showNotification('Zaplatil jsi splatku auta $' .. moneyAmount)
						local msg = result[i].name .. ': **dluh:** ' .. currentLoan .. ', **splatka:** ' .. moneyAmount .. ', **v bance mel/a:** ' .. result[i].bank
						finalMessage = finalMessage .. msg .. '\n'
					else -- pay rent by updating SQL
						MySQL.Async.execute('UPDATE users SET bank = bank - @moneyAmount, `car_rent_amount` = car_rent_amount - @moneyAmount WHERE identifier = @identifier', {
							['@moneyAmount'] = moneyAmount,
							['@identifier'] = result[i].identifier
						})
						local msg = result[i].name .. ': **dluh:** ' .. currentLoan .. ', **splatka:** ' .. moneyAmount .. ', **v bance mel/a:** ' .. result[i].bank
						finalMessage = finalMessage .. msg .. '\n'
					end
	
					finalAmount = finalAmount + moneyAmount
				end
			end

			sendCarLoanPayLog(finalMessage)

			TriggerEvent('esx_addonaccount:getSharedAccount', 'society_cardealer', function(account)
				account.addMoney(finalAmount)
			end)
			
			local elapsedTime = os.clock() - timeStart
			print(('[esx_vehicleshop] [^2INFO^7] Paying rent cron job took %s seconds'):format(elapsedTime))
		end)
	end
end

TriggerEvent('cron:runAt', 22, 00, PayRent)
TriggerEvent('cron:runAt', 4, 00, PayCarLoans)
