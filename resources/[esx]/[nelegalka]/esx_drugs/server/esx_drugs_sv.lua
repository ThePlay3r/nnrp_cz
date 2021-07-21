ESX 						   = nil
local CopsConnected       	   = 0
local PlayersHarvestingCoke    = {}
local PlayersTransformingCoke  = {}
local PlayersSellingCoke       = {}
local PlayersHarvestingMeth    = {}
local PlayersTransformingMeth  = {}
local PlayersSellingMeth       = {}
local PlayersHarvestingWeed    = {}
local PlayersTransformingWeed  = {}
local PlayersSellingWeed       = {}
local PlayersHarvestingOpium   = {}
local PlayersTransformingOpium = {}
local PlayersSellingOpium      = {}
local PlayersHarvestingCigar   = {}
local PlayersTransformingCigar = {}
local PlayersSellingCigar      = {}

local PlayersHarvestingLsd   = {}
local PlayersTransformingLsd = {}
local PlayersSellingLsd      = {}

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

function CountCops()
	TriggerEvent('jobscount:getJobs', function(savedJobs)
		CopsConnected = 0
		for k,v in pairs(savedJobs) do
			if v == 'police' or v == 'sheriff' then
				CopsConnected = CopsConnected + 1
			end
		end
	end)
	SetTimeout(120 * 1000, CountCops)
end

CountCops()

