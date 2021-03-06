local jobName                   = ''
local jobGrade                  = ''

local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local HasAlreadyEnteredMarker = false
local LastZone = nil
local Diagnostic = nil

local CarPrices = {}

local ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	jobName = xPlayer.job.name
	jobGrade = xPlayer.job.grade_name
	TriggerEvent('esx_bazarjob:handleBlips', jobName)

	ESX.TriggerServerCallback('esx_bazarjob:getCarPrices', function(prices)
		CarPrices = prices
	end)
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    jobName = job.name
	jobGrade = job.grade_name
	TriggerEvent('esx_bazarjob:handleBlips', jobName)
end)


AddEventHandler('esx_bazarjob:hasEnteredMarker', function(zone, data)
	if zone == 'BossActions' and (jobGrade == 'boss' or jobGrade == 'lowerboss1' or jobGrade == 'lowerboss2') then
		CurrentAction     = 'menu_boss_actions'
		CurrentActionMsg  = _U('open_bossmenu')
		CurrentActionData = {}
	end

	if zone == 'Cloakrooms' then
		CurrentAction     = 'menu_cloakroom'
		CurrentActionMsg  = _U('open_cloackroom')
		CurrentActionData = {}
	end

	if zone == 'Vaults' or zone == 'Vaults2' then
		CurrentAction     = 'menu_vault'
		CurrentActionMsg  = _U('open_vault')
		CurrentActionData = {}
	end

	if zone == 'Vehicles' then
		CurrentAction     = 'menu_vehicle_spawner'
		CurrentActionMsg  = _U('vehicle_spawner')
		CurrentActionData = {}
	end

	if zone == 'Diagnostic' then
		CurrentAction     = 'menu_diagnostic'
		CurrentActionMsg  = nil
		CurrentActionData = {}
	end
end)

AddEventHandler('esx_bazarjob:hasExitedMarker', function(zone)
	CurrentAction = nil

	if zone == 'Diagnostic' then
		TriggerServerEvent('esx_bazarjob:sendDiagnostic', nil)
	end

	if zone ~= 'Vehicles' then
		ESX.UI.Menu.CloseAll()
	end
end)

-- Display markers
Citizen.CreateThread(function()
	while true do
		Wait(0)
		local coords = GetEntityCoords(GetPlayerPed(-1))

		for k,v in pairs(Config.Zones) do
			if jobName == 'bazar' then
				if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.MarkersDrawDistance) then
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, false, 2, false, false, false, false)
				end
			end
		end
	end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do
		Wait(0)

		if jobName == 'bazar' then
			local coords = GetEntityCoords(GetPlayerPed(-1))
			local isInMarker = false
			local currentZone = nil
			local currentIndex = nil

			if CurrentAction == nil then
				isInMarker = false
				currentZone = nil
				HasAlreadyEnteredMarker = false
			end

			for k, v in pairs(Config.Zones) do
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
					isInMarker = true
					currentZone = k
				end
			end

			if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
				HasAlreadyEnteredMarker = true
				LastZone = currentZone
				TriggerEvent('esx_bazarjob:hasEnteredMarker', currentZone, currentIndex)
			end

			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_bazarjob:hasExitedMarker', LastZone)
			end
		end
	end
end)

