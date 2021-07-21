local CurrentAction, CurrentActionMsg, CurrentActionData = nil, '', {}
local HasAlreadyEnteredMarker, LastHospital, LastPart, LastPartNum
local IsBusy = false
local spawnedVehicles, isInShopMenu = {}, false
--[[
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        print(GetEntityCoords(PlayerPedId()))
    end
end)
]]

local lib1_char_a, lib2_char_a, lib1_char_b, lib2_char_b, anim_start, anim_pump, anim_success = 'mini@cpr@char_a@cpr_def', 'mini@cpr@char_a@cpr_str', 'mini@cpr@char_b@cpr_def', 'mini@cpr@char_b@cpr_str', 'cpr_intro', 'cpr_pumpchest', 'cpr_success'

Citizen.CreateThread(function()
    RequestAnimDict(lib1_char_a)
    RequestAnimDict(lib2_char_a)

    RequestAnimDict(lib1_char_b)
    RequestAnimDict(lib2_char_b)

    -- RequestAnimDict("mini@cpr")
end)


function OpenAmbulanceActionsMenu()
	local elements = {
		{label = _U('cloakroom'), value = 'cloakroom'}
	}
	local jobName = ESX.PlayerData.job.grade_name

	if Config.EnablePlayerManagement and jobName == 'boss' or jobName == 'lowerboss1' or jobName == 'lowerboss2' then
		table.insert(elements, {label = _U('boss_actions'), value = 'boss_actions'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'ambulance_actions',
	{
		title		= _U('ambulance'),
		align		= 'top-left',
		elements	= elements
	}, function(data, menu)
		if data.current.value == 'cloakroom' then
			OpenCloakroomMenu()
		elseif data.current.value == 'boss_actions' then
			TriggerEvent('esx_society:openBossMenu', 'ambulance', function(data, menu)
				menu.close()
			end, {wash = false})
		end
	end, function(data, menu)
		menu.close()

		CurrentAction		= 'ambulance_actions_menu'
		CurrentActionMsg	= _U('open_menu')
		CurrentActionData	= {}
	end)
	
end




RegisterNetEvent('CUSTOM_esx_ambulance:playCPR')
AddEventHandler('CUSTOM_esx_ambulance:playCPR', function(playerheading, playercoords, playerlocation)
	local playerPed = PlayerPedId()

    local cpr = true

    Citizen.CreateThread(function()
        while cpr do
            Citizen.Wait(0)
            DisableAllControlActions(0)
            EnableControlAction(0, 1, true)
        end
    end)

    ClampGameplayCamPitch(0.0, -90.0)

    local heading = 0.0

    -- SetEntityCoordsNoOffset(playerPed, coords.x, coords.y, coords.z, false, false, false, true)
    local coords = GetEntityCoords(playerPed)
	-- NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
    --local x, y, z = table.unpack(playercoords + playerlocation * 1.0)
    local x, y, z = table.unpack(playercoords + playerlocation)
	NetworkResurrectLocalPlayer(x, y, z, playerheading, true, false)
	-- SetPlayerInvincible(playerPed, false)
	-- TriggerEvent('playerSpawned', coords.x, coords.y, coords.z)

    -- SetEntityCoords(playerPed, x, y, z)
    SetEntityHeading(playerPed, playerheading - 270.0)


    TaskPlayAnim(playerPed, lib1_char_b, anim_start, 8.0, 8.0, -1, 0, 0, false, false, false)
    Citizen.Wait(15800 - 900)
    for i=1, 15, 1 do
        Citizen.Wait(900)
        TaskPlayAnim(playerPed, lib2_char_b, anim_pump, 8.0, 8.0, -1, 0, 0, false, false, false)
    end

    cpr = false

    TaskPlayAnim(playerPed, lib2_char_b, anim_success, 8.0, 8.0, -1, 0, 0, false, false, false)
end)


function OpenMobileAmbulanceActionsMenu()
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
		title    = _U('ems_menu_title'),
		align    = 'top-left',
		elements = {
			{label = _U('ems_menu_revive'), value = 'revive'},
			{label = _U('ems_menu_small'), value = 'small'},
			{label = _U('ems_menu_big'), value = 'big'},
			{label = _U('ems_menu_putincar'), value = 'put_in_vehicle'},
			{label = _U('ems_menu_billing'), value = 'billing'},
			{label = 'Vystavit pojisteni', value = 'giveinsurance'},
			{label = 'Kontrola pojisteni', value = 'getinsurance'},
			{label = 'Odbery krve', value = 'odberykrve'},
		}
	}, function(data, menu)
		if IsBusy then return end

		local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

		if closestPlayer == -1 or closestDistance > 1.0 then
			--ESX.ShowNotification(_U('no_players'))
			exports['mythic_notify']:DoCustomHudText('inform', _U('no_players'), 2500, { ['background-color'] = '#FF0000', ['color'] = '#ffffff' })
		else

			if data.current.value == 'odberykrve' then
				TriggerServerEvent('esx_ambulancejob:odberyKrve', GetPlayerServerId(closestPlayer))
			end
			
			if data.current.value == 'giveinsurance' then
				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'giveinsurance', {
					title    = 'Delka pojisteni',
					align    = 'top-left',
					elements = {
						{label = 'Tyden osobni', length = 'week', company = nil},
						{label = 'Mesic osobni', length = 'month', company = nil},
						{label = 'Mesic firemni', length = 'month', company = true}
					}
				}, function(data2, menu2)
					local amount = 40000
					if data2.current.length == 'month' then
						amount = 120000
					end
					if data2.current.company == true then
						amount = 100000
					end
					local target = GetPlayerServerId(closestPlayer)

					TriggerEvent('esx_billing:sendBill', target, 'society_ambulance', _U('ambulance'), amount)
					TriggerServerEvent('esx_ambulancejob:giveinsurance', target, data2.current.length, data2.current.company)
					menu2.close()
				end, function(data2, menu2)
					menu2.close()
				end)
			end
			
			if data.current.value == 'getinsurance' then
				ESX.TriggerServerCallback('esx_ambulancejob:getinsurance', function(hasInsurance)
					if hasInsurance then
						ESX.ShowNotification('Hrac ma pojisteni')
					else
						ESX.ShowNotification('Hrac nema pojisteni')
					end
				end, GetPlayerServerId(closestPlayer))
			end

			if data.current.value == 'revive' then

				IsBusy = true

				ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
					if quantity > 0 then
						local closestPlayerPed = GetPlayerPed(closestPlayer)

						if IsPedDeadOrDying(closestPlayerPed, 1) then
							local playerPed = PlayerPedId()

							TriggerServerEvent('CUSTOM_esx_ambulance:requestCPR', GetPlayerServerId(closestPlayer), GetEntityHeading(playerPed), GetEntityCoords(playerPed), GetEntityForwardVector(playerPed))

							ESX.UI.Menu.CloseAll()

							ESX.ShowNotification(_U('revive_inprogress'), "success")


							-- print(GetAnimDuration(lib2, anim_success))

							local cpr = true

							Citizen.CreateThread(function()
								while cpr do
									Citizen.Wait(0)
									DisableAllControlActions(0)
									EnableControlAction(0, 1, true)
								end
							end)

							ClampGameplayCamPitch(0.0, -90.0)

							SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_UNARMED"), true)

							TaskPlayAnim(playerPed, lib1_char_a, anim_start, 8.0, 8.0, -1, 0, 0, false, false, false)

							Citizen.Wait(15800 - 900)
							for i=1, 15, 1 do
								Citizen.Wait(900)
								TaskPlayAnim(playerPed, lib2_char_a, anim_pump, 8.0, 8.0, -1, 0, 0, false, false, false)
							end

							cpr = false

							TaskPlayAnim(playerPed, lib2_char_a, anim_success, 8.0, 8.0, -1, 0, 0, false, false, false)

							Citizen.Wait(33590)

							TriggerServerEvent('esx_ambulancejob:removeItem', 'medikit')
							TriggerServerEvent('esx_ambulancejob:reILovePizzavive', GetPlayerServerId(closestPlayer))

							-- Show revive award?
							if Config.ReviveReward > 0 then
								--ESX.ShowNotification(_U('revive_complete_award', GetPlayerName(closestPlayer), Config.ReviveReward))
								exports['mythic_notify']:DoCustomHudText('inform', _U('revive_complete_award', GetPlayerName(closestPlayer), Config.ReviveReward), 5000)
							else
								--ESX.ShowNotification(_U('revive_complete', GetPlayerName(closestPlayer)))
								exports['mythic_notify']:DoCustomHudText('inform', _U('revive_complete', GetPlayerName(closestPlayer)), 2500, { ['background-color'] = '#008000', ['color'] = '#ffffff' })
							end
						else
							--ESX.ShowNotification(_U('player_not_unconscious'))
							exports['mythic_notify']:DoCustomHudText('inform', _U('player_not_unconscious'), 2500, { ['background-color'] = '#FF0000', ['color'] = '#ffffff' })
						end
					else
						--ESX.ShowNotification(_U('not_enough_medikit'))
						exports['mythic_notify']:DoCustomHudText('inform', _U('not_enough_medikit'), 2500, { ['background-color'] = '#FF0000', ['color'] = '#ffffff' })
					end

					IsBusy = false

				end, 'medikit')

			elseif data.current.value == 'small' then

				ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
					if quantity > 0 then
						local closestPlayerPed = GetPlayerPed(closestPlayer)
						local health = GetEntityHealth(closestPlayerPed)

						if health > 0 then
							local playerPed = PlayerPedId()

							IsBusy = true
							ESX.ShowNotification(_U('heal_inprogress'))
							TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
							Citizen.Wait(10000)
							ClearPedTasks(playerPed)

							TriggerServerEvent('esx_ambulancejob:removeItem', 'bandage')
							TriggerServerEvent('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'small')
							ESX.ShowNotification(_U('heal_complete', GetPlayerName(closestPlayer)))
							IsBusy = false
						else
							--ESX.ShowNotification(_U('player_not_conscious'))
							exports['mythic_notify']:DoCustomHudText('inform', _U('player_not_conscious'), 2500, { ['background-color'] = '#FF0000', ['color'] = '#ffffff' })
						end
					else
						--ESX.ShowNotification(_U('not_enough_bandage'))
							exports['mythic_notify']:DoCustomHudText('inform', _U('not_enough_bandage'), 2500, { ['background-color'] = '#FF0000', ['color'] = '#ffffff' })
					end
				end, 'bandage')

			elseif data.current.value == 'big' then

				ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
					if quantity > 0 then
						local closestPlayerPed = GetPlayerPed(closestPlayer)
						local health = GetEntityHealth(closestPlayerPed)

						if health > 0 then
							local playerPed = PlayerPedId()

							IsBusy = true
							ESX.ShowNotification(_U('heal_inprogress'))
							TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
							Citizen.Wait(10000)
							ClearPedTasks(playerPed)

							TriggerServerEvent('esx_ambulancejob:removeItem', 'medikit')
							TriggerServerEvent('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'big')
							ESX.ShowNotification(_U('heal_complete', GetPlayerName(closestPlayer)))
							IsBusy = false
						else
							--ESX.ShowNotification(_U('player_not_conscious'))
							exports['mythic_notify']:DoCustomHudText('inform', _U('player_not_conscious'), 2500, { ['background-color'] = '#FF0000', ['color'] = '#ffffff' })
						end
					else
						--ESX.ShowNotification(_U('not_enough_medikit'))
							exports['mythic_notify']:DoCustomHudText('inform', _U('not_enough_medikit'), 2500, { ['background-color'] = '#FF0000', ['color'] = '#ffffff' })
					end
				end, 'medikit')

			elseif data.current.value == 'put_in_vehicle' then
				TriggerServerEvent('esx_ambulancejob:putInVehicle', GetPlayerServerId(closestPlayer))
