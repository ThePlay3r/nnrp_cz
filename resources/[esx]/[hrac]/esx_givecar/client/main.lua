-- Client

ESX               = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent("esx_givecarkeys:keys")
AddEventHandler("esx_givecarkeys:keys", function()
	giveCarKeys()
end)

RegisterNetEvent("esx_givecarkeys:setBazarKeys")
AddEventHandler("esx_givecarkeys:setBazarKeys", function(owner)
	setBazarKeys(owner)
end)

function giveCarKeys()
	local playerPed = GetPlayerPed(-1)
	local coords    = GetEntityCoords(playerPed)
	local vehicle = nil

	if IsPedInAnyVehicle(playerPed,  false) then
        vehicle = GetVehiclePedIsIn(playerPed, false)			
    else
        vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 7.0, 0, 70)
    end

	local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
	local carModelName = exports.nnvozidla:getVehicleName(GetDisplayNameFromVehicleModel(vehicleProps.model))

	ESX.TriggerServerCallback('esx_givecarkeys:requestPlayerCars', function(isOwnedVehicle)

		if isOwnedVehicle then
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

			if closestPlayer == -1 or closestDistance > 3.0 then
				ESX.ShowNotification('Zadny hrac neni v okoli!')
			else
				ESX.ShowNotification('Daroval/a jsi klicky od auta s SPZ ~g~'..vehicleProps.plate..'!')
				TriggerServerEvent('esx_givecarkeys:setVehicleOwnedPlayerId', GetPlayerServerId(closestPlayer), vehicleProps, GetPlayerServerId(PlayerId()), carModelName)
			end
		end
	end, GetVehicleNumberPlateText(vehicle))
end

function setBazarKeys (owner)
	local playerPed = GetPlayerPed(-1)
	local coords    = GetEntityCoords(playerPed)
	local vehicle = nil

	if IsPedInAnyVehicle(playerPed,  false) then
        vehicle = GetVehiclePedIsIn(playerPed, false)			
    else
        vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 7.0, 0, 70)
    end

	local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
	local carModelName = exports.nnvozidla:getVehicleName(GetDisplayNameFromVehicleModel(vehicleProps.model))

	ESX.TriggerServerCallback('esx_givecarkeys:requestPlayerAndBazarCars', function(isOwnedVehicle)
		if isOwnedVehicle then
			TriggerServerEvent('esx_givecarkeys:setVehicleOwnedPlayerIdInBazar', owner, vehicleProps, GetPlayerServerId(PlayerId()), carModelName)
		else
			ESX.ShowNotification('Od tohoto auta nemas moznost ziskat klice')
		end
	end, GetVehicleNumberPlateText(vehicle), owner)
end
