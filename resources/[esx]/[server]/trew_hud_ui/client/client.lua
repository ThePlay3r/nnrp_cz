local ESX = nil

local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18, ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182, ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81, ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178, ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173, ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
local AllWeapons = json.decode('{"melee":{"dagger":"0x92A27487","bat":"0x958A4A8F","bottle":"0xF9E6AA4B","crowbar":"0x84BD7BFD","unarmed":"0xA2719263","flashlight":"0x8BB05FD7","golfclub":"0x440E4788","hammer":"0x4E875F73","hatchet":"0xF9DCBF2D","knuckle":"0xD8DF3C3C","knife":"0x99B507EA","machete":"0xDD5DF8D9","switchblade":"0xDFE37640","nightstick":"0x678B81B1","wrench":"0x19044EE0","battleaxe":"0xCD274149","poolcue":"0x94117305","stone_hatchet":"0x3813FC08"},"handguns":{"pistol":"0x1B06D571","pistol_mk2":"0xBFE256D4","combatpistol":"0x5EF9FEC4","appistol":"0x22D8FE39","stungun":"0x3656C8C1","pistol50":"0x99AEEB3B","snspistol":"0xBFD21232","snspistol_mk2":"0x88374054","heavypistol":"0xD205520E","vintagepistol":"0x83839C4","flaregun":"0x47757124","marksmanpistol":"0xDC4DB296","revolver":"0xC1B3C3D1","revolver_mk2":"0xCB96392F","doubleaction":"0x97EA20B8","raypistol":"0xAF3696A1"},"smg":{"microsmg":"0x13532244","smg":"0x2BE6766B","smg_mk2":"0x78A97CD0","assaultsmg":"0xEFE7E2DF","combatpdw":"0xA3D4D34","machinepistol":"0xDB1AA450","minismg":"0xBD248B55","raycarbine":"0x476BF155"},"shotguns":{"pumpshotgun":"0x1D073A89","pumpshotgun_mk2":"0x555AF99A","sawnoffshotgun":"0x7846A318","assaultshotgun":"0xE284C527","bullpupshotgun":"0x9D61E50F","musket":"0xA89CB99E","heavyshotgun":"0x3AABBBAA","dbshotgun":"0xEF951FBB","autoshotgun":"0x12E82D3D"},"assault_rifles":{"assaultrifle":"0xBFEFFF6D","assaultrifle_mk2":"0x394F415C","carbinerifle":"0x83BF0278","carbinerifle_mk2":"0xFAD1F1C9","advancedrifle":"0xAF113F99","specialcarbine":"0xC0A3098D","specialcarbine_mk2":"0x969C3D67","bullpuprifle":"0x7F229F94","bullpuprifle_mk2":"0x84D6FAFD","compactrifle":"0x624FE830"},"machine_guns":{"mg":"0x9D07F764","combatmg":"0x7FD62962","combatmg_mk2":"0xDBBD7280","gusenberg":"0x61012683"},"sniper_rifles":{"sniperrifle":"0x5FC3C11","heavysniper":"0xC472FE2","heavysniper_mk2":"0xA914799","marksmanrifle":"0xC734385A","marksmanrifle_mk2":"0x6A6C02E0"},"heavy_weapons":{"rpg":"0xB1CA77B1","grenadelauncher":"0xA284510B","grenadelauncher_smoke":"0x4DD2DC56","minigun":"0x42BF8A85","firework":"0x7F7497E5","railgun":"0x6D544C99","hominglauncher":"0x63AB0442","compactlauncher":"0x781FE4A","rayminigun":"0xB62D1F67"},"throwables":{"grenade":"0x93E220BD","bzgas":"0xA0973D5E","smokegrenade":"0xFDBC8A50","flare":"0x497FACC3","molotov":"0x24B17070","stickybomb":"0x2C3731D9","proxmine":"0xAB564B93","snowball":"0x787F0BB","pipebomb":"0xBA45E8B8","ball":"0x23C9F95C"},"misc":{"petrolcan":"0x34A67B97","fireextinguisher":"0x60EC506","parachute":"0xFBAB5776"}}')
local vehiclesCars = {0,1,2,3,4,5,6,7,8,9,10,11,12,17,18,19,20};

local jobTitle = nil
local gradeName = nil
local jobName = nil
local shouldShowSocietyMoney = false
local IsPlayerInVehicle = false


TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

-- PLAYER SPAWN AND JOB HANDLE
AddEventHandler('onClientMapStart', function()
	SendNUIMessage({ action = 'ui', config = Config.ui })
	SendNUIMessage({ action = 'setFont', url = Config.font.url, name = Config.font.name })
end)