--start billing or invoice					
			elseif data.current.value == 'billing' then

				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'billing', {
					title = _U('invoice_amount')
				}, function(data, menu)
					local amount = tonumber(data.value)

					if amount == nil or amount < 0 then
						ESX.ShowNotification(_U('amount_invalid'))
					else
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestPlayer == -1 or closestDistance > 3.0 then
							--ESX.ShowNotification(_U('no_players_nearby'))
							exports['mythic_notify']:DoCustomHudText('inform', _U('no_players_nearby'), 2500, { ['background-color'] = '#FF0000', ['color'] = '#ffffff' })
						else
							menu.close()
							TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_ambulance', _U('ambulance'), amount)
						end
					end
				end, function(data, menu)
					menu.close()
				end)
--end billing or invoice
			end
		end
	end, function(data, menu)
		menu.close()
	end)
end

function FastTravel(coords, heading)
	local playerPed = PlayerPedId()

	DoScreenFadeOut(800)

	while not IsScreenFadedOut() do
		Citizen.Wait(500)
	end

	ESX.Game.Teleport(playerPed, coords, function()
		DoScreenFadeIn(800)

		if heading then
			SetEntityHeading(playerPed, heading)
		end
	end)
end

-- Draw markers & Marker logic
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerCoords = GetEntityCoords(PlayerPedId())
		local letSleep, isInMarker, hasExited = true, false, false
		local currentHospital, currentPart, currentPartNum

		for hospitalNum,hospital in pairs(Config.Hospitals) do

			-- Ambulance Actions
			for k,v in ipairs(hospital.AmbulanceActions) do
				local distance = GetDistanceBetweenCoords(playerCoords, v, true)

				if distance < Config.DrawDistance then
					DrawMarker(Config.Marker.type, v, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.x, Config.Marker.y, Config.Marker.z, Config.Marker.r, Config.Marker.g, Config.Marker.b, Config.Marker.a, false, false, 2, true, nil, nil, false)
					letSleep = false
				end

				if distance < Config.Marker.x then
					isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'AmbulanceActions', k
				end
			end

			-- Pharmacies
			for k,v in ipairs(hospital.Pharmacies) do
				local distance = GetDistanceBetweenCoords(playerCoords, v, true)

				if distance < Config.DrawDistance then
					DrawMarker(Config.Marker.type, v, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.x, Config.Marker.y, Config.Marker.z, Config.Marker.r, Config.Marker.g, Config.Marker.b, Config.Marker.a, false, false, 2, true, nil, nil, false)
					letSleep = false
				end

				if distance < Config.Marker.x then
					isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'Pharmacy', k
				end
			end

			-- Cekarna
			for k,v in ipairs(hospital.Cekarna) do
				local distance = GetDistanceBetweenCoords(playerCoords, v, true)

				if distance < Config.DrawDistance then
					DrawMarker(Config.Marker2.type, v, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker2.x, Config.Marker2.y, Config.Marker2.z,
					Config.Marker2.r, Config.Marker2.g, Config.Marker2.b, Config.Marker2.a, false, false, 2, Config.Marker2.rotate, nil, nil, false)
					letSleep = false
				end

				if distance < Config.Marker2.x then
					isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'Cekarna', k
				end
			end

			-- Vault
			for k,v in ipairs(hospital.Vault) do
				local distance = GetDistanceBetweenCoords(playerCoords, v, true)

				if distance < Config.DrawDistance then
					DrawMarker(Config.Marker2.type, v, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker2.x, Config.Marker2.y, Config.Marker2.z,
					Config.Marker2.r, Config.Marker2.g, Config.Marker2.b, Config.Marker2.a, false, false, 2, Config.Marker2.rotate, nil, nil, false)
					letSleep = false
				end

				if distance < Config.Marker2.x then
					isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'Vault', k
				end
			end

			-- Vehicle Spawners
			for k,v in ipairs(hospital.Vehicles) do
				local distance = GetDistanceBetweenCoords(playerCoords, v.Spawner, true)

				if distance < Config.DrawDistance then
					DrawMarker(v.Marker.type, v.Spawner, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, v.Marker.a, false, false, 2, v.Marker.rotate, nil, nil, false)
					letSleep = false
				end

				if distance < v.Marker.x then
					isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'Vehicles', k
				end
			end

			-- Helicopter Spawners
			for k,v in ipairs(hospital.Helicopters) do
				local distance = GetDistanceBetweenCoords(playerCoords, v.Spawner, true)

				if distance < Config.DrawDistance then
					DrawMarker(v.Marker.type, v.Spawner, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, v.Marker.a, false, false, 2, v.Marker.rotate, nil, nil, false)
					letSleep = false
				end

				if distance < v.Marker.x then
					isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'Helicopters', k
				end
			end

			-- Fast Travels
			for k,v in ipairs(hospital.FastTravels) do
				local distance = GetDistanceBetweenCoords(playerCoords, v.From, true)

				if distance < Config.DrawDistance then
					DrawMarker(v.Marker.type, v.From, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, v.Marker.a, false, false, 2, v.Marker.rotate, nil, nil, false)
					letSleep = false
				end


				if distance < v.Marker.x then
					FastTravel(v.To.coords, v.To.heading)
				end
			end

			-- Fast Travels (Prompt)
			for k,v in ipairs(hospital.FastTravelsPrompt) do
				local distance = GetDistanceBetweenCoords(playerCoords, v.From, true)

				if distance < Config.DrawDistance then
					DrawMarker(v.Marker.type, v.From, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, v.Marker.a, false, false, 2, v.Marker.rotate, nil, nil, false)
					letSleep = false
				end

				if distance < v.Marker.x then
					isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'FastTravelsPrompt', k
				end
			end

		end

		-- Logic for exiting & entering markers
		if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastHospital ~= currentHospital or LastPart ~= currentPart or LastPartNum ~= currentPartNum)) then

			if
				(LastHospital ~= nil and LastPart ~= nil and LastPartNum ~= nil) and
				(LastHospital ~= currentHospital or LastPart ~= currentPart or LastPartNum ~= currentPartNum)
			then
				TriggerEvent('esx_ambulancejob:hasExitedMarker', LastHospital, LastPart, LastPartNum)
				hasExited = true
			end

			HasAlreadyEnteredMarker, LastHospital, LastPart, LastPartNum = true, currentHospital, currentPart, currentPartNum

			TriggerEvent('esx_ambulancejob:hasEnteredMarker', currentHospital, currentPart, currentPartNum)

		end

		if not hasExited and not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_ambulancejob:hasExitedMarker', LastHospital, LastPart, LastPartNum)
		end

		if letSleep then
			Citizen.Wait(500)
		end
	end
