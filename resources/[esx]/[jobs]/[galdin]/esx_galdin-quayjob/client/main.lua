local jobName                   = ''
local jobGrade                  = ''

local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local HasAlreadyEnteredMarker = false
local LastZone = nil

local ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

local isOpened = false

RegisterNetEvent('esx_galdinjob:handleOpenSign')
AddEventHandler('esx_galdinjob:handleOpenSign', function(isOpen)
	isOpened = isOpen
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	jobName = xPlayer.job.name
	jobGrade = xPlayer.job.grade_name
	TriggerEvent('esx_galdinjob:handleBlips', jobName)

	ESX.TriggerServerCallback('esx_galdinjob:getOpenSign', function(isOpen)
		isOpened = isOpen
	end)
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    jobName = job.name
	jobGrade = job.grade_name
	TriggerEvent('esx_galdinjob:handleBlips', jobName)
end)


AddEventHandler('esx_galdinjob:hasEnteredMarker', function(zone)
	if zone == 'BossActions' and (jobGrade == 'boss' or jobGrade == 'lowerboss1') then
		CurrentAction     = 'menu_boss_actions'
		CurrentActionMsg  = _U('open_bossmenu')
		CurrentActionData = {}
	end

	if zone == 'Cloakrooms' then
		CurrentAction     = 'menu_cloakroom'
		CurrentActionMsg  = _U('open_cloackroom')
		CurrentActionData = {}
	end

	if zone == 'Vaults' and (jobGrade == 'boss' or jobGrade == 'lowerboss1') then
		CurrentAction     = 'menu_vault'
		CurrentActionMsg  = _U('open_vault')
		CurrentActionData = {}
	end

	if zone == 'Fridge' or zone == 'Fridge2' or zone == 'Fridge3' or zone == 'Fridge4' or zone == 'Fridge5' then
		CurrentAction     = 'menu_fridge'
		CurrentActionMsg  = _U('open_fridge')
		CurrentActionData = {}
	end

	if zone == 'Alkohol' then
		CurrentAction     = 'menu_shop'
		CurrentActionMsg  = _U('shop_menu')
		CurrentActionData = {zone = zone}
	end

	if zone == 'Nealko' then
		CurrentAction     = 'menu_shop'
		CurrentActionMsg  = _U('shop_menu2')
		CurrentActionData = {zone = zone}   
	end

	if zone == 'Pochutiny' then
		CurrentAction     = 'menu_shop'
		CurrentActionMsg  = _U('shop_menu3')
		CurrentActionData = {zone = zone}
	end

	if zone == 'Ingredience' then
		CurrentAction     = 'menu_shop'
		CurrentActionMsg  = _U('shop_menu4')
		CurrentActionData = {zone = zone}
	end    

	if zone == 'Sell' then
		CurrentAction     = 'sell_products'
		CurrentActionMsg  = _U('sell_menu')
		CurrentActionData = {zone = zone}
	end    

	if zone == 'Vehicles' then
		CurrentAction     = 'menu_vehicle_spawner'
		CurrentActionMsg  = _U('vehicle_spawner')
		CurrentActionData = {}
	end

	if zone == 'Helicopters' then
		CurrentAction     = 'menu_heli_spawner'
		CurrentActionMsg  = _U('vehicle_spawner')
		CurrentActionData = {}
	end

	if zone == 'Helicopters2' and jobGrade == 'boss' then
		CurrentAction     = 'menu_heli_spawner2'
		CurrentActionMsg  = _U('vehicle_spawner')
		CurrentActionData = {}
	end

	if zone == 'openSign' or zone == 'openSign2' then
		CurrentAction     = 'handle_open_sign'
		CurrentActionMsg  = 'Zmackni ~INPUT_CONTEXT~ pro prehozeni cedule'
		CurrentActionData = {}
	end

	if zone == 'VehicleDeleters' then
		local playerPed = GetPlayerPed(-1)

		if IsPedInAnyVehicle(playerPed,  false) then
			local vehicle = GetVehiclePedIsIn(playerPed,  false)
			CurrentAction     = 'delete_vehicle'
			CurrentActionMsg  = _U('store_vehicle')
			CurrentActionData = {vehicle = vehicle}
		end

	end
end)

AddEventHandler('esx_galdinjob:hasExitedMarker', function(zone)
	CurrentAction = nil

	if zone ~= 'Vehicles' and zone ~= 'Helicopters' and zone ~= 'Helicopters2' then
		ESX.UI.Menu.CloseAll()
	end
end)

