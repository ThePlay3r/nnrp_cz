-----------------------------------------
-- Created and modify by L'ile Légale RP
-- SenSi and Kaminosekai
-----------------------------------------
ESX = nil
local PlayersTransforming, PlayersSelling, PlayersHarvesting = {}, {}, {}
local vine, jus = 1, 1
local itemsSold = 0

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
	TriggerEvent('esx_service:activateService', 'vigne', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'vigne', _U('vigneron_client'), true, true)
TriggerEvent('esx_society:registerSociety', 'vigne', 'Vigneron', 'society_vigne', 'society_vigne', 'society_vigne', {type = 'private'})
local function Harvest(source, zone, timeHash)
	if PlayersHarvesting[source] == timeHash then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "RaisinFarm" then
			local itemQuantity = xPlayer.getInventoryItem('raisin').count
			if itemQuantity >= 100 then
				xPlayer.showNotification(_U('not_enough_place'))
				return
			else
				SetTimeout(1800, function()
					if timeHash == PlayersHarvesting[source] then
						xPlayer.addInventoryItem('raisin', 1)
						Harvest(source, zone, timeHash)
					end
				end)
			end
		end
	end
end

RegisterServerEvent('esx_vigneronjob:confiscatePlayerItem')
AddEventHandler('esx_vigneronjob:confiscatePlayerItem', function(target, itemType, itemName, amount)
	local _source = source
	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if sourceXPlayer.job.name ~= 'vigneron' then
		print(('esx_vigneronjob: %s attempted to confiscate!'):format(xPlayer.identifier))
		return
	end

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

ESX.RegisterServerCallback('esx_vigneronjob:getOtherPlayerData', function(source, cb, target)
	local xPlayer = ESX.GetPlayerFromId(target)
	local result = MySQL.Sync.fetchAll('SELECT firstname, lastname, sex, dateofbirth, height FROM users WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
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
end)

RegisterServerEvent('esx_vigneronjob:startHarvest')
AddEventHandler('esx_vigneronjob:startHarvest', function(zone)
	local _source = source
  	
	if PlayersHarvesting[_source] == nil then
		local timeHash = os.time()
		PlayersHarvesting[_source] = timeHash
		TriggerClientEvent('esx:showNotification', _source, _U('raisin_taken'))  
		Harvest(_source,zone, timeHash)
	end
end)

RegisterServerEvent('esx_vigneronjob:stopHarvest')
AddEventHandler('esx_vigneronjob:stopHarvest', function()
	local _source = source
	
	if PlayersHarvesting[_source] ~= nil then
		PlayersHarvesting[_source] = nil
	end
end)

local function Transform(source, zone, timeHash)

	if PlayersTransforming[source] == timeHash then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "TraitementVin" then
			local itemQuantity = xPlayer.getInventoryItem('raisin').count

			if itemQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_raisin'))
				return
			else
				local rand = math.random(0,100)
				if (rand >= 98) then
					SetTimeout(1800, function()
						if timeHash == PlayersTransforming[source] then
							xPlayer.removeInventoryItem('raisin', 10)
							xPlayer.addInventoryItem('grand_cru', 1)
							xPlayer.showNotification(_U('grand_cru'))
							Transform(source, zone, timeHash)
						end
					end)
				else
					SetTimeout(1800, function()
						if timeHash == PlayersTransforming[source] then
							xPlayer.removeInventoryItem('raisin', 10)
							xPlayer.addInventoryItem('vine', 1)
					
							Transform(source, zone, timeHash)
						end
					end)
				end
			end
		elseif zone == "TraitementJus" then
			local itemQuantity = xPlayer.getInventoryItem('raisin').count
			if itemQuantity <= 0 then
				xPlayer.showNotification(_U('not_enough_raisin'))
				return
			else
				SetTimeout(1800, function()
					if timeHash == PlayersTransforming[source] then
						xPlayer.removeInventoryItem('raisin', 2)
						xPlayer.addInventoryItem('jus_raisin', 1)
						
						Transform(source, zone, timeHash)
					end
				end)
			end
		end
	end	
end

RegisterServerEvent('esx_vigneronjob:startTransform')
AddEventHandler('esx_vigneronjob:startTransform', function(zone)
	local _source = source

	if PlayersTransforming[_source] == nil then
		local timeHash = os.time()
		PlayersTransforming[_source] = timeHash
		TriggerClientEvent('esx:showNotification', _source, _U('transforming_in_progress')) 
		Transform(_source,zone, timeHash)
	end	
end)

RegisterServerEvent('esx_vigneronjob:stopTransform')
AddEventHandler('esx_vigneronjob:stopTransform', function()
	local _source = source
	
	if PlayersTransforming[_source] ~= nil then
		PlayersTransforming[_source] = nil
	end
end)

local function Sell(source, zone, timeHash)

	if PlayersSelling[source] == timeHash then
		local xPlayer  = ESX.GetPlayerFromId(source)
		
		if zone == 'SellFarm' then
			if xPlayer.getInventoryItem('vine').count <= 0 then
				vine = 0
			else
				vine = 1
			end
			
			if xPlayer.getInventoryItem('jus_raisin').count <= 0 then
				jus = 0
			else
				jus = 1
			end
		
			if vine == 0 and jus == 0 then
				xPlayer.showNotification(_U('no_product_sale'))
				return
			elseif xPlayer.getInventoryItem('vine').count <= 0 and jus == 0 then
				xPlayer.showNotification(_U('no_vin_sale'))
				vine = 0
				return
			elseif xPlayer.getInventoryItem('jus_raisin').count <= 0 and vine == 0 then
				xPlayer.showNotification(_U('no_jus_sale'))
				jus = 0
				return
			else
				if (jus == 1) then
					SetTimeout(1100, function()
						if timeHash == PlayersSelling[source] then
							xPlayer.removeInventoryItem('jus_raisin', 1)
							local societyAccount = nil

							TriggerEvent('esx_addonaccount:getSharedAccount', 'society_vigne', function(account)
								societyAccount = account
							end)
							if societyAccount ~= nil then
								societyAccount.addMoney(90)
								xPlayer.addMoney(90)
								TriggerClientEvent('esx:showNotification', xPlayer.source, _U('comp_earned') .. 180)
							end
							itemsSold = itemsSold + 1
							Sell(source,zone, timeHash)
						end
					end)
				elseif (vine == 1) then
					SetTimeout(1100, function()
						if timeHash == PlayersSelling[source] then
							xPlayer.removeInventoryItem('vine', 1)
							local societyAccount = nil

							TriggerEvent('esx_addonaccount:getSharedAccount', 'society_vigne', function(account)
								societyAccount = account
							end)
							if societyAccount ~= nil then
								societyAccount.addMoney(330)
								xPlayer.addMoney(330)
								TriggerClientEvent('esx:showNotification', xPlayer.source, _U('comp_earned') .. 660)
							end
							itemsSold = itemsSold + 1
							Sell(source,zone, timeHash)
						end
					end)
				end
			end
		end
	end
end

RegisterServerEvent('esx_vigneronjob:message')
AddEventHandler('esx_vigneronjob:message', function(target, msg)
	TriggerClientEvent('esx:showNotification', target, msg)
end)

RegisterServerEvent('esx_vigneronjob:startSell')
AddEventHandler('esx_vigneronjob:startSell', function(zone)
	local _source = source

	if PlayersSelling[_source] == nil then
		local timeHash = os.time()
		PlayersSelling[_source]= timeHash
		TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))
		Sell(_source, zone, timeHash)
	end
end)