AddEventHandler('playerSpawned', function()
	HideHudComponentThisFrame(7) -- Area
	HideHudComponentThisFrame(9) -- Street
	HideHudComponentThisFrame(6) -- Vehicle
	HideHudComponentThisFrame(3) -- SP Cash
	HideHudComponentThisFrame(4) -- MP Cash
	HideHudComponentThisFrame(13) -- Cash changes!
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	if xPlayer.job.label == xPlayer.job.grade_label then
		jobTitle = xPlayer.job.grade_label
	else
		jobTitle = xPlayer.job.label .. ': ' .. xPlayer.job.grade_label
	end
	gradeName = xPlayer.job.grade_name
	jobName = xPlayer.job.name
	
	HandleJobChange(gradeName)
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(playerJob)
	if playerJob.label == playerJob.grade_label then
		jobTitle = playerJob.grade_label
	else
		jobTitle = playerJob.label .. ': ' .. playerJob.grade_label
	end
	gradeName = playerJob.grade_name
	jobName = playerJob.name

	HandleJobChange(gradeName)
end)

-- JOBS HANDLE
function HandleJobChange (gradeName)
	-- SendNUIMessage({ action = 'setText', id = 'job', value = job })
	
	
	if gradeName == 'boss' or gradeName == 'lowerboss1' or gradeName == 'lowerboss2' or gradeName == 'lowerboss3' then
		shouldShowSocietyMoney = true
		SendNUIMessage({ action = 'element', task = 'enable', value = 'society' })
	else
		shouldShowSocietyMoney = false
		SendNUIMessage({ action = 'element', task = 'disable', value = 'society' })
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10000)
		
		if shouldShowSocietyMoney then
			ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
				SendNUIMessage({ action = 'setMoney', id = 'society', value = money })
			end, jobName)
		end
	end
end)

-- Hides TREW UI when it's on Pause Menu
Citizen.CreateThread(function()
    local isPauseMenu = false

	while true do
		Citizen.Wait(0)

		if IsPauseMenuActive() then -- ESC Key
			if not isPauseMenu then
				isPauseMenu = not isPauseMenu
				SendNUIMessage({ action = 'toggleUi', value = false })
			end
		else
			if isPauseMenu then
				isPauseMenu = not isPauseMenu
				SendNUIMessage({ action = 'toggleUi', value = true })
			end

			HideHudComponentThisFrame(1)  -- Wanted Stars
			HideHudComponentThisFrame(2)  -- Weapon Icon
			HideHudComponentThisFrame(3)  -- Cash
			HideHudComponentThisFrame(4)  -- MP Cash
			HideHudComponentThisFrame(6)  -- Vehicle Name
			HideHudComponentThisFrame(7)  -- Area Name
			HideHudComponentThisFrame(8)  -- Vehicle Class
			HideHudComponentThisFrame(9)  -- Street Name
			HideHudComponentThisFrame(13) -- Cash Change
			HideHudComponentThisFrame(17) -- Save Game
			HideHudComponentThisFrame(20) -- Weapon Stats
		end
	end
end)