end)

AddEventHandler('esx_ambulancejob:hasEnteredMarker', function(hospital, part, partNum)
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' then
		local jobGrade = ESX.PlayerData.job.grade_name
		if part == 'AmbulanceActions' then
			CurrentAction = part
			CurrentActionMsg = _U('actions_prompt')
			CurrentActionData = {}
		elseif part == 'Pharmacy' then
			CurrentAction = part
			CurrentActionMsg = _U('open_pharmacy')
			CurrentActionData = {}
		elseif part == 'Vehicles' then
			CurrentAction = part
			CurrentActionMsg = _U('garage_prompt')
			CurrentActionData = {hospital = hospital, partNum = partNum}
		elseif part == 'Helicopters' then
			CurrentAction = part
			CurrentActionMsg = _U('helicopter_prompt')
			CurrentActionData = {hospital = hospital, partNum = partNum}
		elseif part == 'Vault' and (jobGrade == 'boss' or jobGrade == 'lowerboss1' or jobGrade == 'lowerboss2') then
			CurrentAction = part
			CurrentActionMsg = 'Stiskni ~INPUT_CONTEXT~ pro otevreni skladu'
			CurrentActionData = {hospital = hospital, partNum = partNum}
		elseif part == 'FastTravelsPrompt' then
			local travelItem = Config.Hospitals[hospital][part][partNum]

			CurrentAction = part
			CurrentActionMsg = travelItem.Prompt
			CurrentActionData = {to = travelItem.To.coords, heading = travelItem.To.heading}
		end	
	elseif ESX.PlayerData.job and (
		ESX.PlayerData.job.name == 'offambulance' or
		ESX.PlayerData.job.name == 'offpolice' or ESX.PlayerData.job.name == 'police' or
		ESX.PlayerData.job.name == 'offstate' or ESX.PlayerData.job.name == 'state' or
		ESX.PlayerData.job.name == 'offhasici' or ESX.PlayerData.job.name == 'hasici'
	) then
		if part == 'FastTravelsPrompt' then
			local travelItem = Config.Hospitals[hospital][part][partNum]

			CurrentAction = part
			CurrentActionMsg = travelItem.Prompt
			CurrentActionData = {to = travelItem.To.coords, heading = travelItem.To.heading}
		end	
	end
	if part == 'Cekarna' then
		CurrentAction = part
		CurrentActionMsg = 'Stiskni ~INPUT_CONTEXT~ pro zavolani recepcni'
		CurrentActionData = {hospital = hospital, partNum = partNum}
	end
end)