RegisterServerEvent('esx_vigneronjob:stopSell')
AddEventHandler('esx_vigneronjob:stopSell', function()
	local _source = source
	
	if PlayersSelling[_source] ~= nil then
		PlayersSelling[_source] = nil
	end

	if itemsSold > 0 then
		local msg = "Vinar " .. GetPlayerName(_source) .. " prodal/a " .. itemsSold .. " vyrobku"
		local url = "https://discordapp.com/api/webhooks/706831211036803086/87UN8dBhUIkYawX3o331A_6IkZ51DtYjd2HEU81KBPQbfucR9XPY05HHnRZcmSnO4YgV"
		PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
		itemsSold = 0
	end
end)

RegisterServerEvent('esx_vigneronjob:getStockItem')
AddEventHandler('esx_vigneronjob:getStockItem', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_vigne', function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= count then
			inventory.removeItem(itemName, count)
			xPlayer.addInventoryItem(itemName, count)
		else
			xPlayer.showNotification(_U('quantity_invalid'))
		end

		xPlayer.showNotification(_U('have_withdrawn') .. count .. ' ' .. item.label)
	end)
end)

ESX.RegisterServerCallback('esx_vigneronjob:getStockItems', function(source, cb)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_vigne', function(inventory)
		cb(inventory.items)
	end)
end)

RegisterServerEvent('esx_vigneronjob:putStockItems')
AddEventHandler('esx_vigneronjob:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_vigne', function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
		else
			xPlayer.showNotification(_U('quantity_invalid'))
		end

		xPlayer.showNotification(_U('added') .. count .. ' ' .. item.label)
	end)
end)

ESX.RegisterServerCallback('esx_vigneronjob:getPlayerInventory', function(source, cb)
	local xPlayer    = ESX.GetPlayerFromId(source)
	local items      = xPlayer.inventory

	cb({
		items      = items
	})
end)

ESX.RegisterUsableItem('jus_raisin', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('jus_raisin', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	xPlayer.showNotification(_U('used_jus'))
end)

ESX.RegisterUsableItem('grand_cru', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('grand_cru', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 400000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	xPlayer.showNotification(_U('used_grand_cru'))
end)