-- Vehicle Info
local vehicleCruiser
local vehicleSignalIndicator = 'off'
local seatbeltIsOn = false
local shouldDisableBelt = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if shouldDisableBelt then
			DisableControlAction(0, 75)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2000)

		if IsPlayerInVehicle then
			local blazer5 = -1590337689
			local player = GetPlayerPed(-1)
			local vehicle = GetVehiclePedIsIn(player, false)
			local entityModel = GetEntityModel(vehicle)
			if entityModel == blazer5 then
				DisableVehicleWeapon(true, -335937730, vehicle, player)
			end
		end
	end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)

		if IsPlayerInVehicle then
			local player = GetPlayerPed(-1)
			local vehicle = GetVehiclePedIsIn(player, false)
			local vehicleIsOn = GetIsVehicleEngineRunning(vehicle)
			local vehicleInfo	
			if vehicleIsOn then
				local vehicleClass = GetVehicleClass(vehicle)

				if Config.ui.showMinimap == false then
					DisplayRadar(true)
				end

				-- Vehicle Speed
				local vehicleSpeedSource = GetEntitySpeed(vehicle)
				local vehicleSpeed
				if Config.vehicle.speedUnit == 'MPH' then
					vehicleSpeed = math.ceil(vehicleSpeedSource * 2.237)
				else
					vehicleSpeed = math.ceil(vehicleSpeedSource * 3.6)
				end

				-- Vehicle Gradient Speed
				local vehicleNailSpeed

				if vehicleSpeed > Config.vehicle.maxSpeed then
					vehicleNailSpeed = math.ceil(  280 - math.ceil( math.ceil(Config.vehicle.maxSpeed * 205) / Config.vehicle.maxSpeed) )
				else
					vehicleNailSpeed = math.ceil(  280 - math.ceil( math.ceil(vehicleSpeed * 205) / Config.vehicle.maxSpeed) )
				end
				
				-- Vehicle Fuel and Gear
				local vehicleFuel
				local isElectric = false
				vehicleFuel = GetVehicleFuelLevel(vehicle)

				for k,v in ipairs(Config.ElectroCars) do
					if GetHashKey(v) == GetEntityModel(vehicle) then
						isElectric = true
					end
				end

				local vehicleGear = GetVehicleCurrentGear(vehicle)

				if (vehicleSpeed == 0 and vehicleGear == 0) or (vehicleSpeed == 0 and vehicleGear == 1) then
					vehicleGear = 'N'
				elseif vehicleSpeed > 0 and vehicleGear == 0 then
					vehicleGear = 'R'
				end

				if isElectric then
					vehicleGear = 'A'
				end

				-- Vehicle Lights
				local vehicleVal,vehicleLights,vehicleHighlights  = GetVehicleLightsState(vehicle)
				local vehicleIsLightsOn
				if vehicleLights == 1 and vehicleHighlights == 0 then
					vehicleIsLightsOn = 'normal'
				elseif (vehicleLights == 1 and vehicleHighlights == 1) or (vehicleLights == 0 and vehicleHighlights == 1) then
					vehicleIsLightsOn = 'high'
				else
					vehicleIsLightsOn = 'off'
				end

				-- Vehicle Siren
				local vehicleSiren

				if IsVehicleSirenOn(vehicle) then
					vehicleSiren = true
				else
					vehicleSiren = false
				end

				SetPedConfigFlag(PlayerPedId(), 35, false)
				SetPedConfigFlag(PlayerPedId(), 32, false)

				if has_value(vehiclesCars, vehicleClass) == true and vehicleClass ~= 8 then
	
					if not seatbeltIsOn then
						shouldDisableBelt = false
					else
						shouldDisableBelt = true
					end
				end

				vehicleInfo = {
					action = 'updateVehicle',

					status = true,
					speed = vehicleSpeed,
					nail = vehicleNailSpeed,
					gear = vehicleGear,
					fuel = vehicleFuel,
					isElectric = isElectric,
					lights = vehicleIsLightsOn,
					signals = vehicleSignalIndicator,
					cruiser = vehicleCruiser,
					type = vehicleClass,
					siren = vehicleSiren,
					seatbelt = {},

					config = {
						speedUnit = Config.vehicle.speedUnit,
						maxSpeed = Config.vehicle.maxSpeed
					}
				}

				vehicleInfo['seatbelt']['status'] = seatbeltIsOn
			else
				vehicleCruiser = false
				vehicleSignalIndicator = 'off'
				seatbeltIsOn = false

				vehicleInfo = {
					action = 'updateVehicle',
					status = false,
					nail = 0,
					seatbelt = { status = seatbeltIsOn },
					cruiser = vehicleCruiser,
					signals = vehicleSignalIndicator,
					type = 0,
				}

				if Config.ui.showMinimap == false then
					DisplayRadar(false)
				end
			end

			SendNUIMessage(vehicleInfo)
		else
			DisplayRadar(false)
			shouldDisableBelt = false
		end
	end
end)