AddEventHandler('esx_ambulancejob:hasExitedMarker', function(hospital, part, partNum)
	if not isInShopMenu then
		ESX.UI.Menu.CloseAll()
	end

	CurrentAction = nil
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if CurrentAction then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, Keys['E']) then

				if CurrentAction == 'AmbulanceActions' then
					OpenAmbulanceActionsMenu()
				elseif CurrentAction == 'Pharmacy' then
					OpenPharmacyMenu()
				elseif CurrentAction == 'Cekarna' then
					PrepareCekarnaMenu()
				elseif CurrentAction == 'Vault' then
					PrepareVaultMenu()
				elseif CurrentAction == 'Vehicles' then
					OpenVehicleSpawnerMenu(CurrentActionData.hospital, CurrentActionData.partNum)
				elseif CurrentAction == 'Helicopters' then
					OpenHelicopterSpawnerMenu(CurrentActionData.hospital, CurrentActionData.partNum)
				elseif CurrentAction == 'FastTravelsPrompt' then
					FastTravel(CurrentActionData.to, CurrentActionData.heading)
				end

				CurrentAction = nil

			end

		elseif ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'ambulance' and not IsDead then
			if IsControlJustReleased(0, Keys['F6']) then
				OpenMobileAmbulanceActionsMenu()
			end
		else
			Citizen.Wait(500)
		end
	end
end)

RegisterNetEvent('esx_ambulancejob:putInVehicle')
AddEventHandler('esx_ambulancejob:putInVehicle', function()
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)

	if IsAnyVehicleNearPoint(coords, 5.0) then
		local vehicle = GetClosestVehicle(coords, 5.0, 0, 71)

		if DoesEntityExist(vehicle) then
			local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

			for i=maxSeats - 1, 0, -1 do
				if IsVehicleSeatFree(vehicle, i) then
					freeSeat = i
					break
				end
			end

			if freeSeat then
				TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
			end
		end
	end
end)

function TableConcat(t1, t2)
	local result = {}
	
	for index, item in pairs(t1) do
		result[index] = item
	end
	for index, item in pairs(t2) do
		result[index] = item
	end

    return result
end

-- SKLAD

function PrepareVaultMenu ()
	local elements = {
		{label = _U('get_weapon'), value = 'get_weapon'},
		{label = _U('put_weapon'), value = 'put_weapon'},
		{label = _U('get_object'), value = 'get_stock'},
		{label = _U('put_object'), value = 'put_stock'}
	}
	
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'vault',
		{
			title    = _U('vault'),
			align    = 'left',
			elements = elements,
		},
		function(data, menu)
			if data.current.value == 'get_weapon' then
				OpenGetWeaponMenu()
			end

			if data.current.value == 'put_weapon' then
				OpenPutWeaponMenu()
			end

            if data.current.value == 'put_stock' then
                OpenPutFridgeStocksMenu()
			end

			if data.current.value == 'get_stock' then
				OpenGetFridgeStocksMenu()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end


