local jobName                   = ''
local jobGrade                  = ''
local IsFarming = false
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local HasAlreadyEnteredMarker = false
local LastZone = nil

local ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	jobName = xPlayer.job.name
	jobGrade = xPlayer.job.grade_name
	TriggerEvent('esx_casinojob:handleBlips', jobName)
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    jobName = job.name
	jobGrade = job.grade_name
	TriggerEvent('esx_casinojob:handleBlips', jobName)
end)


AddEventHandler('esx_casinojob:hasEnteredMarker', function(zone)
	if zone == 'BossActions' and (jobGrade == 'boss' or jobGrade == 'lowerboss1') then
		CurrentAction     = 'menu_boss_actions'
		CurrentActionMsg  = _U('open_bossmenu')
		CurrentActionData = {}
	end

	if zone == 'Entry' then
		CurrentAction     = 'menu_entry'
		CurrentActionMsg  = 'Stiskni ~INPUT_CONTEXT~ pro vstup do kasina'
		CurrentActionData = {}
	end

	if zone == 'KasinoExit' then
		CurrentAction     = 'menu_exit'
		CurrentActionMsg  = 'Stiskni ~INPUT_CONTEXT~ pro odchod z kasina'
		CurrentActionData = {}
	end

	if zone == 'Cloakrooms' then
		CurrentAction     = 'menu_cloakroom'
		CurrentActionMsg  = _U('open_cloackroom')
		CurrentActionData = {}
	end

	if zone == 'Cashier' then
		CurrentAction     = 'menu_cashier'
		CurrentActionMsg  = 'Stiskni ~INPUT_CONTEXT~ pro otevreni pokladny'
		CurrentActionData = {}
	end

	if zone == 'Harvest' then
		CurrentAction     = 'menu_harvest'
		CurrentActionMsg  = 'Stiskni ~INPUT_CONTEXT~ pro barveni karet'
		CurrentActionData = {}
	end

	if zone == 'Vaults' and (jobGrade == 'boss' or jobGrade == 'lowerboss1') then
		CurrentAction     = 'menu_vault'
		CurrentActionMsg  = _U('open_vault')
		CurrentActionData = {}
	end

	if zone == 'MoneyWash' and jobGrade == 'boss' then
		CurrentAction     = 'menu_money_wash'
		CurrentActionMsg  = 'Stiskni ~INPUT_CONTEXT~ pro otevreni tajne pracky'
		CurrentActionData = {}
	end

	if zone == 'Fridge' or zone == 'Fridge2' or zone == 'Fridge3' or zone == 'Fridge4' then
		CurrentAction     = 'menu_fridge'
		CurrentActionMsg  = _U('open_fridge')
		CurrentActionData = {}
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

AddEventHandler('esx_casinojob:hasExitedMarker', function(zone)
	CurrentAction = nil
	IsFarming = false
	TriggerServerEvent('esx_casinojob:stopFarming')

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
			if isAllowed and jobName == 'casino' or v.isPublic then
				if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.MarkersDrawDistance) then
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, false, 2, false, false, false, false)
				end
			end
		end

		if(Config.Entry.Type ~= -1 and GetDistanceBetweenCoords(coords, Config.Entry.Pos.x, Config.Entry.Pos.y, Config.Entry.Pos.z, true) < Config.MarkersDrawDistance) then
			DrawMarker(Config.Entry.Type, Config.Entry.Pos.x, Config.Entry.Pos.y, Config.Entry.Pos.z,
			0.0, 0.0, 0.0, 0, 0.0, 0.0,
			Config.Entry.Size.x, Config.Entry.Size.y, Config.Entry.Size.z, Config.Entry.Color.r,
			Config.Entry.Color.g, Config.Entry.Color.b, 100, false, false, 2, false, false, false, false)
		end
		
		if(Config.Cashier.Type ~= -1 and GetDistanceBetweenCoords(coords, Config.Cashier.Pos.x, Config.Cashier.Pos.y, Config.Cashier.Pos.z, true) < Config.MarkersDrawDistance) then
			DrawMarker(Config.Cashier.Type, Config.Cashier.Pos.x, Config.Cashier.Pos.y, Config.Cashier.Pos.z,
			0.0, 0.0, 0.0, 0, 0.0, 0.0,
			Config.Cashier.Size.x, Config.Cashier.Size.y, Config.Cashier.Size.z, Config.Cashier.Color.r,
			Config.Cashier.Color.g, Config.Cashier.Color.b, 100, false, false, 2, false, false, false, false)
		end

		if(Config.KasinoExit.Type ~= -1 and GetDistanceBetweenCoords(coords, Config.KasinoExit.Pos.x, Config.KasinoExit.Pos.y, Config.KasinoExit.Pos.z, true) < Config.MarkersDrawDistance) then
			DrawMarker(Config.KasinoExit.Type, Config.KasinoExit.Pos.x, Config.KasinoExit.Pos.y, Config.KasinoExit.Pos.z,
			0.0, 0.0, 0.0, 0, 0.0, 0.0,
			Config.KasinoExit.Size.x, Config.KasinoExit.Size.y, Config.KasinoExit.Size.z, Config.KasinoExit.Color.r,
			Config.KasinoExit.Color.g, Config.KasinoExit.Color.b, 100, false, false, 2, false, false, false, false)
		end

		if jobName == 'casino' and jobGrade == 'boss' and (Config.MoneyWash.Type ~= -1 and GetDistanceBetweenCoords(coords, Config.MoneyWash.Pos.x, Config.MoneyWash.Pos.y, Config.MoneyWash.Pos.z, true) < Config.MarkersDrawDistance) then
			DrawMarker(Config.MoneyWash.Type, Config.MoneyWash.Pos.x, Config.MoneyWash.Pos.y, Config.MoneyWash.Pos.z,
			0.0, 0.0, 0.0, 0, 0.0, 0.0,
			Config.MoneyWash.Size.x, Config.MoneyWash.Size.y, Config.MoneyWash.Size.z, Config.MoneyWash.Color.r,
			Config.MoneyWash.Color.g, Config.MoneyWash.Color.b, 100, false, false, 2, false, false, false, false)
		end
	end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do
		Wait(0)

		local coords = GetEntityCoords(GetPlayerPed(-1))
		local isInMarker = false
		local currentZone = nil

		if CurrentAction == nil then
			isInMarker = false
			currentZone = nil
			HasAlreadyEnteredMarker = false
		end

		for k, v in pairs(Config.Zones) do
			if jobName == 'casino' and (GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
				isInMarker = true
				currentZone = k
			end
		end

		if(GetDistanceBetweenCoords(coords, Config.Entry.Pos.x, Config.Entry.Pos.y, Config.Entry.Pos.z, true) < Config.Entry.Size.x) then
			isInMarker = true
			currentZone = 'Entry'
		end

		if(GetDistanceBetweenCoords(coords, Config.KasinoExit.Pos.x, Config.KasinoExit.Pos.y, Config.KasinoExit.Pos.z, true) < Config.KasinoExit.Size.x) then
			isInMarker = true
			currentZone = 'KasinoExit'
		end
		
		if(GetDistanceBetweenCoords(coords, Config.Cashier.Pos.x, Config.Cashier.Pos.y, Config.Cashier.Pos.z, true) < Config.Cashier.Size.x) then
			isInMarker = true
			currentZone = 'Cashier'
		end

		if jobName == 'casino' and jobGrade == 'boss' and (GetDistanceBetweenCoords(coords, Config.MoneyWash.Pos.x, Config.MoneyWash.Pos.y, Config.MoneyWash.Pos.z, true) < Config.MoneyWash.Size.x) then
			isInMarker = true
			currentZone = 'MoneyWash'
		end

		if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
			HasAlreadyEnteredMarker = true
			LastZone = currentZone
			TriggerEvent('esx_casinojob:hasEnteredMarker', currentZone)
		end

		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_casinojob:hasExitedMarker', LastZone)
		end
	end
end)

