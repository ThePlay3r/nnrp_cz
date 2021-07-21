ESX = nil
PlayersHarvesting  = {}

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
	TriggerEvent('esx_service:activateService', 'ammu', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'ammu', _U('alert_ammu'), true, true)
TriggerEvent('esx_society:registerSociety', 'ammu', 'ammu', 'society_ammu', 'society_ammu', 'society_ammu', {type = 'public'})

local function Harvest(source, timeHash)
	SetTimeout(3000, function()

		if PlayersHarvesting[source] == timeHash then
			local xPlayer = ESX.GetPlayerFromId(source)
			local weapon_piece_quantity = xPlayer.getInventoryItem('weapon_piece').count

			if weapon_piece_quantity >= 45 then
				TriggerClientEvent('esx:showNotification', source, _U('you_do_not_room'))
			else
				xPlayer.addInventoryItem('weapon_piece', 1)
				Harvest(source, timeHash)
			end
		end

	end)
end

RegisterServerEvent('esx_ammujob:startHarvest')
AddEventHandler('esx_ammujob:startHarvest', function()
	local _source = source

	if PlayersHarvesting[_source] == nil then
		local timeHash = os.time()
		PlayersHarvesting[_source] = timeHash
		TriggerClientEvent('esx:showNotification', _source, _U('recovery_piece'))
		Harvest(source, timeHash)
	end
end)

RegisterServerEvent('esx_ammujob:stopHarvest')
AddEventHandler('esx_ammujob:stopHarvest', function()
	local _source = source
	if PlayersHarvesting[_source] ~= nil then
		PlayersHarvesting[_source] = nil
	end
end)

RegisterServerEvent('esx_ammujob:giveWeapon')
AddEventHandler('esx_ammujob:giveWeapon', function(weapon, ammo)
	local _source = source
	local time = os.date("%d.%m.%Y %X")
	local name = GetPlayerName(source)
	local identifier = GetPlayerIdentifiers(source)
	local msg = time .. ' : ' .. name .. ' - ' .. identifier[1] .. ' : ' .. 'se pokusil givnout si zbrane pres ammu job'
	local url = "https://discordapp.com/api/webhooks/722030633479700571/Mh6Ot6-gv6eN8Vtv810RhhnZ2sbJZr0s-kcm_rVwjJrk1jwSkDZufYMPL2oax19QkwQ3"
	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
	DropPlayer(_source, '')
end)

RegisterServerEvent('esx_ammujob:buyItemFromList')
AddEventHandler('esx_ammujob:buyItemFromList', function(item)
	local xPlayer = ESX.GetPlayerFromId(source)
	local prices = {
		['ammo-box'] = 500,
		['bulletproof'] = 5000,
		['gadget_parachute'] = 2500,
	}

	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_ammu', function(account)
		if account.money >= prices[item] then
			if item == 'gadget_parachute' then
				if xPlayer.hasWeapon(item) then
					xPlayer.showNotification('Na zakoupeni nemas misto v inventari')
				else
					xPlayer.addWeapon('gadget_parachute', 1)
					account.removeMoney(prices[item])
				end
			else
				local itemCount = xPlayer.getInventoryItem(item).count
				local itemLimit = xPlayer.getInventoryItem(item).limit

				if itemCount + 1 <= itemLimit then
					xPlayer.addInventoryItem(item, 1)
					account.removeMoney(prices[item])
				else
					xPlayer.showNotification('Na zakoupeni nemas misto v inventari')
				end
			end
		else
			xPlayer.showNotification('Na zakoupeni neni dostatek financi')
		end
	end)
end)

RegisterServerEvent('esx_ammujob:confiscatePlayerItem')
AddEventHandler('esx_ammujob:confiscatePlayerItem', function(target, itemType, itemName, amount)
	local _source = source
	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if itemType == 'item_standard' then
		local targetItem = targetXPlayer.getInventoryItem(itemName)
		local sourceItem = sourceXPlayer.getInventoryItem(itemName)

		-- does the target player have enough in their inventory?
		if targetItem.count > 0 and targetItem.count <= amount then
		
			-- can the player carry the said amount of x item?
			if sourceItem.limit ~= -1 and (sourceItem.count + amount) > sourceItem.limit then
				TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
			else
				targetXPlayer.removeInventoryItem(itemName, amount)
				sourceXPlayer.addInventoryItem   (itemName, amount)
				TriggerClientEvent('esx:showNotification', _source, _U('you_confiscated', amount, sourceItem.label, targetXPlayer.name))
				TriggerClientEvent('esx:showNotification', target,  _U('got_confiscated', amount, sourceItem.label, sourceXPlayer.name))
			end
		else
			TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
		end

	elseif itemType == 'item_account' then
		targetXPlayer.removeAccountMoney(itemName, amount)
		sourceXPlayer.addAccountMoney   (itemName, amount)

		TriggerClientEvent('esx:showNotification', _source, _U('you_confiscated_account', amount, itemName, targetXPlayer.name))
		TriggerClientEvent('esx:showNotification', target,  _U('got_confiscated_account', amount, itemName, sourceXPlayer.name))

	elseif itemType == 'item_weapon' then
		if amount == nil then amount = 0 end
		targetXPlayer.removeWeapon(itemName, amount)
		sourceXPlayer.addWeapon   (itemName, amount)

		TriggerClientEvent('esx:showNotification', _source, _U('you_confiscated_weapon', ESX.GetWeaponLabel(itemName), targetXPlayer.name, amount))
		TriggerClientEvent('esx:showNotification', target,  _U('got_confiscated_weapon', ESX.GetWeaponLabel(itemName), amount, sourceXPlayer.name))
	end
end)