-- Player status

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10000)
		local playerStatus 
		local showPlayerStatus = 0
		playerStatus = { action = 'setStatus', status = {} }
	
		if Config.ui.showHunger == true then
			showPlayerStatus = (showPlayerStatus+1)
	
			TriggerEvent('esx_status:getStatus', 'hunger', function(status)
				playerStatus['status'][showPlayerStatus] = {
					name = 'hunger',
					value = math.floor(100-status.getPercent())
				}
			end)
	
		end
	
		if Config.ui.showThirst == true then
			showPlayerStatus = (showPlayerStatus+1)
	
			TriggerEvent('esx_status:getStatus', 'thirst', function(status)
				playerStatus['status'][showPlayerStatus] = {
					name = 'thirst',
					value = math.floor(100-status.getPercent())
				}
			end)
		end
		
		if showPlayerStatus > 0 then
			SendNUIMessage(playerStatus)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)

		local playerStatus 
		local showPlayerStatus = 0
		playerStatus = { action = 'setStatus', status = {} }

		if Config.ui.showHealth == true then
			showPlayerStatus = (showPlayerStatus+1)

			playerStatus['isdead'] = false
			local playerPed = GetPlayerPed(-1)
			local maxHealth = GetEntityMaxHealth(playerPed)
			local health = GetEntityHealth(GetPlayerPed(-1))

			playerStatus['status'][showPlayerStatus] = {
				name = 'health',
				value = (health / maxHealth) * 100
			}

			if IsEntityDead(GetPlayerPed(-1)) then
				playerStatus.isdead = true
			end
		end

		if Config.ui.showArmor == true then
			showPlayerStatus = (showPlayerStatus+1)

			playerStatus['status'][showPlayerStatus] = {
				name = 'armor',
				value = GetPedArmour(GetPlayerPed(-1)),
			}
		end

		if Config.ui.showStamina == true then
			showPlayerStatus = (showPlayerStatus+1)

			playerStatus['status'][showPlayerStatus] = {
				name = 'stamina',
				value = 100 - GetPlayerSprintStaminaRemaining(PlayerId()),
			}
		end
	
		if showPlayerStatus > 0 then
			SendNUIMessage(playerStatus)
		end
	end
end)

-- Weapons
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)

		local player = GetPlayerPed(-1)
		local status = {}

		if IsPedArmed(player, 7) then

			local weapon = GetSelectedPedWeapon(player)
			local ammoTotal = GetAmmoInPedWeapon(player,weapon)
			local bool,ammoClip = GetAmmoInClip(player,weapon)
			local ammoRemaining = math.floor(ammoTotal - ammoClip)
			
			status['armed'] = true

			for key,value in pairs(AllWeapons) do

				for keyTwo,valueTwo in pairs(AllWeapons[key]) do
					if weapon == GetHashKey('weapon_'..keyTwo) then
						status['weapon'] = keyTwo


						if key == 'melee' then
							SendNUIMessage({ action = 'element', task = 'disable', value = 'weapon_bullets' })
							SendNUIMessage({ action = 'element', task = 'disable', value = 'bullets' })
						else
							if keyTwo == 'stungun' then
								SendNUIMessage({ action = 'element', task = 'disable', value = 'weapon_bullets' })
								SendNUIMessage({ action = 'element', task = 'disable', value = 'bullets' })
							else
								SendNUIMessage({ action = 'element', task = 'enable', value = 'weapon_bullets' })
								SendNUIMessage({ action = 'element', task = 'enable', value = 'bullets' })
							end
						end

					end
				end

			end

			SendNUIMessage({ action = 'setText', id = 'weapon_clip', value = ammoClip })
			SendNUIMessage({ action = 'setText', id = 'weapon_ammo', value = ammoRemaining })

		else
			status['armed'] = false	
		end

		SendNUIMessage({ action = 'updateWeapon', status = status })

	end
end)

RegisterCommand("omz", function(source, args)
	local speed = args[1]
	local player = GetPlayerPed(-1)
	local vehicle = GetVehiclePedIsIn(player, false)
	local vehicleClass = GetVehicleClass(vehicle)
	local hasVehicleClassValue = has_value(vehiclesCars, vehicleClass) == true

	if hasVehicleClassValue and GetPedInVehicleSeat(vehicle, -1) == player then
		if not speed then
			vehicleCruiser = 'off'
			SetEntityMaxSpeed(vehicle, GetVehicleHandlingFloat(vehicle,"CHandlingData","fInitialDriveMaxFlatVel"))
		else
			vehicleCruiser = 'on'
			SetEntityMaxSpeed(vehicle, tonumber(speed / 3.6))
			Wait(1000)
			SetEntityMaxSpeed(vehicle, tonumber(speed / 3.6))
		end
	end
end)