-- EVENTS
function OpenBillingMenu()
	ESX.UI.Menu.Open(
		'dialog', GetCurrentResourceName(), 'billing',
		{
			title = _U('billing_amount')
		},
		function(data, menu)
			local amount = tonumber(data.value)
			local player, distance = ESX.Game.GetClosestPlayer()

			if player ~= -1 and distance <= 3.0 then
				menu.close()
				if amount == nil then
					ESX.ShowNotification(_U('amount_invalid'))
				else
					TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_bazar', _U('billing'), amount)
				end
			else
				ESX.ShowNotification(_U('no_players_nearby'))
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function OpenDobropisMenu()
	ESX.UI.Menu.Open(
		'dialog', GetCurrentResourceName(), 'dobropis',
		{
			title = 'Castka dobropisu'
		},
		function(data, menu)
			local amount = tonumber(data.value)
			local player, distance = ESX.Game.GetClosestPlayer()

			if player ~= -1 and distance <= 3.0 then
				menu.close()
				if amount == nil then
					ESX.ShowNotification(_U('amount_invalid'))
				else
					TriggerServerEvent("esx_bazarjob:sendDobropis", GetPlayerServerId(player), amount)
				end
			else
				ESX.ShowNotification(_U('no_players_nearby'))
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end
function openSocietyActionsMenu ()
	local elements = {
		{label = _U('billing'), value = 'billing'},
	}

	if jobGrade ~= 'trial' then
		table.insert(elements, {label = 'Dobropis', value = 'dobropis'})
	end

	table.insert(elements, {label = 'Umyt auto', value = 'clean_car'})

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'bazar_actions',
		{
			title    = _U('bazar'),
			align    = 'left',
			elements = elements
		},
		function(data, menu)
			if data.current.value == 'billing' then
				OpenBillingMenu()
			end

			if data.current.value == "dobropis" then
				OpenDobropisMenu()
			end

			if data.current.value == 'clean_car' then
				local playerPed = GetPlayerPed(-1)
				local coords    = GetEntityCoords(playerPed)
				local vehicle   = GetClosestVehicle(coords.x,  coords.y,  coords.z,  3.0,  0,  71)
	
				if DoesEntityExist(vehicle) then
          	      	local text = "*Bere hadr z kapsy a cist?? vozidlo*"
          
            	    if IsPedSittingInAnyVehicle(playerPed) then
                  		ESX.ShowNotification('Nemuzes umyt auto kdyz sedis uvnitr')
                  		return
                	end
          
                	IsBusy = true
                	TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_MAID_CLEAN", 0, true)
                	TriggerServerEvent('3dme:shareDisplay', text)
                	Citizen.CreateThread(function()
                  		exports['progressBars']:startUI(20000, "Cisten?? vozidla")
                  		Citizen.Wait(20000)
                  		WashDecalsFromVehicle(vehicle, 1.0)
						SetVehicleDirtLevel(vehicle)
                  		ClearPedTasksImmediately(playerPed)
        
                  		ESX.ShowNotification('Auto umyto')
                  		IsBusy = false
                	end)
              	end
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function openCloakroomMenu ()
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'cloakroom',
		{
			title = _U('cloakroom'),
			algin = 'top-left',
			elements = {
				{value = 'civil', label = 'Civilni obleceni'},
				{value = 'work', label = 'Pracovni obleceni'}
			},
		},
		function(data, menu)
			if data.current.value == 'civil' then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					local playerPed = GetPlayerPed(-1)
					TriggerEvent('skinchanger:loadSkin', skin)
					ClearPedBloodDamage(playerPed)
					ResetPedVisibleDamage(playerPed)
					ClearPedLastWeaponDamage(playerPed)
					ResetPedMovementClipset(playerPed, 0)
				end)
			end
			if data.current.value == 'work' then
				TriggerEvent('skinchanger:getSkin', function(skin)
					local sex = 'male'
					if skin.sex ~= 0 then
						sex = 'female'
					end
					local clothesSkin = Config.Clothes[sex][jobGrade]

					if Config.Clothes[sex] and Config.Clothes[sex][jobGrade] then
						TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

						local playerPed = GetPlayerPed(-1)
						ClearPedBloodDamage(playerPed)
						ResetPedVisibleDamage(playerPed)
						ClearPedLastWeaponDamage(playerPed)
						ResetPedMovementClipset(playerPed, 0)
					end
				end)
			end
			menu.close()
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function GetDiagnostic ()
	local playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed, false) then
		local vehicle    = GetVehiclePedIsIn(playerPed, false)
		return {
			engine = GetVehicleMod(vehicle, 11) + 1,
			brakes = GetVehicleMod(vehicle, 12) + 1,
			transmission = GetVehicleMod(vehicle, 13) + 1,
			suspension = GetVehicleMod(vehicle, 15) + 1,
			armor = GetVehicleMod(vehicle, 16) + 1,
			turbo = IsToggleModOn(vehicle, 18),
		}
	else
		return nil
	end
end

function DoDiagnostic ()
	local calculatedDiagnostic = GetDiagnostic()
	TriggerServerEvent('esx_bazarjob:sendDiagnostic', calculatedDiagnostic)
end

RegisterNetEvent('esx_bazarjob:sendDiagnostic')
AddEventHandler('esx_bazarjob:sendDiagnostic', function(dgns)
	Diagnostic = dgns
end)