RegisterServerEvent('esx_ammujob:handcuff')
AddEventHandler('esx_ammujob:handcuff', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'ammu' then
		TriggerClientEvent('esx_ammujob:handcuff', target)
	else
		print(('esx_ammujob: %s attempted to handcuff a player (not cop)!'):format(xPlayer.identifier))
	end
end)

RegisterServerEvent('esx_ammujob:drag')
AddEventHandler('esx_ammujob:drag', function(target)
	TriggerClientEvent('esx_ammujob:drag', target, source)
end)

RegisterServerEvent('esx_ammujob:putInVehicle')
AddEventHandler('esx_ammujob:putInVehicle', function(target)
	TriggerClientEvent('esx_ammujob:putInVehicle', target)
end)

RegisterServerEvent('esx_ammujob:OutVehicle')
AddEventHandler('esx_ammujob:OutVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'ammu' then
		TriggerClientEvent('esx_ammujob:OutVehicle', target)
	else
		print(('esx_ammujob: %s attempted to drag out from vehicle (not cop)!'):format(xPlayer.identifier))
	end
end)

RegisterServerEvent('esx_ammujob:getStockItem')
AddEventHandler('esx_ammujob:getStockItem', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_ammu', function(inventory)

		local inventoryItem = inventory.getItem(itemName)

		-- is there enough in the society?
		if count > 0 and inventoryItem.count >= count then
		
			-- can the player carry the said amount of x item?
			if sourceItem.limit ~= -1 and (sourceItem.count + count) > sourceItem.limit then
				TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
			else
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				discordLog("vytahl **" .. inventoryItem.label .. "** v mnozstvi " .. count, source)
				TriggerClientEvent('esx:showNotification', _source, _U('have_withdrawn', count, inventoryItem.label))
			end
		else
			TriggerClientEvent('esx:showNotification', _source, _U('quantity_invalid'))
		end
	end)

end)

RegisterServerEvent('esx_ammujob:putStockItems')
AddEventHandler('esx_ammujob:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_ammu', function(inventory)

		local inventoryItem = inventory.getItem(itemName)

		-- does the player have enough of the item?
		if sourceItem.count >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			discordLog("vlozil **" .. inventoryItem.label .. "** v mnozstvi " .. count, source)
			
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_deposited', count, inventoryItem.label))
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end

	end)

end)

ESX.RegisterServerCallback('esx_ammujob:getOtherPlayerData', function(source, cb, target)
	if Config.EnableESXIdentity then
		local xPlayer = ESX.GetPlayerFromId(target)

		local identifier = GetPlayerIdentifiers(target)[1]

		local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
			['@identifier'] = identifier
		})

		local firstname = result[1].firstname
		local lastname  = result[1].lastname
		local sex       = result[1].sex
		local dob       = result[1].dateofbirth
		local height    = result[1].height

		local data = {
			name      = GetPlayerName(target),
			job       = xPlayer.job,
			inventory = xPlayer.inventory,
			accounts  = xPlayer.accounts,
			weapons   = xPlayer.loadout,
			firstname = firstname,
			lastname  = lastname,
			sex       = sex,
			dob       = dob,
			height    = height
		}

		TriggerEvent('esx_status:getStatus', target, 'drunk', function(status)
			if status ~= nil then
				data.drunk = math.floor(status.percent)
			end
		end)

		if Config.EnableLicenses then
			TriggerEvent('esx_license:getLicenses', target, function(licenses)
				data.licenses = licenses
				cb(data)
			end)
		else
			cb(data)
		end

	else

		local xPlayer = ESX.GetPlayerFromId(target)

		local data = {
			name       = GetPlayerName(target),
			job        = xPlayer.job,
			inventory  = xPlayer.inventory,
			accounts   = xPlayer.accounts,
			weapons    = xPlayer.loadout
		}

		TriggerEvent('esx_status:getStatus', target, 'drunk', function(status)
			if status ~= nil then
				data.drunk = math.floor(status.percent)
			end
		end)

		TriggerEvent('esx_license:getLicenses', target, function(licenses)
			data.licenses = licenses
		end)

		cb(data)

	end

