local ESX 						   = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

local CopsConnected       	   = 0
local PlayersHarvesting		   = {}

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
local function Harvest(source, timeHash)

	if CopsConnected < Config.RequiredCops then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsCoke))
		PlayersHarvesting[source] = nil
		return
	end

	SetTimeout(Config.TimeToFarm, function()
		if PlayersHarvesting[source] == timeHash then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local weapon_piece = xPlayer.getInventoryItem('weapon_piece')

			if weapon_piece.limit ~= -1 and weapon_piece.count >= weapon_piece.limit then
				TriggerClientEvent('esx:showNotification', source, 'Nemas misto v inventari')
			else
				xPlayer.addInventoryItem('weapon_piece', 1)
				Harvest(source, timeHash)
			end

		end
	end)
end

RegisterServerEvent('piecelector:startHarvest')
AddEventHandler('piecelector:startHarvest', function()
	local _source = source

	if PlayersHarvesting[_source] == nil then
		local timeHash = os.time()
		PlayersHarvesting[_source] = timeHash
		TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))
		Harvest(_source, timeHash)
	end
end)

RegisterServerEvent('piecelector:stopHarvest')
AddEventHandler('piecelector:stopHarvest', function()
	local _source = source

	if PlayersHarvesting[_source] ~= nil then
		PlayersHarvesting[_source] = nil
	end
end)