function getIndexOfItems (values)
	local index={}
	for k,v in pairs(values) do
	   index[v.originalLabel] = k
	end
	return index
end

function OpenGetFridgeStocksMenu()

	ESX.TriggerServerCallback('esx_ambulancejob:getFridgeStockItems', function(items)
		local elements = {}

		for i=1, #items, 1 do
			if items[i].count > 0 then
				table.insert(elements, {
					label = items[i].label .. ' ' .. ' x' .. items[i].count,
					value = items[i].name,
					originalLabel = items[i].label,
					count = items[i].count,
				})
			end
		end

		table.sort(elements, function(a, b)
			return a.originalLabel < b.originalLabel
		end)

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'fridge_menu',
			{
				title    = 'Sklad',
				align    = 'left',
				elements = elements
			},
			function(data, menu)

				local itemName = data.current.value

				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'fridge_menu_get_item_count',
					{
						title = _U('quantity')
					},
					function(data2, menu2)

						local count = tonumber(data2.value)

						if count == nil then
							ESX.ShowNotification(_U('invalid_quantity'))
						else
							menu2.close()
							TriggerServerEvent('esx_ambulancejob:getFridgeStockItem', itemName, count)
							local index = getIndexOfItems(elements)[data.current.originalLabel]
							menu.setElement(index, 'label', data.current.originalLabel .. ' x' .. data.current.count - count)
							menu.setElement(index, 'count', data.current.count - count)
							menu.refresh()
						end

					end,
					function(data2, menu2)
						menu2.close()
					end
				)

			end,
			function(data, menu)
				menu.close()
			end
		)
	end)
end

function OpenPutFridgeStocksMenu()
    ESX.TriggerServerCallback('esx_ambulancejob:getPlayerInventory', function(inventory)
		local elements = {}

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. ' x' .. item.count,
					type = 'item_standard',
					value = item.name,
					originalLabel = item.label,
					count = item.count,
					index = i,
				})
			end
		end

		table.sort(elements, function(a, b)
			return a.originalLabel < b.originalLabel
		end)

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'fridge_menu',
			{
				title    = 'Sklad',
				align    = 'left',
				elements = elements
			},
			function(data, menu)
				local itemName = data.current.value

				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'fridge_menu_put_item_count',
					{
						title = _U('quantity')
					},
					function(data2, menu2)

						local count = tonumber(data2.value)

						if count == nil then
							ESX.ShowNotification(_U('invalid_quantity'))
						else
							menu2.close()
							
							TriggerServerEvent('esx_ambulancejob:putFridgeStockItems', itemName, count)
							
							local index = getIndexOfItems(elements)[data.current.originalLabel]
							menu.setElement(index, 'label', data.current.originalLabel .. ' x' .. data.current.count - count)
							menu.setElement(index, 'count', data.current.count - count)
							menu.refresh()
						end

					end,
					function(data2, menu2)
						menu2.close()
					end
				)

			end,
			function(data, menu)
				menu.close()
			end
		)
	end)
end

function OpenGetWeaponMenu ()
	ESX.TriggerServerCallback('esx_ambulancejob:getVaultWeapons', function(weapons)
		local elements = {}

		for i=1, #weapons, 1 do
			if weapons[i].count > 0 then
				table.insert(elements, {label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name), value = weapons[i].name})
			end
		end

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'vault_get_weapon',
			{
				title    = 'Zbrojnice',
				align    = 'left',
				elements = elements,
			},
			function(data, menu)

				menu.close()

				ESX.TriggerServerCallback('esx_ambulancejob:removeVaultWeapon', function()
					OpenGetWeaponMenu()
				end, data.current.value)

			end,
			function(data, menu)
				menu.close()
			end
		)
	end)
end

function OpenPutWeaponMenu()
	local elements   = {}
	local playerPed  = GetPlayerPed(-1)
	local weaponList = ESX.GetWeaponList()

	for i = 1, #weaponList, 1 do
		local weaponHash = GetHashKey(weaponList[i].name)

		if HasPedGotWeapon(playerPed,  weaponHash,  false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
			local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
			table.insert(elements, {label = weaponList[i].label, value = weaponList[i].name})
		end
	end

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'vault_put_weapon',
		{
			title    = 'Zbrojnice',
			align    = 'left',
			elements = elements,
		},
		function(data, menu)
			menu.close()

			ESX.TriggerServerCallback('esx_ambulancejob:addVaultWeapon', function()
				OpenPutWeaponMenu()
			end, data.current.value)
		end,
		function(data, menu)
			menu.close()
		end
	)
end

-- SKLAD KONEC
function PrepareCekarnaMenu ()
	ESX.TriggerServerCallback('jobscount:getJobsCount', function(savedJobs)
		local ambulanceCount = 0
		for k,v in pairs(savedJobs) do
			if v == 'ambulance' then
				ambulanceCount = ambulanceCount + 1
			end
		end
		ESX.TriggerServerCallback('esx_ambulancejob:getinsurancever', function(hasInsurance)
			OpenCekarnaMenu(ambulanceCount, hasInsurance)
		end)
	end)
end