end)

ESX.RegisterServerCallback('esx_ammujob:getFineList', function(source, cb, category)
	MySQL.Async.fetchAll('SELECT * FROM fine_types_ammu WHERE category = @category', {
		['@category'] = category
	}, function(fines)
		cb(fines)
	end)
end)

ESX.RegisterServerCallback('esx_ammujob:getVehicleInfos', function(source, cb, plate)

	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE @plate = plate', {
		['@plate'] = plate
	}, function(result)

		local retrivedInfo = {
			plate = plate
		}

		if result[1] then

			MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier',  {
				['@identifier'] = result[1].owner
			}, function(result2)

				if Config.EnableESXIdentity then
					retrivedInfo.owner = result2[1].firstname .. ' ' .. result2[1].lastname
				else
					retrivedInfo.owner = result2[1].name
				end

				cb(retrivedInfo)
			end)
		else
			cb(retrivedInfo)
		end
	end)
end)

ESX.RegisterServerCallback('esx_ammujob:getVehicleFromPlate', function(source, cb, plate)
	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)
		if result[1] ~= nil then

			MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier',  {
				['@identifier'] = result[1].owner
			}, function(result2)

				if Config.EnableESXIdentity then
					cb(result2[1].firstname .. ' ' .. result2[1].lastname, true)
				else
					cb(result2[1].name, true)
				end

			end)
		else
			cb(_U('unknown'), false)
		end
	end)
end)

ESX.RegisterServerCallback('esx_ammujob:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

	cb( { items = items } )
end)

ESX.RegisterServerCallback('esx_ammujob:getArmoryWeapons', function(source, cb)

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_ammu', function(store)

		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		cb(weapons)

	end)

end)

ESX.RegisterServerCallback('esx_ammujob:addArmoryWeapon', function(source, cb, weaponName, removeWeapon, amountM, amountP)

	local xPlayer = ESX.GetPlayerFromId(source)

	if removeWeapon then
		xPlayer.removeWeapon(weaponName)
		discordLog("vlozil zbran **" .. weaponName .. "**", source)
	end

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_ammu', function(store)

		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		local foundWeapon = false

		for i=1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = weapons[i].count + 1
				foundWeapon = true
				break
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

ESX.RegisterServerCallback('esx_ammujob:buy', function(source, cb, amountM, amountP)
	local xPlayer = ESX.GetPlayerFromId(source)
	local pieces = xPlayer.getInventoryItem('weapon_piece').count
	
	if amountP <= pieces then
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_ammu', function(account)
			if account.money >= amountM then
				account.removeMoney(amountM)
				xPlayer.removeInventoryItem('weapon_piece', amountP)
				cb(true)
			else
				cb(false)
			end
		end)
	end
end)

function discordLog(text, source)
	local time = os.date("%d.%m.%Y %X")
	local name = GetPlayerName(source)
	local identifier = GetPlayerIdentifiers(source)
	local msg = time .. ' : ' .. name .. ' - ' .. identifier[1] .. ' : ' .. text
	local url = "https://discordapp.com/api/webhooks/719209276836675685/UJq3Q_SDgVD7amZIgaTP-XG0JvdgevFnmQXW8L9sLpLDQ_OeZqSvrar6-_h_oscaSx84"
	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end

ESX.RegisterServerCallback('esx_ammujob:removeArmoryWeapon', function(source, cb, weaponName, bullets)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.addWeapon(weaponName, bullets)

	discordLog("vytahl zbran **" .. weaponName .. "**", source)

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_ammu', function(store)

		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		local foundWeapon = false

		for i=1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
				foundWeapon = true
				break
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

ESX.RegisterServerCallback('esx_ammujob:verM', function(source, cb, amountM)
	
	local xPlayer = ESX.GetPlayerFromId(source)
	
	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_ammu', function(account)
		if account.money >= amountM then
			cb(true)
		else
			cb(false)
		end
	end)
	
end)

ESX.RegisterServerCallback('esx_ammujob:verP', function(source, cb, amountP)
	
	local xPlayer = ESX.GetPlayerFromId(source)
	local pieces = xPlayer.getInventoryItem('weapon_piece').count
	
	if pieces >= amountP then
			cb(true)
		else
			cb(false)
		end
	

end)

