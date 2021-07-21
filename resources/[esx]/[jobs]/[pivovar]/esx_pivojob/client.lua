local jobName                   = ''
local jobGrade                  = ''

local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local HasAlreadyEnteredMarker = false
local LastZone = nil

local IsFarming = false
local IsTransforming = false

local ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	jobName = xPlayer.job.name
	jobGrade = xPlayer.job.grade_name
	TriggerEvent('esx_pivovarjob:handleBlips', jobName)
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    jobName = job.name
	jobGrade = job.grade_name
	TriggerEvent('esx_pivovarjob:handleBlips', jobName)
end)


AddEventHandler('esx_pivovarjob:hasEnteredMarker', function(zone, data)
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

	if zone == 'Vaults' then
		CurrentAction     = 'menu_vault'
		CurrentActionMsg  = _U('open_vault')
		CurrentActionData = {}
	end

	if zone == 'Sell' then
		CurrentAction     = 'sell_products'
		CurrentActionMsg  = 'Stiskni ~INPUT_CONTEXT~ pro zahajeni prodeje'
		CurrentActionData = {}
	end    

	if zone == 'Vehicles' then
		CurrentAction     = 'menu_vehicle_spawner'
		CurrentActionMsg  = _U('vehicle_spawner')
		CurrentActionData = {}
	end

	if zone == 'Transform' or zone == 'Transform2' or zone == 'Transform3' then
		CurrentAction     = 'menu_transform'
		CurrentActionMsg  = 'Stiskni ~INPUT_CONTEXT~ pro vareni piva'
		CurrentActionData = {zone = zone}
	end

	if zone == 'Products' then
		CurrentAction     = 'menu_farming'
		CurrentActionMsg  = 'Stiskni ~INPUT_CONTEXT~ pro pripravu surovin'
		CurrentActionData = {data = data}
	end
end)

AddEventHandler('esx_pivovarjob:hasExitedMarker', function(zone)
	CurrentAction = nil
	IsFarming = false
	IsTransforming = false
	TriggerServerEvent('esx_pivovarjob:stopFarming')
	TriggerServerEvent('esx_pivovarjob:stopTransform')

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
			if jobName == 'pivovar' then
				if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.MarkersDrawDistance) then
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, false, 2, false, false, false, false)
				end
			end
		end

		for k,v in pairs(Config.Products) do
			if jobName == 'pivovar' then
				if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.coords.x, v.coords.y, v.coords.z, true) < Config.MarkersDrawDistance) then
					DrawMarker(
						Config.ProductsMarker.Type, v.coords.x, v.coords.y, v.coords.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0,
						Config.ProductsMarker.Size.x, Config.ProductsMarker.Size.y, Config.ProductsMarker.Size.z,
						Config.ProductsMarker.Color.r, Config.ProductsMarker.Color.g, Config.ProductsMarker.Color.b,
						100, false, false, 2, false, false, false, false)
				end
			end
		end
	end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do
		Wait(0)

		if jobName == 'pivovar' then
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

			for k, v in pairs(Config.Products) do
				if(GetDistanceBetweenCoords(coords, v.coords.x, v.coords.y, v.coords.z, true) < Config.ProductsMarker.Size.x) then
					isInMarker = true
					currentZone = 'Products'
					currentIndex = v.item
				end
			end

			if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
				HasAlreadyEnteredMarker = true
				LastZone = currentZone
				TriggerEvent('esx_pivovarjob:hasEnteredMarker', currentZone, currentIndex)
			end

			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_pivovarjob:hasExitedMarker', LastZone)
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
					TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_pivovar', _U('billing'), amount)
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
	local elements = {}

	table.insert(elements, {label = _U('billing'), value = 'billing'})

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'pivovar_actions',
		{
			title    = _U('pivovar'),
			align    = 'left',
			elements = elements
		},
		function(data, menu)
			if data.current.value == 'billing' then
				OpenBillingMenu()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function openCloakroomMenu ()
	local elements = {
		{value = "civil", label = "Civilni obleceni"}
	}

	if jobGrade == 'trial' or jobGrade == 'helper' or jobGrade == 'newbie' or jobGrade == 'mistr' or jobGrade == 'velmistr' then
		table.insert(elements, {value = "first", label = "Pracovni obleceni"})
	end
	if jobGrade == 'sladek' or jobGrade == 'msladek' then
		table.insert(elements, {value = "second", label = "Pracovni obleceni"})
	end
	if jobGrade == 'boss' or jobGrade == 'lowerboss1' or jobGrade == 'obchodzastup' then
		table.insert(elements, {value = "first", label = "Pracovni obleceni do velmistra"})
		table.insert(elements, {value = "second", label = "Pracovni obleceni pro sladky"})
		table.insert(elements, {value = "boss", label = "Pracovni obleceni pro zastupce"})
	end

	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'cloakroom',
		{
			title = _U('cloakroom'),
			algin = 'top-left',
			elements = elements
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
			else
				TriggerEvent('skinchanger:getSkin', function(skin)
					local sex = 'male'
					if skin.sex ~= 0 then
						sex = 'female'
					end
					local clothesSkin = Config.Clothes[data.current.value][sex]
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
					
					RequestAnimSet("MOVE_M@POSH@")
					while not HasAnimSetLoaded("MOVE_M@POSH@") do
						Citizen.Wait(0)
					end
					SetPedMovementClipset(playerPed, "MOVE_M@POSH@", true)

					local playerPed = GetPlayerPed(-1)
					ClearPedBloodDamage(playerPed)
					ResetPedVisibleDamage(playerPed)
					ClearPedLastWeaponDamage(playerPed)
					ResetPedMovementClipset(playerPed, 0)
				end)
			end
			menu.close()
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
			if not IsFarming and not IsTransforming then
				SetTextComponentFormat('STRING')
				AddTextComponentString(CurrentActionMsg)
				DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			end

			if IsControlJustReleased(0,  Config.Keys['E']) and jobName == 'pivovar' then
				if CurrentAction == 'menu_cloakroom' then
					openCloakroomMenu()
				end

				if CurrentAction == 'menu_vault' then
					TriggerEvent('esx_pivovarjob:openVaultMenu')
				end

				if CurrentAction == 'sell_products' then
					TriggerServerEvent('esx_pivovarjob:startSell')
				end
				
				if CurrentAction == 'menu_vehicle_spawner' then
					exports.nncore:OpenVehicleSpawnerMenu(Config.VehicleShopCoords, Config.SpawnPoints, Config.AuthorizedVehicles)
				end
								
				if CurrentAction == 'menu_transform' then
					IsTransforming = true
					TriggerServerEvent('esx_pivovarjob:startTransform', CurrentActionData.zone)
				end

				if CurrentAction == 'menu_farming' then
					IsFarming = true
					TriggerServerEvent('esx_pivovarjob:startFarming', CurrentActionData.data)
				end

				if CurrentAction == 'menu_boss_actions' and (jobGrade == 'boss' or jobGrade == 'lowerboss1' or jobGrade == 'lowerboss2') then
					ESX.UI.Menu.CloseAll()
					local options = {}
					TriggerEvent('esx_society:openBossMenu', 'pivovar', function(data, menu)
						menu.close()
						CurrentAction     = 'menu_boss_actions'
						CurrentActionMsg  = _U('open_bossmenu')
						CurrentActionData = {}
					end, options)
				end
				
				CurrentAction = nil
			end
		end

		if IsControlJustReleased(0, Config.Keys['F6']) and jobName == 'pivovar' and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'pivovar_actions') then
			openSocietyActionsMenu()
		end
	end
end)