function OpenEntryMenu ()
	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'vehicle_spawner',
		{
			title    = 'Vstup do kasina',
			align    = 'left',
			elements = {
				{value = "normal", label = "Klasicky vstup (zdarma)", price = 0},
				{value = "gold", label = "Gold ticket ($30 000)", price = 30000},
				{value = "platinum", label = "Platinum ticket ($60 000)", price = 60000},
				{value = "nothing", label = " "},
				{value = "nothing", label = "TICKET PO BOURCE ZTRACI PLATNOST"},
			},
		},
		function(data, menu)		
			if data.current.value == "normal" then
				menu.close()
				local player = GetPlayerPed(-1)
				SetEntityCoords(player, Config.KasinoExit.Pos.x, Config.KasinoExit.Pos.y, Config.KasinoExit.Pos.z)
				SetEntityHeading(player, 0)
			end
			if data.current.value == "gold" or data.current.value == "platinum" then
				ESX.TriggerServerCallback('esx_casino:payEntry', function(hasPaid)
					if hasPaid then
						menu.close()
						local player = GetPlayerPed(-1)
						SetEntityCoords(player, Config.KasinoExit.Pos.x, Config.KasinoExit.Pos.y, Config.KasinoExit.Pos.z)
						SetEntityHeading(player, 0)
						ESX.ShowNotification('Zakoupil/a sis VIP ticket do kasina. ')
					else
						ESX.ShowNotification('Nemas dostatek penez na vstup do kasina')
					end
				end, data.current.value, data.current.price)
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function OpenCashierMenu ()
	local elements = {
		{value = "gold", label = "Gold ticket ($30 000)", price = 30000},
		{value = "platinum", label = "Platinum ticket ($60 000)", price = 60000},
		{value = 'nakupzetonu', label = 'Nakoupit zetony (1$ = 1Z)'},
		{value = 'prodejzetonu', label = 'Prodat zetony (1$ = 1Z)'},
	}

	-- if jobName == 'casino' and jobGrade == 'boss' then
	table.insert(elements, {value = 'doplnitzetony', label = 'Doplnit karty'})
	-- end

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'vehicle_spawner',
		{
			title    = 'Vstup do kasina',
			align    = 'left',
			elements = elements,
		},
		function(data, menu)		
			if data.current.value == "gold" or data.current.value == "platinum" then
				ESX.TriggerServerCallback('esx_casino:payEntry', function(hasPaid)
					if hasPaid then
						menu.close()
						ESX.ShowNotification('Zakoupil/a sis VIP ticket do kasina. ')
					else
						ESX.ShowNotification('Nemas dostatek penez na vstup do kasina')
					end
				end, data.current.value, data.current.price)
			end
			if data.current.value == 'doplnitzetony' then
				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'zetony_smena', {
					title = 'Pocet karet'
				}, function(data2, menu2)
				
					local amount = tonumber(data2.value)
					
					if amount == nil then
						ESX.ShowNotification('Neplatne mnozstvi')
					else
						menu2.close()
						TriggerServerEvent('esx_casinojob:doplneniZetonu', amount)
					end
				end, function(data, menu)
					menu.close()
				end)
			end
			if data.current.value == 'nakupzetonu' or data.current.value == 'prodejzetonu' then
				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'zetony_smena', {
					title = 'Smena zetonu'
				}, function(data2, menu2)
				
					local amount = tonumber(data2.value)
					
					if amount == nil then
						ESX.ShowNotification('Neplatne mnozstvi')
					else
						menu2.close()
						TriggerServerEvent('esx_casinojob:smenaZetonu', data.current.value, amount)
					end
				end, function(data, menu)
					menu.close()
				end)
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if CurrentAction ~= nil then
			if not IsFarming then
				SetTextComponentFormat('STRING')
				AddTextComponentString(CurrentActionMsg)
				DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			end

			if IsControlJustReleased(0, Config.Keys['E']) then
				if CurrentAction == 'menu_entry' then
					OpenEntryMenu()
				end
				if CurrentAction == 'menu_exit' then
					local player = GetPlayerPed(-1)
					SetEntityCoords(player, Config.KasinoExitPoint.x, Config.KasinoExitPoint.y, Config.KasinoExitPoint.z)
					SetEntityHeading(player, 57.95)
				end
			end

			if IsControlJustReleased(0,  Config.Keys['E']) and jobName == 'casino' then

				if CurrentAction == 'menu_cloakroom' then
					TriggerEvent('esx_casinojob:openCloakroomMenu', jobGrade)
				end

				if CurrentAction == 'menu_vault' then
					TriggerEvent('esx_casinojob:openVaultMenu')
				end

				if CurrentAction == 'menu_fridge' then
					TriggerEvent('esx_casinojob:openFridgeMenu')
				end

				if CurrentAction == 'menu_cashier' then
					OpenCashierMenu()
				end

				if CurrentAction == 'menu_harvest' then
					IsFarming = true
					TriggerServerEvent('esx_casinojob:startFarming')
				end

				if CurrentAction == 'menu_money_wash' and jobGrade == 'boss' then
					ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'wash_money_amount_', {
						title = 'Vyprat prachy'
					}, function(data, menu)
					
						local amount = tonumber(data.value)
						
						if amount == nil then
							ESX.ShowNotification('Neplatna castka')
						else
							menu.close()
							TriggerServerEvent('esx_casinojob:washMoney', amount)
						end
					end, function(data, menu)
						menu.close()
					end)
				end

				if CurrentAction == 'menu_shop' then
					TriggerEvent('esx_casinojob:openShopMenu', CurrentActionData.zone)
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
						TriggerServerEvent('esx_society:putVehicleILovePizzaInGarage', 'casino', vehicleProps)
					end

					ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
				end

				if CurrentAction == 'menu_boss_actions' and (jobGrade == 'boss' or jobGrade == 'lowerboss1') then
					ESX.UI.Menu.CloseAll()
					local options = {}
					TriggerEvent('esx_society:openBossMenu', 'casino', function(data, menu)
						menu.close()
						CurrentAction     = 'menu_boss_actions'
						CurrentActionMsg  = _U('open_bossmenu')
						CurrentActionData = {}
					end, options)
				end
				
				CurrentAction = nil
			end
		end

		if IsControlJustReleased(0, Config.Keys['F6']) and jobName == 'casino' and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'casino_actions') then
			TriggerEvent('esx_casinojob:openSocietyActionsMenu', jobGrade)
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