RegisterNetEvent('esx_bazarjob:sendCarPrices')
AddEventHandler('esx_bazarjob:sendCarPrices', function(prices)
	CarPrices = prices
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if Diagnostic and GetDistanceBetweenCoords( 2144.9, 3825.56, 33.49, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			local turbo = 'Ne'
			if Diagnostic.turbo == 1 then
				turbo = 'Ano'
			end

			local carText = "Motor: " .. Diagnostic.engine .. ' / 4'
			carText = carText .. "\n" .. "Brzdy: "  .. Diagnostic.brakes .. ' / 3'
			carText = carText .. "\n" .. "Prevodovka: " .. Diagnostic.transmission .. ' / 3'
			carText = carText .. "\n" .. "Snizeni: " .. Diagnostic.suspension .. ' / 4'
			carText = carText .. "\n" .. "Armor: " .. Diagnostic.armor .. ' / 5'
			carText = carText .. "\n" .. "Turbo: " .. turbo

			Draw3DText( 2144.9, 3825.56, 33.49  -0.800, carText, 4, 0.1, 0.1)
		end
		
		for k,carPrice in ipairs(CarPrices) do
			if carPrice and GetDistanceBetweenCoords( carPrice.Pos.x, carPrice.Pos.y, carPrice.Pos.z, GetEntityCoords(GetPlayerPed(-1))) < 3.0 then
				local turbo = 'Ne'
				if carPrice.turbo == 1 then
					turbo = 'Ano'
				end

				local carText = "Motor: " .. carPrice.engine .. ' / 4'
				carText = carText .. "\n" .. "Brzdy: "  .. carPrice.brakes .. ' / 3'
				carText = carText .. "\n" .. "Prevodovka: " .. carPrice.transmission .. ' / 3'
				carText = carText .. "\n" .. "Snizeni: " .. carPrice.suspension .. ' / 4'
				carText = carText .. "\n" .. "Armor: " .. carPrice.armor .. ' / 5'
				carText = carText .. "\n" .. "Turbo: " .. turbo
				Draw3DText( carPrice.Pos.x, carPrice.Pos.y, carPrice.Pos.z  -0.020, "Auto #" .. k .. ": " .. carPrice.label, 4, 0.1, 0.1, {r = 255, g = 0, b = 0})
				Draw3DText( carPrice.Pos.x, carPrice.Pos.y, carPrice.Pos.z  -0.150, "Cena: " .. carPrice.price, 4, 0.1, 0.1, {r = 0, g = 255, b = 35})
				Draw3DText( carPrice.Pos.x, carPrice.Pos.y, carPrice.Pos.z  -0.300, carText, 4, 0.1, 0.1)
			end	
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if CurrentAction ~= nil then
			SetTextComponentFormat('STRING')
			AddTextComponentString(CurrentActionMsg)
			DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			
			if not Diagnostic and CurrentAction == 'menu_diagnostic' then
				DoDiagnostic()
			end

			if IsControlJustReleased(0,  Config.Keys['E']) and jobName == 'bazar' then
				if CurrentAction == 'menu_cloakroom' then
					openCloakroomMenu()
				end

				if CurrentAction == 'menu_vault' then
					TriggerEvent('esx_bazarjob:openVaultMenu')
				end
				
				if CurrentAction == 'menu_vehicle_spawner' then
					exports.nncore:OpenVehicleSpawnerMenu(Config.VehicleShopCoords, Config.SpawnPoints, Config.AuthorizedVehicles)
				end

				if CurrentAction == 'menu_boss_actions' and (jobGrade == 'boss' or jobGrade == 'lowerboss1' or jobGrade == 'lowerboss2') then
					ESX.UI.Menu.CloseAll()
					local options = {}
					TriggerEvent('esx_society:openBossMenu', 'bazar', function(data, menu)
						menu.close()
						CurrentAction     = 'menu_boss_actions'
						CurrentActionMsg  = _U('open_bossmenu')
						CurrentActionData = {}
					end, options)
				end
				
				CurrentAction = nil
			end
		end

		if IsControlJustReleased(0, Config.Keys['F6']) and jobName == 'bazar' and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'bazar_actions') then
			openSocietyActionsMenu()
		end
	end
end)

function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY, color)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
	local scale = (1/dist)*15
	local fov = (1/GetGameplayCamFov())*100
	local scale = scale*fov   
	SetTextScale(scaleX*scale, scaleY*scale)
	SetTextFont(fontId)
	SetTextProportional(1)
	if color then
		SetTextColour(color.r, color.g, color.b, 255)		-- You can change the text color here
	else
		SetTextColour(250, 250, 250, 255)		-- You can change the text color here
	end
	SetTextDropshadow(1, 1, 1, 1, 255)
	SetTextEdge(2, 0, 0, 0, 150)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(textInput)
	SetDrawOrigin(x,y,z+2, 0)
	DrawText(0.0, 0.0)
	ClearDrawOrigin()
end

RegisterCommand("setbazarcar", function()
	if jobName == 'bazar' then
		TriggerEvent('esx_givecarkeys:setBazarKeys', 'autobazar')
	else
		ESX.ShowNotification('K tomuto nemas pristup')
	end
end)
RegisterCommand("getbazarcar", function()
	if jobName == 'bazar' then
		TriggerEvent('esx_givecarkeys:setBazarKeys', 'player')
	else
		ESX.ShowNotification('K tomuto nemas pristup')
	end
end)

RegisterCommand("sbazar", function(source, args)
	local _args = args
	local price = args[1]
	table.remove(_args, 1)
	local label = table.concat(_args, ' ')
	local playerPed = GetPlayerPed(-1)

	if not price or not label then
		ESX.ShowNotification('Musis zadat cenu a nazev auta')
	elseif jobName == 'bazar' and IsPedInAnyVehicle(playerPed, false) then
		local info = GetDiagnostic()
		local coords = GetEntityCoords(GetPlayerPed(-1))
		info['label'] = label
		info['price'] = price
		info['Pos'] = coords

		table.insert(CarPrices, info)
		TriggerServerEvent('esx_bazarjob:sendCarPrices', CarPrices)
	end
end)

RegisterCommand("dbazar", function(source, args)
	local id = args[1]

	if not id then
		ESX.ShowNotification('Musis zadat cenu a nazev auta')
	elseif jobName == 'bazar' then
		table.remove(CarPrices, id)
		TriggerServerEvent('esx_bazarjob:sendCarPrices', CarPrices)
	end
end)

RegisterCommand("dbazarall", function(source)
	if jobName == 'bazar' then
		TriggerServerEvent('esx_bazarjob:sendCarPrices', {})
	end
end)