function OpenCekarnaMenu(calculatedCount, hasInsurance)
	local elements = {}
	local jobName = ESX.PlayerData.job.name
	local hasIZSJob = jobName == 'ambulance' or jobName == 'state' or jobName == 'hasici' or jobName == 'police' or jobName == 'sheriff'
	
	if calculatedCount > 0 then
		table.insert(elements, {value = "callems", label = "Nahlasit se na recepci"})
	elseif hasInsurance or hasIZSJob then
		elements = {
			{value = "heal", label = "Osetreni zaloznim doktorem (pojisteny)", price = 0, time = 180000}
		}
	else
		table.insert(elements, {value = "heal", label = "Rychle osetreni zaloznim doktorem (15k)", price = 15000, time = 60000})
		table.insert(elements, {value = "heal", label = "Osetreni zaloznim doktorem (5k)", price = 5000, time = 300000})
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'emsrecepce', {
		title    = 'Recepcni',
		align    = 'left',
		elements = elements
	}, function(data, menu)
		if data.current.value == "callems" then
			TriggerServerEvent('gcPhone:sendMessage', 'ambulance', 'Pacient vstoupil do cekarny')
			TriggerServerEvent('esx_ambulancejob:sendCekarnaLog')
		end

		if data.current.value == "heal" then
			TriggerServerEvent('esx_ambulancejob:handlePassiveDoctor', data.current.price, data.current.time)
			TriggerEvent('esx_basicneeds:healPlayer')
		end

		menu.close()
	end, function(data, menu)
		menu.close()
	end)
end

function OpenCloakroomMenu()
 	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom', {
 		title    = _U('cloakroom'),
 		align    = 'top-left',
 		elements = {
 			{label = _U('ems_clothes_civil'), value = 'citizen_wear'},
			 {label = _U('ems_clothes_ems'), value = 'ambulance_wear'},
			 {label = 'pilot', value = 'pilot'},
 		}
 	}, function(data, menu)
 		if data.current.value == 'citizen_wear' then
 			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
 				TriggerEvent('skinchanger:loadSkin', skin)
 			end)
 		elseif data.current.value == 'ambulance_wear' then
			 ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				local sex = 'male'
				if skin.sex ~= 0 then
					sex = 'female'
				end
				local sharedSkin = Config.Clothes.shared[sex]
				local jobClothes = Config.Clothes[sex][ESX.PlayerData.job.grade_name]
				
				local result = TableConcat(sharedSkin, jobClothes)
				print(ESX.DumpTable(result))
 				TriggerEvent('skinchanger:loadClothes', skin, result)
			 end)
		elseif data.current.value == 'pilot' then
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				if skin.sex == 0 then
					TriggerEvent('skinchanger:loadClothes', skin, Config.PilotOutfit.male)
				else
					TriggerEvent('skinchanger:loadClothes', skin, Config.PilotOutfit.female)
				end
			end)
 		end

 		menu.close()
 	end, function(data, menu)
 		menu.close()
 	end)
 end

function OpenVehicleSpawnerMenu(hospital, partNum)
	local playerCoords = GetEntityCoords(PlayerPedId())
	local elements = {
		{label = _U('garage_storeditem'), action = 'garage'},
		{label = _U('garage_storeitem'), action = 'store_garage'},
		{label = _U('garage_buyitem'), action = 'buy_vehicle'}
	}

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle', {
		title    = _U('garage_title'),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)

		if data.current.action == 'buy_vehicle' then
			local shopCoords = Config.Hospitals[hospital].Vehicles[partNum].InsideShop
			local shopElements = {}

			local authorizedVehicles = Config.AuthorizedVehicles[ESX.PlayerData.job.grade_name]

			if #authorizedVehicles > 0 then
				for k,vehicle in ipairs(authorizedVehicles) do
					table.insert(shopElements, {
						label = ('%s - <span style="color:green;">%s</span>'):format(vehicle.label, _U('shop_item', ESX.Math.GroupDigits(vehicle.price))),
						name  = vehicle.label,
						model = vehicle.model,
						price = vehicle.price,
						props = vehicle.props,
						type  = 'car'
					})
				end
			else
				return
			end

			OpenShopMenu(shopElements, playerCoords, shopCoords)
		elseif data.current.action == 'garage' then
			local garage = {}

			ESX.TriggerServerCallback('esx_vehicleshop:retrieveJobVehicles', function(jobVehicles)
				if #jobVehicles > 0 then
					for k,v in ipairs(jobVehicles) do
						local props = json.decode(v.vehicle)
						local vehicleName = exports.nnvozidla:getVehicleName(GetDisplayNameFromVehicleModel(props.model))
						local label = ('%s - <span style="color:darkgoldenrod;">%s</span>: '):format(vehicleName, props.plate)

						if v.stored then
							label = label .. ('<span style="color:green;">%s</span>'):format(_U('garage_stored'))
						else
							label = label .. ('<span style="color:darkred;">%s</span>'):format(_U('garage_notstored'))
						end

						table.insert(garage, {
							label = label,
							stored = v.stored,
							model = props.model,
							vehicleProps = props
						})
					end

					ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_garage', {
						title    = _U('garage_title'),
						align    = 'top-left',
						elements = garage
					}, function(data2, menu2)
						if data2.current.stored then
							local foundSpawn, spawnPoint = GetAvailableVehicleSpawnPoint(hospital, 'Vehicles', partNum)

							if foundSpawn then
								menu2.close()

								ESX.Game.SpawnVehicle(data2.current.model, spawnPoint.coords, spawnPoint.heading, function(vehicle)
									ESX.Game.SetVehicleProperties(vehicle, data2.current.vehicleProps)

									TriggerServerEvent('esx_vehicleshop:setJobVehicleState', data2.current.vehicleProps.plate, false)
									ESX.ShowNotification(_U('garage_released'))
								end)
							end
						else
							ESX.ShowNotification(_U('garage_notavailable'))
						end
					end, function(data2, menu2)
						menu2.close()
					end)

				else
					ESX.ShowNotification(_U('garage_empty'))
				end
			end, 'car')

		elseif data.current.action == 'store_garage' then
			StoreNearbyVehicle(playerCoords)
		end

	end, function(data, menu)
		menu.close()
	end)

end