-- Display markers
Citizen.CreateThread(function()
	while true do
		Wait(0)
		local coords = GetEntityCoords(GetPlayerPed(-1))

		for k,v in pairs(Config.Zones) do
			local isAllowed = true
			if k == 'Helicopters2' and jobGrade ~= 'boss' then
				isAllowed = false
			end
			if isAllowed and jobName == 'galdin' or v.isPublic then
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

		if jobName == 'galdin' then
			local coords = GetEntityCoords(GetPlayerPed(-1))
			local isInMarker = false
			local currentZone = nil

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
				TriggerEvent('esx_galdinjob:hasEnteredMarker', currentZone)
			end

			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_galdinjob:hasExitedMarker', LastZone)
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

			if IsControlJustReleased(0,  Config.Keys['E']) and jobName == 'galdin' then

				if CurrentAction == 'handle_open_sign' then
					TriggerServerEvent('esx_galdinjob:handleOpenSign')
				end

				if CurrentAction == 'menu_cloakroom' then
					TriggerEvent('esx_galdinjob:openCloakroomMenu', jobGrade)
				end

				if CurrentAction == 'menu_vault' then
					TriggerEvent('esx_galdinjob:openVaultMenu')
				end

				if CurrentAction == 'menu_fridge' then
					TriggerEvent('esx_galdinjob:openFridgeMenu')
				end

				if CurrentAction == 'menu_shop' then
					TriggerEvent('esx_galdinjob:openShopMenu', CurrentActionData.zone)
				end

				if CurrentAction == 'sell_products' then
					TriggerServerEvent('esx_galdinjob:startSell')
				end
				
				if CurrentAction == 'menu_vehicle_spawner' then
					exports.nncore:OpenVehicleSpawnerMenu(Config.VehicleShopCoords, Config.SpawnPoints, Config.AuthorizedVehicles)
				end

				if CurrentAction == 'menu_heli_spawner' then
					exports.nncore:OpenVehicleSpawnerMenu(Config.VehicleShopCoords, Config.SpawnPointsHeli, Config.AuthorizedHeli, 'heli')
				end

				if CurrentAction == 'menu_heli_spawner2' then
					exports.nncore:OpenVehicleSpawnerMenu(Config.VehicleShopCoords, Config.SpawnPointsHeli2, Config.AuthorizedHeli, 'heli')
				end

				if CurrentAction == 'delete_vehicle' then
					if Config.EnableSocietyOwnedVehicles then
						local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
						TriggerServerEvent('esx_society:putVehicleILovePizzaInGarage', 'galdin', vehicleProps)
					end

					ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
				end

				if CurrentAction == 'menu_boss_actions' and (jobGrade == 'boss' or jobGrade == 'lowerboss1') then
					ESX.UI.Menu.CloseAll()
					local options = {}
					TriggerEvent('esx_society:openBossMenu', 'galdin', function(data, menu)
						menu.close()
						CurrentAction     = 'menu_boss_actions'
						CurrentActionMsg  = _U('open_bossmenu')
						CurrentActionData = {}
					end, options)
				end
				
				CurrentAction = nil
			end
		end

		if IsControlJustReleased(0, Config.Keys['F6']) and jobName == 'galdin' and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'galdin_actions') then
			TriggerEvent('esx_galdinjob:openSocietyActionsMenu', jobGrade)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = GetPlayerPed(-1)
		
		if GetDistanceBetweenCoords( -2042.42, -476.42, 11.24, GetEntityCoords(playerPed)) < 25.0 then
			Draw3DText( -2042.42, -476.42, 11.24, "Galdin Quay", 4, 0.1, 0.1, {r = 0, g = 220, b = 255})

			if isOpened then
				Draw3DText( -2042.42, -476.42, 11.24 - 0.300, "OTEVRENO", 4, 0.1, 0.1, {r = 0, g = 255, b = 35})
			else
				Draw3DText( -2042.42, -476.42, 11.24 - 0.300, "ZAVRENO", 4, 0.1, 0.1, {r = 255, g = 0, b = 0})
			end
		end

		if GetDistanceBetweenCoords( -2258.42, -625.5, 13.81, GetEntityCoords(playerPed)) < 25.0 then
			Draw3DText( -2258.42, -625.5, 13.81, "Galdin Quay", 4, 0.1, 0.1, {r = 0, g = 220, b = 255})

			if isOpened then
				Draw3DText( -2258.42, -625.5, 13.81 - 0.300, "OTEVRENO", 4, 0.1, 0.1, {r = 0, g = 255, b = 35})
			else
				Draw3DText( -2258.42, -625.5, 13.81 - 0.300, "ZAVRENO", 4, 0.1, 0.1, {r = 255, g = 0, b = 0})
			end
		end	
	end
end)

function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY, color)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
	local scale = (1/dist)*30
	local fov = (1/GetGameplayCamFov())*100
	local scale = scale*fov   
	SetTextScale(scaleX*scale, scaleY*scale)
	SetTextFont(fontId)
	SetTextProportional(1)
	SetTextColour(color.r, color.g, color.b, 255)		-- You can change the text color here
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