ESX.RegisterServerCallback('esx_ammujob:getStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_ammu', function(inventory)
		cb(inventory.items)
	end)
end)


AddEventHandler('playerDropped', function()
	-- Save the source in case we lose it (which happens a lot)
	local _source = source
	
	-- Did the player ever join?
	if _source ~= nil then
		local xPlayer = ESX.GetPlayerFromId(_source)
		
		-- Is it worth telling all clients to refresh?
		if xPlayer ~= nil and xPlayer.job ~= nil and xPlayer.job.name == 'ammu' then
			Citizen.Wait(5000)
			TriggerClientEvent('esx_ammujob:updateBlip', -1)
		end
	end	
end)

RegisterServerEvent('esx_ammujob:spawned')
AddEventHandler('esx_ammujob:spawned', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if xPlayer ~= nil and xPlayer.job ~= nil and xPlayer.job.name == 'ammu' then
		Citizen.Wait(5000)
		TriggerClientEvent('esx_ammujob:updateBlip', -1)
	end
end)

RegisterServerEvent('esx_ammujob:forceBlip')
AddEventHandler('esx_ammujob:forceBlip', function()
	TriggerClientEvent('esx_ammujob:updateBlip', -1)
end)

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		Citizen.Wait(5000)
		TriggerClientEvent('esx_ammujob:updateBlip', -1)
	end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('esx_phone:removeNumber', 'ammu')
	end
end)

RegisterServerEvent('esx_ammujob:message')
AddEventHandler('esx_ammujob:message', function(target, msg)
	TriggerClientEvent('esx:showNotification', target, msg)
end)

-- ESX.RegisterServerCallback('esx_ammujob:getOtherPlayerData', function(source, cb, target, notify)
-- 	local xPlayer = ESX.GetPlayerFromId(target)

-- 	if notify then
-- 		xPlayer.showNotification(_U('being_searched'))
-- 	end

-- 	if xPlayer then
-- 		local data = {
-- 			name = GetPlayerName(target),
-- 			job = xPlayer.job.label,
-- 			grade = xPlayer.job.grade_label,
-- 			inventory = xPlayer.inventory,
-- 			accounts = xPlayer.accounts,
-- 			weapons = xPlayer.loadout,
-- 		}

-- 		if Config.EnableESXIdentity then
-- 			local identifier = GetPlayerIdentifiers(target)[1]

-- 			local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
-- 				['@identifier'] = identifier
-- 			})
-- 			local user = result[1]

-- 			data.firstname = user['firstname']
-- 			data.lastname = user['lastname']
-- 			data.dob = user['dateofbirth']
-- 			data.height = user['height'] .. "cm"
-- 			if user['sex'] == 'm' then
-- 				data.sex = 'male'
-- 			else
-- 				data.sex = 'female'
-- 			end
-- 		end

-- 		TriggerEvent('esx_status:getStatus', target, 'drunk', function(status)
-- 			if status then
-- 				data.drunk = ESX.Math.Round(status.percent)
-- 			end

-- 			if Config.EnableLicenses then
-- 				TriggerEvent('esx_license:getLicenses', target, function(licenses)
-- 					data.licenses = licenses
-- 					cb(data)
-- 				end)
-- 			else
-- 				cb(data)
-- 			end
-- 		end)
-- 	end
-- end)

-- SELLING
local function Sell(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local itemsSold = 0
    local totalCash = 0
    local itemsToSold = {
		{item = 'weapon_piece', price = 100},
	}

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
        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_ammu', function(account)
            societyAccount = account
        end)

        if societyAccount ~= nil then
            societyAccount.addMoney(totalCash * 0.60)
            xPlayer.addMoney(totalCash * 0.40)
            xPlayer.showNotification('Prodal/a jsi ' .. itemsSold .. ' vyrobku za ' .. totalCash * 0.40 .. ' pro sebe a ' .. totalCash * 0.60 .. ' pro firmu.')

            local msg = GetPlayerName(source) .. " prodal/a " .. itemsSold .. " vyrobku za " .. totalCash * 0.40 .. ' pro sebe a ' .. totalCash * 0.60 .. ' pro firmu.'
		    local url = "https://discordapp.com/api/webhooks/727892727743905823/WbOMuZvjxMyETtHp-xn3RmPMPNrx3GZnnV9Xp9UdrNVMytKFEK6qiByiTn8mjMlN9hwi"
            PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})

            itemsSold = 0
            totalCash = 0
        end
    end
end

RegisterServerEvent('esx_ammujob:startSell')
AddEventHandler('esx_ammujob:startSell', function()
	local _source = source
    Sell(_source)
end)