function StoreNearbyVehicle(playerCoords)
	local vehicles, vehiclePlates = ESX.Game.GetVehiclesInArea(playerCoords, 30.0), {}

	if #vehicles > 0 then
		for k,v in ipairs(vehicles) do

			-- Make sure the vehicle we're saving is empty, or else it wont be deleted
			if GetVehicleNumberOfPassengers(v) == 0 and IsVehicleSeatFree(v, -1) then
				table.insert(vehiclePlates, {
					vehicle = v,
					plate = ESX.Math.Trim(GetVehicleNumberPlateText(v))
				})
			end
		end
	else
		ESX.ShowNotification(_U('garage_store_nearby'))
		return
	end

	ESX.TriggerServerCallback('esx_ambulancejob:storeNearbyVehicle', function(storeSuccess, foundNum)
		if storeSuccess then
			local vehicleId = vehiclePlates[foundNum]
			local attempts = 0
			ESX.Game.DeleteVehicle(vehicleId.vehicle)
			IsBusy = true

			Citizen.CreateThread(function()
				while IsBusy do
					Citizen.Wait(0)
					drawLoadingText(_U('garage_storing'), 255, 255, 255, 255)
				end
			end)

			-- Workaround for vehicle not deleting when other players are near it.
			while DoesEntityExist(vehicleId.vehicle) do
				Citizen.Wait(500)
				attempts = attempts + 1

				-- Give up
				if attempts > 30 then
					break
				end

				vehicles = ESX.Game.GetVehiclesInArea(playerCoords, 30.0)
				if #vehicles > 0 then
					for k,v in ipairs(vehicles) do
						if ESX.Math.Trim(GetVehicleNumberPlateText(v)) == vehicleId.plate then
							ESX.Game.DeleteVehicle(v)
							break
						end
					end
				end
			end

			IsBusy = false
			ESX.ShowNotification(_U('garage_has_stored'))
		else
			ESX.ShowNotification(_U('garage_has_notstored'))
		end
	end, vehiclePlates)
end

function GetAvailableVehicleSpawnPoint(hospital, part, partNum)
	local spawnPoints = Config.Hospitals[hospital][part][partNum].SpawnPoints
	local found, foundSpawnPoint = false, nil

	for i=1, #spawnPoints, 1 do
		if ESX.Game.IsSpawnPointClear(spawnPoints[i].coords, spawnPoints[i].radius) then
			found, foundSpawnPoint = true, spawnPoints[i]
			break
		end
	end

	if found then
		return true, foundSpawnPoint
	else
		ESX.ShowNotification(_U('garage_blocked'))
		return false
	end
end

function OpenHelicopterSpawnerMenu(hospital, partNum)
	local playerCoords = GetEntityCoords(PlayerPedId())
	ESX.PlayerData = ESX.GetPlayerData()
	local elements = {
		{label = _U('helicopter_garage'), action = 'garage'},
		{label = _U('helicopter_store'), action = 'store_garage'},
		{label = _U('helicopter_buy'), action = 'buy_helicopter'}
	}

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'helicopter_spawner', {
		title    = _U('helicopter_title'),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)

		if data.current.action == 'buy_helicopter' then
			local shopCoords = Config.Hospitals[hospital].Helicopters[partNum].InsideShop
			local shopElements = {}

			local authorizedHelicopters = Config.AuthorizedHelicopters[ESX.PlayerData.job.grade_name]

			if #authorizedHelicopters > 0 then
				for k,helicopter in ipairs(authorizedHelicopters) do
					table.insert(shopElements, {
						label = ('%s - <span style="color:green;">%s</span>'):format(helicopter.label, _U('shop_item', ESX.Math.GroupDigits(helicopter.price))),
						name  = helicopter.label,
						model = helicopter.model,
						price = helicopter.price,
						props = helicopter.props,
						type  = 'helicopter'
					})
				end
			else
				ESX.ShowNotification(_U('helicopter_notauthorized'))
				return
			end

			OpenShopMenu(shopElements, playerCoords, shopCoords)
		elseif data.current.action == 'garage' then
			local garage = {}

			ESX.TriggerServerCallback('esx_vehicleshop:retrieveJobVehicles', function(jobVehicles)
				if #jobVehicles > 0 then
					for k,v in ipairs(jobVehicles) do
						local props = json.decode(v.vehicle)
						local vehicleName = exports.nnvozidla:getVehicleName(GetDisplayNameFromVehicleModel(props.model))
						local label = ('%s - <span style="color:darkgoldenrod;">%s</span>: '):format(vehicleName, props.plate)

						if v.stored then
							label = label .. ('<span style="color:green;">%s</span>'):format(_U('garage_stored'))
						else
							label = label .. ('<span style="color:darkred;">%s</span>'):format(_U('garage_notstored'))
						end

						table.insert(garage, {
							label = label,
							stored = v.stored,
							model = props.model,
							vehicleProps = props
						})
					end

					ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'helicopter_garage', {
						title    = _U('helicopter_garage_title'),
						align    = 'top-left',
						elements = garage
					}, function(data2, menu2)
						if data2.current.stored then
							local foundSpawn, spawnPoint = GetAvailableVehicleSpawnPoint(hospital, 'Helicopters', partNum)

							if foundSpawn then
								menu2.close()

								ESX.Game.SpawnVehicle(data2.current.model, spawnPoint.coords, spawnPoint.heading, function(vehicle)
									ESX.Game.SetVehicleProperties(vehicle, data2.current.vehicleProps)

									TriggerServerEvent('esx_vehicleshop:setJobVehicleState', data2.current.vehicleProps.plate, false)
									ESX.ShowNotification(_U('garage_released'))
								end)
							end
						else
							ESX.ShowNotification(_U('garage_notavailable'))
						end
					end, function(data2, menu2)
						menu2.close()
					end)

				else
					ESX.ShowNotification(_U('garage_empty'))
				end
			end, 'helicopter')

		elseif data.current.action == 'store_garage' then
			StoreNearbyVehicle(playerCoords)
		end

	end, function(data, menu)
		menu.close()
	end)

end