--coke
local function HarvestCoke(source)

	if CopsConnected < Config.RequiredCopsCoke then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsCoke))
		return
	end

	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingCoke[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local coke = xPlayer.getInventoryItem('coke')

			if coke.limit ~= -1 and coke.count >= coke.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_coke'))
			else
				xPlayer.addInventoryItem('coke', 1)
				HarvestCoke(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startHarvestILovePizzaCoke')
AddEventHandler('esx_drugs:startHarvestILovePizzaCoke', function()

	local _source = source

	PlayersHarvestingCoke[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestCoke(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvILovePizzaestCoke')
AddEventHandler('esx_drugs:stopHarvILovePizzaestCoke', function()

	local _source = source

	PlayersHarvestingCoke[_source] = false

end)

local function TransformCoke(source)

	if CopsConnected < Config.RequiredCopsCoke then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsCoke))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingCoke[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local cokeQuantity = xPlayer.getInventoryItem('coke').count
			local poochQuantity = xPlayer.getInventoryItem('coke_pooch').count

			if poochQuantity > 14 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif cokeQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_coke'))
			else
				xPlayer.removeInventoryItem('coke', 5)
				xPlayer.addInventoryItem('coke_pooch', 1)
			
				TransformCoke(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTransILovePizzaformCoke')
AddEventHandler('esx_drugs:startTransILovePizzaformCoke', function()

	local _source = source

	PlayersTransformingCoke[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformCoke(_source)

end)

RegisterServerEvent('esx_drugs:stopTranILovePizzasformCoke')
AddEventHandler('esx_drugs:stopTranILovePizzasformCoke', function()

	local _source = source

	PlayersTransformingCoke[_source] = false

end)

local function SellCoke(source)

	if CopsConnected < Config.RequiredCopsCoke then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsCoke))
		return
	end

	SetTimeout(Config.TimeToSell, function()

		if PlayersSellingCoke[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local poochQuantity = xPlayer.getInventoryItem('coke_pooch').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('coke_pooch', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('black_money', 60)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 350)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 450)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 650)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 1350)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', 1750)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
				end
				
				SellCoke(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startSellCILovePizzaoke')
AddEventHandler('esx_drugs:startSellCILovePizzaoke', function()

	local _source = source

	PlayersSellingCoke[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellCoke(_source)

end)

RegisterServerEvent('esx_drugs:stopSellILovePizzaCoke')
AddEventHandler('esx_drugs:stopSellILovePizzaCoke', function()

	local _source = source

	PlayersSellingCoke[_source] = false

end)

--meth
local function HarvestMeth(source)

	if CopsConnected < Config.RequiredCopsMeth then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsMeth))
		return
	end
	
	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingMeth[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local meth = xPlayer.getInventoryItem('meth')

			if meth.limit ~= -1 and meth.count >= meth.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_meth'))
			else
				xPlayer.addInventoryItem('meth', 1)
				HarvestMeth(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startHarILovePizzavestMeth')
AddEventHandler('esx_drugs:startHarILovePizzavestMeth', function()

	local _source = source

	PlayersHarvestingMeth[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestMeth(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvesILovePizzatMeth')
AddEventHandler('esx_drugs:stopHarvesILovePizzatMeth', function()

	local _source = source

	PlayersHarvestingMeth[_source] = false

end)

local function TransformMeth(source)

	if CopsConnected < Config.RequiredCopsMeth then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsMeth))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingMeth[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local methQuantity = xPlayer.getInventoryItem('meth').count
			local poochQuantity = xPlayer.getInventoryItem('meth_pooch').count

			if poochQuantity > 14 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif methQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_meth'))
			else
				xPlayer.removeInventoryItem('meth', 5)
				xPlayer.addInventoryItem('meth_pooch', 1)
				
				TransformMeth(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTILovePizzaransformMeth')
AddEventHandler('esx_drugs:startTILovePizzaransformMeth', function()

	local _source = source

	PlayersTransformingMeth[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformMeth(_source)

end)

RegisterServerEvent('esx_drugs:stopTranILovePizzasformMeth')
AddEventHandler('esx_drugs:stopTranILovePizzasformMeth', function()

	local _source = source

	PlayersTransformingMeth[_source] = false

end)

local function SellMeth(source)

	if CopsConnected < Config.RequiredCopsMeth then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsMeth))
		return
	end

	SetTimeout(Config.TimeToSell, function()

		if PlayersSellingMeth[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local poochQuantity = xPlayer.getInventoryItem('meth_pooch').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', _source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('meth_pooch', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('black_money', 10)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 350)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 450)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 650)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 1350)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
				elseif CopsConnected == 5 then
					xPlayer.addAccountMoney('black_money', 1750)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
				elseif CopsConnected >= 6 then
					xPlayer.addAccountMoney('black_money', 1750)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
				end
				
				SellMeth(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startSellMILovePizzaeth')
AddEventHandler('esx_drugs:startSellMILovePizzaeth', function()

	local _source = source

	PlayersSellingMeth[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellMeth(_source)

end)

RegisterServerEvent('esx_drugs:stopSellMILovePizzaeth')
AddEventHandler('esx_drugs:stopSellMILovePizzaeth', function()

	local _source = source

	PlayersSellingMeth[_source] = false

end)

--weed
local function HarvestWeed(source)
	if CopsConnected < Config.RequiredCopsWeed then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsWeed))
		return
	end

	local timeToFarm = Config.TimeToFarm

	if CopsConnected > 4 then
		timeToFarm = Config.TimeShort
	end

	SetTimeout(timeToFarm, function()

		if PlayersHarvestingWeed[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local weed = xPlayer.getInventoryItem('weed')

			if weed.limit ~= -1 and weed.count >= weed.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_weed'))
			else
				xPlayer.addInventoryItem('weed', 1)
				HarvestWeed(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startHarvestWILovePizzaeed')
AddEventHandler('esx_drugs:startHarvestWILovePizzaeed', function()

	local _source = source

	PlayersHarvestingWeed[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestWeed(_source)

end)

RegisterServerEvent('esx_drugs:stopHarILovePizzavestWeed')
AddEventHandler('esx_drugs:stopHarILovePizzavestWeed', function()

	local _source = source

	PlayersHarvestingWeed[_source] = false

end)

local function TransformWeed(source)

	if CopsConnected < Config.RequiredCopsWeed then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsWeed))
		return
	end

	local timeToProcess = Config.TimeToProcess

	if CopsConnected > 4 then
		timeToProcess = Config.TimeShort
	end

	SetTimeout(timeToProcess, function()

		if PlayersTransformingWeed[source] == true then

			local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)
			
			local weedQuantity = xPlayer.getInventoryItem('weed').count
			local poochQuantity = xPlayer.getInventoryItem('weed_pooch').count

			if poochQuantity > 14 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif weedQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_weed'))
			else
				xPlayer.removeInventoryItem('weed', 5)
				xPlayer.addInventoryItem('weed_pooch', 1)
				
				TransformWeed(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTransfoILovePizzarmWeed')
AddEventHandler('esx_drugs:startTransfoILovePizzarmWeed', function()

	local _source = source

	PlayersTransformingWeed[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformWeed(_source)

end)

RegisterServerEvent('esx_drugs:stopTILovePizzaransformWeed')
AddEventHandler('esx_drugs:stopTILovePizzaransformWeed', function()

	local _source = source

	PlayersTransformingWeed[_source] = false

end)

local function SellWeed(source)

	if CopsConnected < Config.RequiredCopsWeed then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsWeed))
		return
	end

	local timeToSell = Config.TimeToSell

	if CopsConnected > 4 then
		timeToSell = Config.TimeShort
	end

	SetTimeout(timeToSell, function()

		if PlayersSellingWeed[source] == true then

			local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)

			local poochQuantity = xPlayer.getInventoryItem('weed_pooch').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('weed_pooch', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('black_money', 100)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 420)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 890)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 1410)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
				elseif CopsConnected >= 4 then
					xPlayer.addAccountMoney('black_money', 2030)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
				end
				
				SellWeed(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startSellWeILovePizzaed')
AddEventHandler('esx_drugs:startSellWeILovePizzaed', function()

	local _source = source

	PlayersSellingWeed[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellWeed(_source)

end)

RegisterServerEvent('esx_drugs:stopSellWILovePizzaeed')
AddEventHandler('esx_drugs:stopSellWILovePizzaeed', function()

	local _source = source

	PlayersSellingWeed[_source] = false

end)


--opium

local function HarvestOpium(source)

	if CopsConnected < Config.RequiredCopsOpium then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsOpium))
		return
	end

	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingOpium[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local opium = xPlayer.getInventoryItem('opium')

			if opium.limit ~= -1 and opium.count >= opium.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_opium'))
			else
				xPlayer.addInventoryItem('opium', 1)
				HarvestOpium(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startHILovePizzaarvestOpium')
AddEventHandler('esx_drugs:startHILovePizzaarvestOpium', function()

	local _source = source

	PlayersHarvestingOpium[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestOpium(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvestILovePizzaOpium')
AddEventHandler('esx_drugs:stopHarvestILovePizzaOpium', function()

	local _source = source

	PlayersHarvestingOpium[_source] = false

end)

local function TransformOpium(source)

	if CopsConnected < Config.RequiredCopsOpium then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsOpium))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingOpium[source] == true then

			local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)

			local opiumQuantity = xPlayer.getInventoryItem('opium').count
			local poochQuantity = xPlayer.getInventoryItem('opium_pooch').count

			if poochQuantity > 14 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif opiumQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_opium'))
			else
				xPlayer.removeInventoryItem('opium', 5)
				xPlayer.addInventoryItem('opium_pooch', 1)
			
				TransformOpium(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:starILovePizzatTransformOpium')
AddEventHandler('esx_drugs:starILovePizzatTransformOpium', function()

	local _source = source

	PlayersTransformingOpium[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformOpium(_source)

end)

RegisterServerEvent('esx_drugs:stopTransILovePizzaformOpium')
AddEventHandler('esx_drugs:stopTransILovePizzaformOpium', function()

	local _source = source

	PlayersTransformingOpium[_source] = false

end)

local function SellOpium(source)

	if CopsConnected < Config.RequiredCopsOpium then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsOpium))
		return
	end

	SetTimeout(Config.TimeToSell, function()

		if PlayersSellingOpium[source] == true then

			local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)

			local poochQuantity = xPlayer.getInventoryItem('opium_pooch').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('opium_pooch', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('black_money', 1)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 1)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 1)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 1)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', 1)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', 1)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
				end
				
				SellOpium(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startSellILovePizzaOpium')
AddEventHandler('esx_drugs:startSellILovePizzaOpium', function()

	local _source = source

	PlayersSellingOpium[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellOpium(_source)

end)

RegisterServerEvent('esx_drugs:stopSellOpiuILovePizzam')
AddEventHandler('esx_drugs:stopSellOpiuILovePizzam', function()

	local _source = source

	PlayersSellingOpium[_source] = false

end)

RegisterServerEvent('esx_drugs:GetUserInventory')
AddEventHandler('esx_drugs:GetUserInventory', function(currentZone, zoneCoords)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx_drugs:ReturnInventory', 
		_source, 
		xPlayer.getInventoryItem('coke').count, 
		xPlayer.getInventoryItem('coke_pooch').count,
		xPlayer.getInventoryItem('meth').count, 
		xPlayer.getInventoryItem('meth_pooch').count, 
		xPlayer.getInventoryItem('weed').count, 
		xPlayer.getInventoryItem('weed_pooch').count, 
		xPlayer.getInventoryItem('opium').count, 
		xPlayer.getInventoryItem('opium_pooch').count,
		xPlayer.getInventoryItem('cigarette').count,
		xPlayer.getInventoryItem('cigarettepack').count,
		xPlayer.getInventoryItem('lsd').count,
		xPlayer.getInventoryItem('lsd_pooch').count,
		xPlayer.job.name, 
		currentZone,
		zoneCoords
	)
end)

ESX.RegisterUsableItem('meth_pooch', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('meth_pooch', 1)

	TriggerClientEvent('esx_drugs:onPot', _source)
	TriggerClientEvent('esx:showNotification', _source, _U('used_one_meth'))
end)

ESX.RegisterUsableItem('lsd_pooch', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('lsd_pooch', 1)

	TriggerClientEvent('esx_drugs:onPot', _source)
	TriggerClientEvent('esx:showNotification', _source, _U('used_one_lsd'))
end)

ESX.RegisterUsableItem('weed_pooch', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('weed_pooch', 1)

	TriggerClientEvent('esx_drugs:onPot', _source)
	TriggerClientEvent('esx:showNotification', _source, _U('used_one_weed'))
end)

ESX.RegisterUsableItem('cigarette', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('cigarette', 1)

	TriggerClientEvent('esx_drugs:onPotWithoutEffect', _source)
	TriggerClientEvent('esx:showNotification', _source, _U('used_one_cigar'))
end)

ESX.RegisterUsableItem('cigarettepack', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('cigarettepack', 1)
	xPlayer.addInventoryItem('cigarette', 5)
end)

-- Cigar

local function HarvestCigar(source)

	if CopsConnected < Config.RequiredCopsCigar then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsCigar))
		return
	end

	SetTimeout(Config.TimeShort, function()

		if PlayersHarvestingCigar[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local cigar = xPlayer.getInventoryItem('cigarette')

			if cigar.limit ~= -1 and cigar.count >= cigar.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_cigar'))
			else
				xPlayer.addInventoryItem('cigarette', 1)
				HarvestCigar(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startHarvestCigar')
AddEventHandler('esx_drugs:startHarvestCigar', function()

	local _source = source

	PlayersHarvestingCigar[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestCigar(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvestCigar')
AddEventHandler('esx_drugs:stopHarvestCigar', function()

	local _source = source

	PlayersHarvestingCigar[_source] = false

end)

local function TransformCigar(source)

	if CopsConnected < Config.RequiredCopsCigar then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsCigar))
		return
	end

	SetTimeout(Config.TimeShort, function()

		if PlayersTransformingCigar[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local cigarQuantity = xPlayer.getInventoryItem('cigarette').count
			local poochQuantity = xPlayer.getInventoryItem('cigarettepack').count

			if poochQuantity > 14 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif cigarQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_cigar'))
			else
				xPlayer.removeInventoryItem('cigarette', 5)
				xPlayer.addInventoryItem('cigarettepack', 1)
			
				TransformCigar(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformCigar')
AddEventHandler('esx_drugs:startTransformCigar', function()

	local _source = source

	PlayersTransformingCigar[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformCigar(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformCigar')
AddEventHandler('esx_drugs:stopTransformCigar', function()

	local _source = source

	PlayersTransformingCigar[_source] = false

end)

local function SellCigar(source)

	if CopsConnected < Config.RequiredCopsCigar then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsCigar))
		return
	end

	SetTimeout(Config.TimeToSell, function()

		if PlayersSellingCigar[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local poochQuantity = xPlayer.getInventoryItem('cigarettepack').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('cigarettepack', 1)
				-- if CopsConnected == 0 then
				local societyAccount = nil
				TriggerEvent('esx_addonaccount:getSharedAccount', 'society_lost', function(account)
					societyAccount = account
				end)
		
				if societyAccount ~= nil then
					local price = 650
					societyAccount.addMoney(price * 0.15)
					xPlayer.addMoney(price * 0.85)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_cigar'))
				end
				-- elseif CopsConnected == 1 then
				-- 	xPlayer.addAccountMoney('black_money', 350)
				-- 	TriggerClientEvent('esx:showNotification', source, _U('sold_one_cigar'))
				-- elseif CopsConnected == 2 then
				-- 	xPlayer.addAccountMoney('black_money', 450)
				-- 	TriggerClientEvent('esx:showNotification', source, _U('sold_one_cigar'))
				-- elseif CopsConnected == 3 then
				-- 	xPlayer.addAccountMoney('black_money', 650)
				-- 	TriggerClientEvent('esx:showNotification', source, _U('sold_one_cigar'))
				-- elseif CopsConnected == 4 then
				-- 	xPlayer.addAccountMoney('black_money', 1350)
				-- 	TriggerClientEvent('esx:showNotification', source, _U('sold_one_cigar'))
				-- elseif CopsConnected >= 5 then
				-- 	xPlayer.addAccountMoney('black_money', 1750)
				-- 	TriggerClientEvent('esx:showNotification', source, _U('sold_one_cigar'))
				-- end
				
				SellCigar(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startSellCigar')
AddEventHandler('esx_drugs:startSellCigar', function()

	local _source = source

	PlayersSellingCigar[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellCigar(_source)

end)

RegisterServerEvent('esx_drugs:stopSellCigar')
AddEventHandler('esx_drugs:stopSellCigar', function()

	local _source = source

	PlayersSellingCigar[_source] = false

end)

-- LSD

local function HarvestLsd(source)

	if CopsConnected < Config.RequiredCopsLsd then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsLsd))
		return
	end

	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingLsd[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local lsd = xPlayer.getInventoryItem('lsd')

			if lsd.limit ~= -1 and lsd.count >= lsd.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_lsd'))
			else
				xPlayer.addInventoryItem('lsd', 1)
				HarvestLsd(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startHarvestLsd')
AddEventHandler('esx_drugs:startHarvestLsd', function()

	local _source = source

	PlayersHarvestingLsd[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestLsd(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvestLsd')
AddEventHandler('esx_drugs:stopHarvestLsd', function()

	local _source = source

	PlayersHarvestingLsd[_source] = false

end)

local function TransformLsd(source)

	if CopsConnected < Config.RequiredCopsLsd then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsLsd))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingLsd[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local lsdQuantity = xPlayer.getInventoryItem('lsd').count
			local poochQuantity = xPlayer.getInventoryItem('lsd_pooch').count

			if poochQuantity > 14 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif lsdQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_lsd'))
			else
				xPlayer.removeInventoryItem('lsd', 5)
				xPlayer.addInventoryItem('lsd_pooch', 1)
			
				TransformLsd(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformLsd')
AddEventHandler('esx_drugs:startTransformLsd', function()

	local _source = source

	PlayersTransformingLsd[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformLsd(_source)

end)

RegisterServerEvent('esx_drugs:stopTransformLsd')
AddEventHandler('esx_drugs:stopTransformLsd', function()

	local _source = source

	PlayersTransformingLsd[_source] = false

end)

local function SellLsd(source)

	if CopsConnected < Config.RequiredCopsLsd then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsLsd))
		return
	end

	SetTimeout(Config.TimeToSell, function()

		if PlayersSellingLsd[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local poochQuantity = xPlayer.getInventoryItem('lsd_pooch').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('lsd_pooch', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('black_money', 10)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_lsd'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', 350)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_lsd'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', 450)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_lsd'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', 650)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_lsd'))
				elseif CopsConnected >= 4 then
					xPlayer.addAccountMoney('black_money', 1350)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_lsd'))
				end
				
				SellLsd(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startSellLsd')
AddEventHandler('esx_drugs:startSellLsd', function()

	local _source = source

	PlayersSellingLsd[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellLsd(_source)

end)

RegisterServerEvent('esx_drugs:stopSellLsd')
AddEventHandler('esx_drugs:stopSellLsd', function()

	local _source = source

	PlayersSellingLsd[_source] = false

end)