RegisterCommand("changeCruiser", function(source, args)
	if IsPlayerInVehicle then
		local player = GetPlayerPed(-1)
		local vehicle = GetVehiclePedIsIn(player, false)
		local vehicleClass = GetVehicleClass(vehicle)
		local hasVehicleClassValue = has_value(vehiclesCars, vehicleClass) == true
		if hasVehicleClassValue then
			if GetPedInVehicleSeat(vehicle, -1) == player then
				local vehicleSpeedSource = GetEntitySpeed(vehicle)

				if vehicleCruiser == 'on' then
					vehicleCruiser = 'off'
					SetEntityMaxSpeed(vehicle, GetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveMaxFlatVel"))
				else
					vehicleCruiser = 'on'
					SetEntityMaxSpeed(vehicle, vehicleSpeedSource)
				end
			end
		end
	end
end)
RegisterKeyMapping('changeCruiser', 'Omezovac rychlosti', 'keyboard', '')

-- Everything that neededs to be at WAIT 0
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if IsPlayerInVehicle then
			local player = GetPlayerPed(-1)
			local vehicle = GetVehiclePedIsIn(player, false)
			local vehicleClass = GetVehicleClass(vehicle)
			local hasVehicleClassValue = has_value(vehiclesCars, vehicleClass) == true

			-- Vehicle Seatbelt
			if GetIsVehicleEngineRunning(vehicle) then
				if IsControlJustReleased(0, Keys[Config.vehicle.keys.seatbelt]) and hasVehicleClassValue and vehicleClass ~= 8 then
					seatbeltIsOn = not seatbeltIsOn
				end
			else
				seatbeltIsOn = false
				shouldDisableBelt = false
			end

			-- Vehicle Signal Lights
			if IsControlPressed(1, Keys['LEFTSHIFT']) and hasVehicleClassValue then
				if IsControlJustPressed(1, Keys[Config.vehicle.keys.signalLeft]) then
					if vehicleSignalIndicator == 'off' then
						vehicleSignalIndicator = 'left'
					else
						vehicleSignalIndicator = 'off'
					end
				end

				if IsControlJustPressed(1, Keys[Config.vehicle.keys.signalRight]) then
					if vehicleSignalIndicator == 'off' then
						vehicleSignalIndicator = 'right'
					else
						vehicleSignalIndicator = 'off'
					end	
				end

				if IsControlJustPressed(1, Keys[Config.vehicle.keys.signalBoth]) then
					if vehicleSignalIndicator == 'off' then
						vehicleSignalIndicator = 'both'
					else
						vehicleSignalIndicator = 'off'
					end
				end

				TriggerEvent('trew_hud_ui:setCarSignalLights', vehicleSignalIndicator)
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2000)
		local player = GetPlayerPed(-1)
		local prevValue = IsPlayerInVehicle
		IsPlayerInVehicle = IsPedInAnyVehicle(player, false)

		if prevValue == true and IsPlayerInVehicle == false then
			SendNUIMessage({
				action = 'updateVehicle',
				status = false,
				nail = 0,
				seatbelt = { status = false },
				cruiser = false,
				signals = 'off',
				type = 0,
			})
		end
	end
end)

-- CAR LIGHTS
AddEventHandler('trew_hud_ui:setCarSignalLights', function(status)
	local driver = GetVehiclePedIsIn(GetPlayerPed(-1), false)
	local hasTrailer,vehicleTrailer = GetVehicleTrailerVehicle(driver,vehicleTrailer)
	local leftLight
	local rightLight

	if status == 'left' then
		leftLight = false
		rightLight = true
		if hasTrailer then driver = vehicleTrailer end
	elseif status == 'right' then
		leftLight = true
		rightLight = false
		if hasTrailer then driver = vehicleTrailer end
	elseif status == 'both' then
		leftLight = true
		rightLight = true
		if hasTrailer then driver = vehicleTrailer end
	else
		leftLight = false
		rightLight = false
		if hasTrailer then driver = vehicleTrailer end
	end

	TriggerServerEvent('trew_hud_ui:syncCarLights', status)

	SetVehicleIndicatorLights(driver, 0, leftLight)
	SetVehicleIndicatorLights(driver, 1, rightLight)
end)

RegisterNetEvent('trew_hud_ui:syncCarLights')
AddEventHandler('trew_hud_ui:syncCarLights', function(driver, status)

	if GetPlayerFromServerId(driver) ~= PlayerId() then
		local driver = GetVehiclePedIsIn(GetPlayerPed(GetPlayerFromServerId(driver)), false)

		if status == 'left' then
			leftLight = false
			rightLight = true

		elseif status == 'right' then
			leftLight = true
			rightLight = false

		elseif status == 'both' then
			leftLight = true
			rightLight = true

		else
			leftLight = false
			rightLight = false
		end

		SetVehicleIndicatorLights(driver, 0, leftLight)
		SetVehicleIndicatorLights(driver, 1, rightLight)
	end
end)

-- UTIL
function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

-- NOT USED
exports('createStatus', function(args)
	local statusCreation = { action = 'createStatus', status = args['status'], color = args['color'], icon = args['icon'] }
	SendNUIMessage(statusCreation)
end)

exports('setStatus', function(args)
	local playerStatus = { action = 'setStatus', status = {
		{ name = args['name'], value = args['value'] }
	}}
	SendNUIMessage(playerStatus)
end)

RegisterCommand("fbanka", function()
	SendNUIMessage({ action = 'fbanka' })
end)