function OpenShopMenu(elements, restoreCoords, shopCoords)
	local playerPed = PlayerPedId()
	isInShopMenu = true

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_shop', {
		title    = _U('vehicleshop_title'),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_shop_confirm', {
			title    = _U('vehicleshop_confirm', data.current.name, data.current.price),
			align    = 'top-left',
			elements = {
				{ label = _U('confirm_no'), value = 'no' },
				{ label = _U('confirm_yes'), value = 'yes' }
			}
		}, function(data2, menu2)

			if data2.current.value == 'yes' then
				local newPlate = exports['esx_vehicleshop']:GeneratePlate()
				local vehicle  = GetVehiclePedIsIn(playerPed, false)
				local props    = ESX.Game.GetVehicleProperties(vehicle)
				props.plate    = newPlate

				ESX.TriggerServerCallback('esx_ambulancejob:buyJobVehicle', function (bought)
					if bought then
						ESX.ShowNotification(_U('vehicleshop_bought', data.current.name, ESX.Math.GroupDigits(data.current.price)))

						isInShopMenu = false
						ESX.UI.Menu.CloseAll()
				
						DeleteSpawnedVehicles()
						FreezeEntityPosition(playerPed, false)
						SetEntityVisible(playerPed, true)
				
						ESX.Game.Teleport(playerPed, restoreCoords)
					else
						ESX.ShowNotification(_U('vehicleshop_money'))
						menu2.close()
					end
				end, props, data.current.type)
			else
				menu2.close()
			end

		end, function(data2, menu2)
			menu2.close()
		end)

		end, function(data, menu)
		isInShopMenu = false
		ESX.UI.Menu.CloseAll()

		DeleteSpawnedVehicles()
		FreezeEntityPosition(playerPed, false)
		SetEntityVisible(playerPed, true)

		ESX.Game.Teleport(playerPed, restoreCoords)
	end, function(data, menu)
		DeleteSpawnedVehicles()

		WaitForVehicleToLoad(data.current.model)
		ESX.Game.SpawnLocalVehicle(data.current.model, shopCoords, 0.0, function(vehicle)
			table.insert(spawnedVehicles, vehicle)
			TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
			FreezeEntityPosition(vehicle, true)
			SetModelAsNoLongerNeeded(data.current.model)

			if data.current.props then
				ESX.Game.SetVehicleProperties(vehicle, data.current.props)
			end
		end)
	end)

	WaitForVehicleToLoad(elements[1].model)
	ESX.Game.SpawnLocalVehicle(elements[1].model, shopCoords, 0.0, function(vehicle)
		table.insert(spawnedVehicles, vehicle)
		TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
		FreezeEntityPosition(vehicle, true)
		SetModelAsNoLongerNeeded(elements[1].model)

		if elements[1].props then
			ESX.Game.SetVehicleProperties(vehicle, elements[1].props)
		end
	end)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if isInShopMenu then
			DisableControlAction(0, 75, true)  -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle
		else
			Citizen.Wait(500)
		end
	end
end)

function DeleteSpawnedVehicles()
	while #spawnedVehicles > 0 do
		local vehicle = spawnedVehicles[1]
		ESX.Game.DeleteVehicle(vehicle)
		table.remove(spawnedVehicles, 1)
	end
end

function WaitForVehicleToLoad(modelHash)
	modelHash = (type(modelHash) == 'number' and modelHash or GetHashKey(modelHash))

	if not HasModelLoaded(modelHash) then
		RequestModel(modelHash)

		while not HasModelLoaded(modelHash) do
			Citizen.Wait(0)

			DisableControlAction(0, Keys['TOP'], true)
			DisableControlAction(0, Keys['DOWN'], true)
			DisableControlAction(0, Keys['LEFT'], true)
			DisableControlAction(0, Keys['RIGHT'], true)
			DisableControlAction(0, 176, true) -- ENTER key
			DisableControlAction(0, Keys['BACKSPACE'], true)

			drawLoadingText(_U('vehicleshop_awaiting_model'), 255, 255, 255, 255)
		end
	end
end

function drawLoadingText(text, red, green, blue, alpha)
	SetTextFont(4)
	SetTextScale(0.0, 0.5)
	SetTextColour(red, green, blue, alpha)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(true)

	BeginTextCommandDisplayText("STRING")
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(0.5, 0.5)
end

function OpenPharmacyMenu()
	ESX.UI.Menu.CloseAll()

	local jobName = ESX.PlayerData.job.grade_name

	if jobName == 'ambulance' then
		return
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'pharmacy', {
		title    = _U('pharmacy_menu_title'),
		align    = 'top-left',
		elements = {
			{label = _U('pharmacy_take', _U('medikit')), value = 'medikit'},
			{label = _U('pharmacy_take', _U('bandage')), value = 'bandage'},
			{label = _U('pharmacy_take', _U('carmedkit')), value = 'carmedkit'},
		}
	}, function(data, menu)
		TriggerServerEvent('esx_ambulancejob:giveItem', data.current.value)
	end, function(data, menu)
		menu.close()
	end)
end

function WarpPedInClosestVehicle(ped)
	local coords = GetEntityCoords(ped)

	local vehicle, distance = ESX.Game.GetClosestVehicle(coords)

	if distance ~= -1 and distance <= 5.0 then
		local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

		for i=maxSeats - 1, 0, -1 do
			if IsVehicleSeatFree(vehicle, i) then
				freeSeat = i
				break
			end
		end

		if freeSeat then
			TaskWarpPedIntoVehicle(ped, vehicle, freeSeat)
		end
	else
		ESX.ShowNotification(_U('no_vehicles'))
	end
end

RegisterNetEvent('esx_ambulancejob:heal')
AddEventHandler('esx_ambulancejob:heal', function(healType, quiet)
	local playerPed = PlayerPedId()
	local maxHealth = GetEntityMaxHealth(playerPed)

	if healType == 'small' then
		local health = GetEntityHealth(playerPed)
		local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 8))
		SetEntityHealth(playerPed, newHealth)
	elseif healType == 'big' then
		SetEntityHealth(playerPed, maxHealth)
	end

	if not quiet then
		ESX.ShowNotification(_U('healed'))
	end
end)
