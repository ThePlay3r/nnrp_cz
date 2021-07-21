local ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

AddEventHandler('esx_casinojob:openVehicleSpawnerMenu', function()
	local vehicles = Config.Zones.Vehicles

	ESX.UI.Menu.CloseAll()

	if Config.EnableSocietyOwnedVehicles then

		local elements = {}

		ESX.TriggerServerCallback('esx_society:getVehiclesInGarage', function(garageVehicles)

			for i=1, #garageVehicles, 1 do
				table.insert(elements, {label = GetDisplayNameFromVehicleModel(garageVehicles[i].model) .. ' [' .. garageVehicles[i].plate .. ']', value = garageVehicles[i]})
			end

			ESX.UI.Menu.Open(
				'default', GetCurrentResourceName(), 'vehicle_spawner',
				{
					title    = _U('vehicle_menu'),
					align    = 'left',
					elements = elements,
				},
				function(data, menu)

					menu.close()

					local vehicleProps = data.current.value
					ESX.Game.SpawnVehicle(vehicleProps.model, vehicles.SpawnPoint, vehicles.Heading, function(vehicle)
							ESX.Game.SetVehicleProperties(vehicle, vehicleProps)
							local playerPed = GetPlayerPed(-1)
				local plate = 'WORK' .. math.random(100, 900)
							TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)  -- teleport into vehicle
				TriggerServerEvent('esx_vehiclelock:givekey', 'no', plate) -- vehicle lock
				SetVehicleNumberPlateText(vehicle, plate)
				table.insert(myPlate, plate)
				plate = string.gsub(plate, " ", "")
					end)            

					TriggerServerEvent('esx_society:removeVehicleFromGarage', 'casino', vehicleProps)

				end,
				function(data, menu)
					menu.close()
				end
			)

		end, 'casino')

	else

		local elements = {}

		for i=1, #Config.AuthorizedVehicles, 1 do
			local vehicle = Config.AuthorizedVehicles[i]
			table.insert(elements, {label = vehicle.label, value = vehicle.name})
		end

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'vehicle_spawner',
			{
				title    = _U('vehicle_menu'),
				align    = 'left',
				elements = elements,
			},
			function(data, menu)

				menu.close()

				local model = data.current.value

				local vehicle = GetClosestVehicle(vehicles.SpawnPoint.x,  vehicles.SpawnPoint.y,  vehicles.SpawnPoint.z,  3.0,  0,  71)

				if not DoesEntityExist(vehicle) then

					local playerPed = GetPlayerPed(-1)

					if Config.MaxInService == -1 then

						ESX.Game.SpawnVehicle(model, {
							x = vehicles.SpawnPoint.x,
							y = vehicles.SpawnPoint.y,
							z = vehicles.SpawnPoint.z
						}, vehicles.Heading, function(vehicle)
							--TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1) -- teleport into vehicle
							SetVehicleMaxMods(vehicle)
							SetVehicleDirtLevel(vehicle, 0)
						end)

					else

						ESX.TriggerServerCallback('esx_service:enableService', function(canTakeService, maxInService, inServiceCount)

							if canTakeService then

								ESX.Game.SpawnVehicle(model, {
									x = vehicles[partNum].SpawnPoint.x,
									y = vehicles[partNum].SpawnPoint.y,
									z = vehicles[partNum].SpawnPoint.z
								}, vehicles[partNum].Heading, function(vehicle)
									--TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)  -- teleport into vehicle
									SetVehicleMaxMods(vehicle)
									SetVehicleDirtLevel(vehicle, 0)
								end)

							else
								ESX.ShowNotification(_U('service_max') .. inServiceCount .. '/' .. maxInService)
							end

						end, 'etat')

					end

				else
					ESX.ShowNotification(_U('vehicle_out'))
				end

			end,
			function(data, menu)
				menu.close()
			end
		)
	end
end)

function SetVehicleMaxMods(vehicle)
	local props = {
		modEngine       = 0,
		modBrakes       = 0,
		modTransmission = 0,
		modSuspension   = 0,
		modTurbo        = false,
	}

	ESX.Game.SetVehicleProperties(vehicle, props)
end