local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local PlayerData              = {}
local HasAlreadyEnteredMarker = false
local LastStation             = nil
local LastPart                = nil
local LastPartNum             = nil
local LastEntity              = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local IsHandcuffed            = false
local HandcuffTimer           = nil
local IsDragged               = false
local CopPed                  = 0
local hasAlreadyJoined        = false
local blipsCops               = {}
local isDead                  = false
local CurrentTask             = {}

ESX                           = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
end)

function SetVehicleMaxMods(vehicle)
	local props = {
		modEngine       = 2,
		modBrakes       = 2,
		modTransmission = 2,
		modSuspension   = 3,
		modTurbo        = true,
	}

	ESX.Game.SetVehicleProperties(vehicle, props)
end

function cleanPlayer(playerPed)
	SetPedArmour(playerPed, 0)
	ClearPedBloodDamage(playerPed)
	ResetPedVisibleDamage(playerPed)
	ClearPedLastWeaponDamage(playerPed)
	ResetPedMovementClipset(playerPed, 0)
end

function setUniform(job, playerPed)
  TriggerEvent('skinchanger:getSkin', function(skin)

	if skin.sex == 0 then
	  if Config.Uniforms[job].male ~= nil then
		TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].male)
	  else
		ESX.ShowNotification(_U('no_outfit'))
	  end
	  if job == 'bullet_wear' then
		SetPedArmour(playerPed, 100)
	  end
	else
	  if Config.Uniforms[job].female ~= nil then
		TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].female)
	  else
		ESX.ShowNotification(_U('no_outfit'))
	  end
	  if job == 'bullet_wear' then
		SetPedArmour(playerPed, 100)
	  end
	end

  end)
end

function OpenCloakroomMenu()

  local elements = {
	{label = _U('citizen_wear'), value = 'citizen_wear'},
	{label = _U('state_wear'), value = 'state_wear'},
	{label = 'Neprustrelna vesta', value = 'bullet_wear'},
  }

  ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
	  'default', GetCurrentResourceName(), 'cloakroom',
	  {
		title    = _U('cloakroom'),
		align    = 'top-left',
		elements = elements,
		},

		function(data, menu)

	  menu.close()

	  --Taken from SuperCoolNinja
		if data.current.value == 'citizen_wear' then
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				local model = nil

				if skin.sex == 0 then
					model = GetHashKey("mp_m_freemode_01")
				else
					model = GetHashKey("mp_f_freemode_01")
				end

				RequestModel(model)
				while not HasModelLoaded(model) do
					RequestModel(model)
					Citizen.Wait(1)
				end

				SetPlayerModel(PlayerId(), model)
				SetModelAsNoLongerNeeded(model)

				TriggerEvent('skinchanger:loadSkin', skin)
				TriggerEvent('esx:restoreLoadout')
			end)
		end

		if data.current.value == 'bullet_wear' then
			SetPedArmour(GetPlayerPed(-1), 100)
		end

		if data.current.value == 'state_wear' then
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				if skin.sex == 0 and Config.StateStations.State.Clothes['male'][PlayerData.job.grade_name] then
					TriggerEvent(
						'skinchanger:loadClothes',
						skin,
						Config.StateStations.State.Clothes['male'][PlayerData.job.grade_name]
					)
				elseif Config.StateStations.State.Clothes['female'][PlayerData.job.grade_name] then
					TriggerEvent(
						'skinchanger:loadClothes',
						skin,
						Config.StateStations.State.Clothes['female'][PlayerData.job.grade_name]
					)
				end
			end)
		end


	  CurrentAction     = 'menu_cloakroom'
	  CurrentActionMsg  = _U('open_cloackroom')
	  CurrentActionData = {}

	end,
	function(data, menu)

	  menu.close()

	  CurrentAction     = 'menu_cloakroom'
	  CurrentActionMsg  = _U('open_cloackroom')
	  CurrentActionData = {}
	end
  )

end

function OpenArmoryMenu(station)

  if Config.EnableArmoryManagement then

	local elements = {
	  {label = _U('remove_object'),  value = 'get_stock'},
	  {label = _U('deposit_object'), value = 'put_stock'}
	}

	if PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name == 'lowerboss1' or PlayerData.job.grade_name == 'highpresident' then
	  table.insert(elements, {label = _U('buy_weapons'), value = 'buy_weapons'})
	  table.insert(elements, {label = _U('get_weapon'), value = 'get_weapon'})
	  table.insert(elements, {label = _U('put_weapon'), value = 'put_weapon'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
	  'default', GetCurrentResourceName(), 'armory',
	  {
		title    = _U('armory'),
		align    = 'top-left',
		elements = elements,
	  },
	  function(data, menu)

		if data.current.value == 'get_weapon' then
		  OpenGetWeaponMenu()
		end

		if data.current.value == 'put_weapon' then
		  OpenPutWeaponMenu()
		end

		if data.current.value == 'buy_weapons' then
		  OpenBuyWeaponsMenu()
		end

		if data.current.value == 'put_stock' then
		  OpenPutStocksMenu()
		end

		if data.current.value == 'get_stock' then
		  OpenGetStocksMenu()
		end

	  end,
	  function(data, menu)

		menu.close()

		CurrentAction     = 'menu_armory'
		CurrentActionMsg  = _U('open_armory')
		CurrentActionData = {station = station}
	  end
	)

  else

	local elements = {}

	for i=1, #Config.StateStations[station].AuthorizedWeapons, 1 do
	  local weapon = Config.StateStations[station].AuthorizedWeapons[i]
	  table.insert(elements, {label = ESX.GetWeaponLabel(weapon.name), value = weapon.name})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
	  'default', GetCurrentResourceName(), 'armory',
	  {
		title    = _U('armory'),
		align    = 'top-left',
		elements = elements,
	  },
	  function(data, menu)
		local weapon = data.current.value
		TriggerServerEvent('esx_statejob:giveWeapon', weapon,  1000)
	  end,
	  function(data, menu)

		menu.close()

		CurrentAction     = 'menu_armory'
		CurrentActionMsg  = _U('open_armory')
		CurrentActionData = {station = station}

	  end
	)

  end

end

function OpenVehicleSpawnerMenu(station, partNum)

  local vehicles = Config.StateStations[station].Vehicles

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
		  align    = 'top-left',
		  elements = elements,
		},
		function(data, menu)

		  menu.close()

		  local vehicleProps = data.current.value
		  local vehicleSpawnPoint = vehicles[partNum].SpawnPoint
		  

		  ESX.Game.SpawnVehicle(vehicleProps.model, vehicleSpawnPoint, 270.0, function(vehicle)
			ESX.Game.SetVehicleProperties(vehicle, vehicleProps)
			local playerPed = GetPlayerPed(-1)
			TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
		  end)

		  TriggerServerEvent('esx_society:removeVehicleFromGarage', 'state', vehicleProps)

		end,
		function(data, menu)

		  menu.close()

		  CurrentAction     = 'menu_vehicle_spawner'
		  CurrentActionMsg  = _U('vehicle_spawner')
		  CurrentActionData = {station = station, partNum = partNum}

		end
	  )

	end, 'state')

  else

	local elements = {}

	for i=1, #Config.StateStations[station].AuthorizedVehicles, 1 do
	  local vehicle = Config.StateStations[station].AuthorizedVehicles[i]
	  table.insert(elements, {label = vehicle.label, value = vehicle.name, type = vehicle.type})
	end

	ESX.UI.Menu.Open(
	  'default', GetCurrentResourceName(), 'vehicle_spawner',
	  {
		title    = _U('vehicle_menu'),
		align    = 'top-left',
		elements = elements,
	  },
	  function(data, menu)

		menu.close()

		local model = data.current.value

		local vehicle = GetClosestVehicle(vehicles[partNum].SpawnPoint.x,  vehicles[partNum].SpawnPoint.y,  vehicles[partNum].SpawnPoint.z,  3.0,  0,  71)

		if not DoesEntityExist(vehicle) then

		  local playerPed = GetPlayerPed(-1)

		  if Config.MaxInService == -1 then

			local spawnPointVeh = vehicles[partNum].SpawnPoint
			local headingVeh = vehicles[partNum].Heading

			if data.current.type == 'heli' then
				spawnPointVeh = vehicles[partNum].SpawnPointHeli
				headingVeh = vehicles[partNum].HeliHeading
			end

			ESX.Game.SpawnVehicle(model, {
			  x = spawnPointVeh.x,
			  y = spawnPointVeh.y,
			  z = spawnPointVeh.z
			}, headingVeh, function(vehicle)
			  TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
			  SetVehicleMaxMods(vehicle)
			end)

		  else

			ESX.TriggerServerCallback('esx_service:enableService', function(canTakeService, maxInService, inServiceCount)

			  if canTakeService then

				ESX.Game.SpawnVehicle(model, {
				  x = vehicles[partNum].SpawnPoint.x,
				  y = vehicles[partNum].SpawnPoint.y,
				  z = vehicles[partNum].SpawnPoint.z
				}, vehicles[partNum].Heading, function(vehicle)
				  TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
				  SetVehicleMaxMods(vehicle)
				end)

			  else
				ESX.ShowNotification(_U('service_max') .. inServiceCount .. '/' .. maxInService)
			  end

			end, 'state')

		  end

		else
		  ESX.ShowNotification(_U('vehicle_out'))
		end

	  end,
	  function(data, menu)

		menu.close()

		CurrentAction     = 'menu_vehicle_spawner'
		CurrentActionMsg  = _U('vehicle_spawner')
		CurrentActionData = {station = station, partNum = partNum}

	  end
	)

  end

end

function OpenstateActionsMenu()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'state_actions',
	{
		title    = 'state',
		align    = 'top-left',
		elements = {
			{label = _U('citizen_interaction'),	value = 'citizen_interaction'},
			{label = _U('vehicle_interaction'),	value = 'vehicle_interaction'},
			-- {label = _U('object_spawner'),		value = 'object_spawner'},
			{label = 'Faktury', value = 'faktury'}
		}
	}, function(data, menu)
		if data.current.value == 'faktury' then
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
			if closestPlayer == -1 or closestDistance > 3.0 then
				exports['mythic_notify']:DoCustomHudText('inform', 'Zadny hrac v okoli', 2500, { ['background-color'] = '#FF0000', ['color'] = '#ffffff' })
			else
				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'Faktury', {
					title = 'Castka'
				}, function(data, menu)
					local amount = tonumber(data.value)

					if amount == nil or amount < 0 then
						ESX.ShowNotification('Neplatna castka')
					else
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if closestPlayer == -1 or closestDistance > 3.0 then
							exports['mythic_notify']:DoCustomHudText('inform', 'Zadny hrac v okoli', 2500, { ['background-color'] = '#FF0000', ['color'] = '#ffffff' })
						else
							menu.close()
							TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_state', 'Vlada', amount)
						end
					end
				end, function(data, menu)
					menu.close()
				end)
			end
	    elseif data.current.value == 'citizen_interaction' then
			local elements = {
				{label = _U('id_card'),			value = 'identity_card'},
				{label = _U('search'),			value = 'body_search'},
				{label = _U('handcuff'),		value = 'handcuff'},
				{label = _U('drag'),			value = 'drag'},
				{label = _U('put_in_vehicle'),	value = 'put_in_vehicle'},
				{label = _U('out_the_vehicle'),	value = 'out_the_vehicle'},
				{label = _U('fine'),			value = 'fine'},
				{label = _U('unpaid_bills'), value = 'unpaid_bills'}
			}
		
			-- if Config.EnableLicenses then
			-- 	table.insert(elements, { label = _U('license_check'), value = 'license' })
			-- end
		
			ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'citizen_interaction',
			{
				title    = _U('citizen_interaction'),
				align    = 'top-left',
				elements = elements
			}, function(data2, menu2)
				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
				if closestPlayer ~= -1 and closestDistance <= 3.0 then
					local action = data2.current.value

					if action == 'identity_card' then
						OpenIdentityCardMenu(closestPlayer)
					elseif action == 'body_search' then
						OpenBodySearchMenu(closestPlayer)
					elseif action == 'handcuff' then
						TriggerServerEvent('esx_statejob:handcuff', GetPlayerServerId(closestPlayer))
					elseif action == 'drag' then
						TriggerServerEvent('esx_statejob:drag', GetPlayerServerId(closestPlayer))
					elseif action == 'put_in_vehicle' then
						TriggerServerEvent('esx_statejob:putInVehicle', GetPlayerServerId(closestPlayer))
					elseif action == 'out_the_vehicle' then
						TriggerServerEvent('esx_statejob:OutVehicle', GetPlayerServerId(closestPlayer))
					elseif action == 'fine' then
						OpenFineMenu(closestPlayer)
					elseif action == 'license' then
						ShowPlayerLicense(closestPlayer)
					elseif action == 'unpaid_bills' then
						OpenUnpaidBillsMenu(closestPlayer)
					end

				else
					ESX.ShowNotification(_U('no_players_nearby'))
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		elseif data.current.value == 'vehicle_interaction' then
			local elements = {}
			local playerPed = PlayerPedId()
			local coords    = GetEntityCoords(playerPed)
			local vehicle   = ESX.Game.GetVehicleInDirection()
			
			if DoesEntityExist(vehicle) then
				-- table.insert(elements, {label = _U('vehicle_info'),	value = 'vehicle_infos'})
				table.insert(elements, {label = _U('pick_lock'),	value = 'hijack_vehicle'})
				table.insert(elements, {label = _U('impound'),		value = 'impound'})
			end
			
			--table.insert(elements, {label = _U('search_database'), value = 'search_database'})

			ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'vehicle_interaction',
			{
				title    = _U('vehicle_interaction'),
				align    = 'top-left',
				elements = elements
			}, function(data2, menu2)
				coords    = GetEntityCoords(playerPed)
				vehicle   = ESX.Game.GetVehicleInDirection()
				action    = data2.current.value
				
				if action == 'search_database' then
					LookupVehicle()
				elseif DoesEntityExist(vehicle) then
					local vehicleData = ESX.Game.GetVehicleProperties(vehicle)
					if action == 'vehicle_infos' then
						OpenVehicleInfosMenu(vehicleData)
						
					elseif action == 'hijack_vehicle' then
						if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 3.0) then
							TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
							Citizen.Wait(20000)
							ClearPedTasksImmediately(playerPed)

							SetVehicleDoorsLocked(vehicle, 1)
							SetVehicleDoorsLockedForAllPlayers(vehicle, false)
							ESX.ShowNotification(_U('vehicle_unlocked'))
						end
					elseif action == 'impound' then
					
						-- is the script busy?
						if CurrentTask.Busy then
							return
						end
						
						SetTextComponentFormat('STRING')
						AddTextComponentString(_U('impound_prompt'))
						DisplayHelpTextFromStringLabel(0, 0, 1, -1)
						
						TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
						
						CurrentTask.Busy = true
						CurrentTask.Task = ESX.SetTimeout(10000, function()
							ClearPedTasks(playerPed)
							ImpoundVehicle(vehicle)
							Citizen.Wait(100) -- sleep the entire script to let stuff sink back to reality
						end)
						
						-- keep track of that vehicle!
						Citizen.CreateThread(function()
							while CurrentTask.Busy do
								Citizen.Wait(1000)
							
								vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 3.0, 0, 71)
								if not DoesEntityExist(vehicle) and CurrentTask.Busy then
									ESX.ShowNotification(_U('impound_canceled_moved'))
									ESX.ClearTimeout(CurrentTask.Task)
									ClearPedTasks(playerPed)
									CurrentTask.Busy = false
									break
								end
							end
						end)
					end
				else
					ESX.ShowNotification(_U('no_vehicles_nearby'))
				end

			end, function(data2, menu2)
				menu2.close()
			end
			)

		elseif data.current.value == 'object_spawner' then
			ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'citizen_interaction',
			{
				title    = _U('traffic_interaction'),
				align    = 'top-left',
				elements = {
					{label = _U('cone'),		value = 'prop_mp_cone_02'},
					{label = _U('barrier'),		value = 'prop_barrier_work06a'},
					{label = _U('spikestrips'),	value = 'p_ld_stinger_s'},
					{label = _U('box'),			value = 'prop_boxpile_07d'},
					{label = _U('cash'),		value = 'hei_prop_cash_crate_half_full'}
				}
			}, function(data2, menu2)
				local model     = data2.current.value
				local playerPed = PlayerPedId()
				local coords    = GetEntityCoords(playerPed)
				local forward   = GetEntityForwardVector(playerPed)
				local x, y, z   = table.unpack(coords + forward * 1.0)

				if model == 'prop_mp_cone_02' then
					z = z - 2.0
				end

				ESX.Game.SpawnObject(model, {
					x = x,
					y = y,
					z = z
				}, function(obj)
					SetEntityHeading(obj, GetEntityHeading(playerPed))
					PlaceObjectOnGroundProperly(obj)
				end)

			end, function(data2, menu2)
				menu2.close()
			end)
		end

	end, function(data, menu)
		menu.close()
	end)
end

function OpenIdentityCardMenu(player)

  if Config.EnableESXIdentity then

	ESX.TriggerServerCallback('esx_statejob:getOtherPlayerData', function(data)

	  local jobLabel    = nil
	  local sexLabel    = nil
	  local sex         = nil
	  local dobLabel    = nil
	  local heightLabel = nil
	  local idLabel     = nil

	  if data.job.grade_label ~= nil and  data.job.grade_label ~= '' then
		jobLabel = 'Job: ' .. data.job.label .. ' - ' .. data.job.grade_label
	  else
		jobLabel = 'Job: ' .. data.job.label
	  end

	  if data.sex ~= nil then
		if (data.sex == 'm') or (data.sex == 'M') then
		  sex = 'Male'
		else
		  sex = 'Female'
		end
		sexLabel = 'Sex: ' .. sex
	  else
		sexLabel = 'Sex: Unknown'
	  end

	  if data.dob ~= nil then
		dobLabel = 'DOB: ' .. data.dob
	  else
		dobLabel = 'DOB: Unknown'
	  end

	  if data.height ~= nil then
		heightLabel = 'Height: ' .. data.height
	  else
		heightLabel = 'Height: Unknown'
	  end

	  if data.name ~= nil then
		idLabel = 'ID: ' .. data.name
	  else
		idLabel = 'ID: Unknown'
	  end

	  local elements = {
		{label = _U('name', data.firstname .. ' ' .. data.lastname), value = nil},
		{label = sexLabel,    value = nil},
		{label = dobLabel,    value = nil},
		{label = heightLabel, value = nil},
		{label = idLabel,     value = nil},
	  }

	  if data.drunk ~= nil then
		table.insert(elements, {label = _U('bac', data.drunk), value = nil})
	  end

	  if data.licenses ~= nil then

		table.insert(elements, {label = '--- Licenses ---', value = nil})

		for i=1, #data.licenses, 1 do
		  table.insert(elements, {label = data.licenses[i].label, value = nil})
		end

	  end

	  ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'citizen_interaction',
		{
		  title    = _U('citizen_interaction'),
		  align    = 'top-left',
		  elements = elements,
		},
		function(data, menu)

		end,
		function(data, menu)
		  menu.close()
		end
	  )

	end, GetPlayerServerId(player))

  else

	ESX.TriggerServerCallback('esx_statejob:getOtherPlayerData', function(data)

	  local jobLabel = nil

	  if data.job.grade_label ~= nil and  data.job.grade_label ~= '' then
		jobLabel = 'Job: ' .. data.job.label .. ' - ' .. data.job.grade_label
	  else
		jobLabel = 'Job: ' .. data.job.label
	  end

		local elements = {
		  {label = _U('name') .. data.name, value = nil},
		  {label = jobLabel,              value = nil},
		}

	  if data.drunk ~= nil then
		table.insert(elements, {label = _U('bac') .. data.drunk .. '%', value = nil})
	  end

	  if data.licenses ~= nil then

		table.insert(elements, {label = '--- Licenses ---', value = nil})

		for i=1, #data.licenses, 1 do
		  table.insert(elements, {label = data.licenses[i].label, value = nil})
		end

	  end

	  ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'citizen_interaction',
		{
		  title    = _U('citizen_interaction'),
		  align    = 'top-left',
		  elements = elements,
		},
		function(data, menu)

		end,
		function(data, menu)
		  menu.close()
		end
	  )

	end, GetPlayerServerId(player))

  end

end

function OpenBodySearchMenu(player)

  ESX.TriggerServerCallback('esx_statejob:getOtherPlayerData', function(data)

	local elements = {}

	local blackMoney = 0

	for i=1, #data.accounts, 1 do
	  if data.accounts[i].name == 'black_money' then
		blackMoney = data.accounts[i].money
	  end
	end

	table.insert(elements, {
	  label          = _U('confiscate_dirty', blackMoney),
	  value          = 'black_money',
	  itemType       = 'item_account',
	  amount         = blackMoney
	})

	table.insert(elements, {label = _U('guns_label'), value = nil})

	for i=1, #data.weapons, 1 do
	  table.insert(elements, {
		label          = _U('confiscate', ESX.GetWeaponLabel(data.weapons[i].name)),
		value          = data.weapons[i].name,
		itemType       = 'item_weapon',
		amount         = data.ammo,
	  })
	end

	table.insert(elements, {label = _U('inventory_label'), value = nil})

	for i=1, #data.inventory, 1 do
	  if data.inventory[i].count > 0 then
		table.insert(elements, {
		  label          = _U('confiscate_inv', data.inventory[i].count, data.inventory[i].label),
		  value          = data.inventory[i].name,
		  itemType       = 'item_standard',
		  amount         = data.inventory[i].count,
		})
	  end
	end


	ESX.UI.Menu.Open(
	  'default', GetCurrentResourceName(), 'body_search',
	  {
		title    = _U('search'),
		align    = 'top-left',
		elements = elements,
	  },
	  function(data, menu)

		local itemType = data.current.itemType
		local itemName = data.current.value
		local amount   = data.current.amount

		if data.current.value ~= nil then

		  TriggerServerEvent('esx_statejob:confiscatePlayerItem', GetPlayerServerId(player), itemType, itemName, amount)

		  OpenBodySearchMenu(player)

		end

	  end,
	  function(data, menu)
		menu.close()
	  end
	)

  end, GetPlayerServerId(player))

end

function OpenFineMenu(player)

  ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'fine',
	{
	  title    = _U('fine'),
	  align    = 'top-left',
	  elements = {
		{label = _U('traffic_offense'),   value = 0},
		{label = _U('minor_offense'),     value = 1},
		{label = _U('average_offense'),   value = 2},
		{label = _U('major_offense'),     value = 3}
	  },
	},
	function(data, menu)

	  OpenFineCategoryMenu(player, data.current.value)

	end,
	function(data, menu)
	  menu.close()
	end
  )

end

function OpenFineCategoryMenu(player, category)

  ESX.TriggerServerCallback('esx_statejob:getFineList', function(fines)

	local elements = {}

	for i=1, #fines, 1 do
	  table.insert(elements, {
		label     = fines[i].label .. ' $' .. fines[i].amount,
		value     = fines[i].id,
		amount    = fines[i].amount,
		fineLabel = fines[i].label
	  })
	end

	ESX.UI.Menu.Open(
	  'default', GetCurrentResourceName(), 'fine_category',
	  {
		title    = _U('fine'),
		align    = 'top-left',
		elements = elements,
	  },
	  function(data, menu)

		local label  = data.current.fineLabel
		local amount = data.current.amount

		menu.close()

		if Config.EnablePlayerManagement then
		  TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_police', _U('fine_total', label), amount)
		else
		  TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), '', _U('fine_total', label), amount)
		end

		ESX.SetTimeout(300, function()
		  OpenFineCategoryMenu(player, category)
		end)

	  end,
	  function(data, menu)
		menu.close()
	  end
	)

  end, category)

end

function LookupVehicle()
	ESX.UI.Menu.Open(
	'dialog', GetCurrentResourceName(), 'lookup_vehicle',
	{
		title = _U('search_database_title'),
	}, function (data, menu)
		local length = string.len(data.value)
		if data.value == nil or length < 8 or length > 13 then
			ESX.ShowNotification(_U('search_database_error_invalid'))
		else
			ESX.TriggerServerCallback('esx_statejob:getVehicleFromPlate', function(owner, found)
				if found then
					ESX.ShowNotification(_U('search_database_found', owner))
				else
					ESX.ShowNotification(_U('search_database_error_not_found'))
				end
			end, data.value)
			menu.close()
		end
	end, function (data, menu)
		menu.close()
	end
	)
end

function ShowPlayerLicense(player)
	local elements = {}
	local targetName
	ESX.TriggerServerCallback('esx_statejob:getOtherPlayerData', function(data)
		if data.licenses ~= nil then
			for i=1, #data.licenses, 1 do
				if data.licenses[i].label ~= nil and data.licenses[i].type ~= nil then
					table.insert(elements, {label = data.licenses[i].label, value = data.licenses[i].type})
				end
			end
		end
		
		if Config.EnableESXIdentity then
			targetName = data.firstname .. ' ' .. data.lastname
		else
			targetName = data.name
		end
		
		ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'manage_license',
		{
			title    = _U('license_revoke'),
			align    = 'top-left',
			elements = elements,
		},
		function(data, menu)
			ESX.ShowNotification(_U('licence_you_revoked', data.current.label, targetName))
			TriggerServerEvent('esx_statejob:message', GetPlayerServerId(player), _U('license_revoked', data.current.label))
			
			TriggerServerEvent('esx_license:removeLicense', GetPlayerServerId(player), data.current.value)
			
			ESX.SetTimeout(300, function()
				ShowPlayerLicense(player)
			end)
		end,
		function(data, menu)
			menu.close()
		end
		)

	end, GetPlayerServerId(player))
end

function OpenUnpaidBillsMenu(player)
	local elements = {}

	ESX.TriggerServerCallback('esx_billing:getTargetBills', function(bills)
		for k,bill in ipairs(bills) do
			table.insert(elements, {
				label = ('%s - <span style="color:red;">%s</span>'):format(bill.label, _U('armory_item', ESX.Math.GroupDigits(bill.amount))),
				billId = bill.id
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'billing', {
			title    = _U('unpaid_bills'),
			align    = 'top-left',
			elements = elements
		}, nil, function(data, menu)
			menu.close()
		end)
	end, GetPlayerServerId(player))
end

function OpenVehicleInfosMenu(vehicleData)

  ESX.TriggerServerCallback('esx_statejob:getVehicleInfos', function(infos)

	local elements = {}

	table.insert(elements, {label = _U('plate', infos.plate), value = nil})

	if infos.owner == nil then
	  table.insert(elements, {label = _U('owner_unknown'), value = nil})
	else
	  table.insert(elements, {label = _U('owner', infos.owner), value = nil})
	end

	ESX.UI.Menu.Open(
	  'default', GetCurrentResourceName(), 'vehicle_infos',
	  {
		title    = _U('vehicle_info'),
		align    = 'top-left',
		elements = elements,
	  },
	  nil,
	  function(data, menu)
		menu.close()
	  end
	)

  end, vehicleData.plate)

end

function OpenGetWeaponMenu()

  ESX.TriggerServerCallback('esx_statejob:getArmoryWeapons', function(weapons)

	local elements = {}

	for i=1, #weapons, 1 do
	  if weapons[i].count > 0 then
		table.insert(elements, {label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name), value = weapons[i].name})
	  end
	end

	ESX.UI.Menu.Open(
	  'default', GetCurrentResourceName(), 'armory_get_weapon',
	  {
		title    = _U('get_weapon_menu'),
		align    = 'top-left',
		elements = elements,
	  },
	  function(data, menu)

		menu.close()

		ESX.TriggerServerCallback('esx_statejob:removeArmoryWeapon', function()
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
  local playerPed  = PlayerPedId()
  local weaponList = ESX.GetWeaponList()

  for i=1, #weaponList, 1 do

	local weaponHash = GetHashKey(weaponList[i].name)

	if HasPedGotWeapon(playerPed,  weaponHash,  false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
	  --local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
	  table.insert(elements, {label = weaponList[i].label, value = weaponList[i].name})
	end

  end

  ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'armory_put_weapon',
	{
	  title    = _U('put_weapon_menu'),
	  align    = 'top-left',
	  elements = elements,
	},
	function(data, menu)

	  menu.close()

	  ESX.TriggerServerCallback('esx_statejob:addArmoryWeapon', function()
		OpenPutWeaponMenu()
	  end, data.current.value, true)

	end,
	function(data, menu)
	  menu.close()
	end
  )

end

function OpenBuyWeaponsMenu()
	local elements = {}
	local playerPed = PlayerPedId()

	for k,v in ipairs(Config.AuthorizedWeapons) do
		local weaponNum, weapon = ESX.GetWeapon(v.weapon)
		local components, label = {}
		local hasWeapon = HasPedGotWeapon(playerPed, GetHashKey(v.weapon), false)

		if v.components then
			for i=1, #v.components do
				if v.components[i] then
					local component = weapon.components[i]
					local hasComponent = HasPedGotWeaponComponent(playerPed, GetHashKey(v.weapon), component.hash)

					if hasComponent then
						label = ('%s: <span style="color:green;">%s</span>'):format(component.label, _U('armory_owned'))
					else
						if v.components[i] > 0 then
							label = ('%s: <span style="color:green;">%s</span>'):format(component.label, _U('armory_item', ESX.Math.GroupDigits(v.components[i])))
						else
							label = ('%s: <span style="color:green;">%s</span>'):format(component.label, _U('armory_free'))
						end
					end

					table.insert(components, {
						label = label,
						componentLabel = component.label,
						hash = component.hash,
						name = component.name,
						price = v.components[i],
						hasComponent = hasComponent,
						componentNum = i
					})
				end
			end
		end

		if hasWeapon and v.components then
			label = ('%s: <span style="color:green;">></span>'):format(weapon.label)
		elseif hasWeapon and not v.components then
			label = ('%s: <span style="color:green;">%s</span>'):format(weapon.label, _U('armory_owned'))
		else
			if v.price > 0 then
				label = ('%s: <span style="color:green;">%s</span>'):format(weapon.label, _U('armory_item', ESX.Math.GroupDigits(v.price)))
			else
				label = ('%s: <span style="color:green;">%s</span>'):format(weapon.label, _U('armory_free'))
			end
		end

		table.insert(elements, {
			label = label,
			weaponLabel = weapon.label,
			name = weapon.name,
			components = components,
			price = v.price,
			hasWeapon = hasWeapon
		})
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_buy_weapons', {
		title    = _U('armory_weapontitle'),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		if data.current.hasWeapon then
			if #data.current.components > 0 then
				OpenWeaponComponentShop(data.current.components, data.current.name, menu)
			end
		else
			ESX.TriggerServerCallback('esx_statejob:buyWeapon', function(bought)
				if bought then
					if data.current.price > 0 then
						ESX.ShowNotification(_U('armory_bought', data.current.weaponLabel, ESX.Math.GroupDigits(data.current.price)))
					end

					menu.close()
					OpenBuyWeaponsMenu()
				else
					ESX.ShowNotification(_U('armory_money'))
				end
			end, data.current.name, 1)
		end
	end, function(data, menu)
		menu.close()
	end)
end

function OpenWeaponComponentShop(components, weaponName, parentShop)
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_buy_weapons_components', {
		title    = _U('armory_componenttitle'),
		align    = 'top-left',
		elements = components
	}, function(data, menu)
		if data.current.hasComponent then
			ESX.ShowNotification(_U('armory_hascomponent'))
		else
			ESX.TriggerServerCallback('esx_statejob:buyWeapon', function(bought)
				if bought then
					if data.current.price > 0 then
						ESX.ShowNotification(_U('armory_bought', data.current.componentLabel, ESX.Math.GroupDigits(data.current.price)))
					end

					menu.close()
					parentShop.close()
					OpenBuyWeaponsMenu()
				else
					ESX.ShowNotification(_U('armory_money'))
				end
			end, weaponName, 2, data.current.componentNum)
		end
	end, function(data, menu)
		menu.close()
	end)
end

function OpenGetStocksMenu()

  ESX.TriggerServerCallback('esx_statejob:getStockItems', function(items)


	local elements = {}

	for i=1, #items, 1 do
		table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
	end

	ESX.UI.Menu.Open(
	  'default', GetCurrentResourceName(), 'stocks_menu',
	  {
		title    = _U('state_stock'),
		elements = elements
	  },
	  function(data, menu)

		local itemName = data.current.value

		ESX.UI.Menu.Open(
		  'dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count',
		  {
			title = _U('quantity')
		  },
		  function(data2, menu2)

			local count = tonumber(data2.value)

			if count == nil then
			  ESX.ShowNotification(_U('quantity_invalid'))
			else
			  menu2.close()
			  menu.close()

			  TriggerServerEvent('esx_statejob:getStockItem', itemName, count)
			  OpenGetStocksMenu()
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

function OpenPutStocksMenu()

  ESX.TriggerServerCallback('esx_statejob:getPlayerInventory', function(inventory)

	local elements = {}

	for i=1, #inventory.items, 1 do

	  local item = inventory.items[i]

	  if item.count > 0 then
		table.insert(elements, {label = item.label .. ' x' .. item.count, type = 'item_standard', value = item.name})
	  end

	end

	ESX.UI.Menu.Open(
	  'default', GetCurrentResourceName(), 'stocks_menu',
	  {
		title    = _U('inventory'),
		elements = elements
	  },
	  function(data, menu)

		local itemName = data.current.value

		ESX.UI.Menu.Open(
		  'dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count',
		  {
			title = _U('quantity')
		  },
		  function(data2, menu2)

			local count = tonumber(data2.value)

			if count == nil then
			  ESX.ShowNotification(_U('quantity_invalid'))
			else
			  menu2.close()
			  menu.close()

			  TriggerServerEvent('esx_statejob:putStockItems', itemName, count)
			  OpenPutStocksMenu()
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

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	
	Citizen.Wait(5000)
	TriggerServerEvent('esx_statejob:forceBlip')
end)

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)

  local specialContact = {
	name       = 'state',
	number     = 'state',
	base64Icon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NDFGQTJDRkI0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NDFGQTJDRkM0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0MUZBMkNGOTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0MUZBMkNGQTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PoW66EYAAAjGSURBVHjapJcLcFTV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'
  }

  TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)

end)

AddEventHandler('esx_statejob:hasEnteredMarker', function(station, part, partNum)

  if part == 'Cloakroom' then
	CurrentAction     = 'menu_cloakroom'
	CurrentActionMsg  = _U('open_cloackroom')
	CurrentActionData = {}
  end

  if part == 'Armory' then
	CurrentAction     = 'menu_armory'
	CurrentActionMsg  = _U('open_armory')
	CurrentActionData = {station = station}
  end

  if part == 'VehicleSpawnWithShop' then
	CurrentAction     = 'menu_vehicle_spawner_with_shop'
	CurrentActionMsg  = _U('vehicle_spawner')
	CurrentActionData = {station = station, partNum = partNum}
  end

  if
	  part == 'VehicleSpawner' and
	  (PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name == 'lowerboss1' or PlayerData.job.grade_name == 'highpresident')
  then
	CurrentAction     = 'menu_vehicle_spawner'
	CurrentActionMsg  = _U('vehicle_spawner')
	CurrentActionData = {station = station, partNum = partNum}
  end

  if part == 'HelicopterSpawner' then

	local helicopters = Config.StateStations[station].Helicopters

	if not IsAnyVehicleNearPoint(helicopters[partNum].SpawnPoint.x, helicopters[partNum].SpawnPoint.y, helicopters[partNum].SpawnPoint.z,  3.0) then

	  ESX.Game.SpawnVehicle('polmav', {
		x = helicopters[partNum].SpawnPoint.x,
		y = helicopters[partNum].SpawnPoint.y,
		z = helicopters[partNum].SpawnPoint.z
	  }, helicopters[partNum].Heading, function(vehicle)
		SetVehicleModKit(vehicle, 0)
		SetVehicleLivery(vehicle, 0)
	  end)

	end

  end

  if part == 'VehicleDeleter' then

	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)

	if IsPedInAnyVehicle(playerPed,  false) then

	  local vehicle = GetVehiclePedIsIn(playerPed, false)

	  if DoesEntityExist(vehicle) then
		CurrentAction     = 'delete_vehicle'
		CurrentActionMsg  = _U('store_vehicle')
		CurrentActionData = {vehicle = vehicle}
	  end

	end

  end

  if part == 'BossActions' then
	CurrentAction     = 'menu_boss_actions'
	CurrentActionMsg  = _U('open_bossmenu')
	CurrentActionData = {}
  end

end)

AddEventHandler('esx_statejob:hasExitedMarker', function(station, part, partNum)
	if part ~= 'VehicleSpawnWithShop' then
		ESX.UI.Menu.CloseAll()
	end
  	CurrentAction = nil
end)

AddEventHandler('esx_statejob:hasEnteredEntityZone', function(entity)

  local playerPed = PlayerPedId()

  if PlayerData.job ~= nil and PlayerData.job.name == 'state' and not IsPedInAnyVehicle(playerPed, false) then
	CurrentAction     = 'remove_entity'
	CurrentActionMsg  = _U('remove_prop')
	CurrentActionData = {entity = entity}
  end

  if GetEntityModel(entity) == GetHashKey('p_ld_stinger_s') then

	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)

	if IsPedInAnyVehicle(playerPed,  false) then

	  local vehicle = GetVehiclePedIsIn(playerPed)

	  for i=0, 7, 1 do
		SetVehicleTyreBurst(vehicle,  i,  true,  1000)
	  end

	end

  end

end)

AddEventHandler('esx_statejob:hasExitedEntityZone', function(entity)

  if CurrentAction == 'remove_entity' then
	CurrentAction = nil
  end

end)

RegisterNetEvent('esx_statejob:handcuff')
AddEventHandler('esx_statejob:handcuff', function()
	IsHandcuffed    = not IsHandcuffed
	local playerPed = PlayerPedId()

	Citizen.CreateThread(function()
		if IsHandcuffed then

			RequestAnimDict('mp_arresting')
			while not HasAnimDictLoaded('mp_arresting') do
				Citizen.Wait(100)
			end

			TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)

			SetEnableHandcuffs(playerPed, true)
			DisablePlayerFiring(playerPed, true)
			SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
			SetPedCanPlayGestureAnims(playerPed, false)
			FreezeEntityPosition(playerPed, true)

			if Config.EnableHandcuffTimer then
				if HandcuffTimer then
					ESX.ClearTimeout(HandcuffTimer)
				end

				StartHandcuffTimer()
			end

		else

			if Config.EnableHandcuffTimer and HandcuffTimer then
				ESX.ClearTimeout(HandcuffTimer)
			end
			ClearPedSecondaryTask(playerPed)
			SetEnableHandcuffs(playerPed, false)
			DisablePlayerFiring(playerPed, false)
			SetPedCanPlayGestureAnims(playerPed, true)
			FreezeEntityPosition(playerPed, false)
		end
	end)

end)

AddEventHandler('esx_statejob:unrestrain', function()
	if IsHandcuffed then
		local playerPed = PlayerPedId()
		IsHandcuffed = false

		ClearPedSecondaryTask(playerPed)
		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		FreezeEntityPosition(playerPed, false)
	end
end)

RegisterNetEvent('esx_statejob:drag')
AddEventHandler('esx_statejob:drag', function(cop)
	IsDragged = not IsDragged
	CopPed = tonumber(cop)
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsHandcuffed then
			if IsDragged then
				local ped = GetPlayerPed(GetPlayerFromServerId(CopPed))
				local myped = PlayerPedId()
				AttachEntityToEntity(myped, ped, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
			else
				DetachEntity(PlayerPedId(), true, false)
			end
		else
			Citizen.Wait(500)
		end
	end
end)

RegisterNetEvent('esx_statejob:putInVehicle')
AddEventHandler('esx_statejob:putInVehicle', function()

  local playerPed = PlayerPedId()
  local coords    = GetEntityCoords(playerPed)

  if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then

	local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)

	if DoesEntityExist(vehicle) then

	  local maxSeats = GetVehicleMaxNumberOfPassengers(vehicle)
	  local freeSeat = nil

	  for i=maxSeats - 1, 0, -1 do
		if IsVehicleSeatFree(vehicle, i) then
		  freeSeat = i
		  break
		end
	  end

	  if freeSeat ~= nil then
		TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
	  end

	end

  end

end)

RegisterNetEvent('esx_statejob:OutVehicle')
AddEventHandler('esx_statejob:OutVehicle', function(t)
	local ped = GetPlayerPed(t)
	ClearPedTasksImmediately(ped)
	plyPos = GetEntityCoords(PlayerPedId(),  true)
	local xnew = plyPos.x+2
	local ynew = plyPos.y+2

	SetEntityCoords(PlayerPedId(), xnew, ynew, plyPos.z)
end)

-- Handcuff
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsHandcuffed then
			DisplayRadar(false)
			DisableControlAction(2, 1, true) -- Disable pan
			DisableControlAction(2, 2, true) -- Disable tilt
			DisableControlAction(2, 24, true) -- Attack
			DisableControlAction(2, 257, true) -- Attack 2
			DisableControlAction(2, 25, true) -- Aim
			DisableControlAction(2, 263, true) -- Melee Attack 1
			DisableControlAction(2, Keys['R'], true) -- Reload
			DisableControlAction(2, Keys['TOP'], true) -- Open phone (not needed?)
			DisableControlAction(2, Keys['SPACE'], true) -- Jump
			DisableControlAction(2, Keys['Q'], true) -- Cover
			DisableControlAction(2, Keys['TAB'], true) -- Select Weapon
			DisableControlAction(2, Keys['F'], true) -- Also 'enter'?
			DisableControlAction(2, Keys['F1'], true) -- Disable phone
			DisableControlAction(2, Keys['F2'], true) -- Inventory
			DisableControlAction(2, Keys['F3'], true) -- Animations
			DisableControlAction(2, Keys['V'], true) -- Disable changing view
			DisableControlAction(2, Keys['P'], true) -- Disable pause screen
			DisableControlAction(2, 59, true) -- Disable steering in vehicle
			DisableControlAction(2, Keys['LEFTCTRL'], true) -- Disable going stealth
			DisableControlAction(0, 47, true)  -- Disable weapon
			DisableControlAction(0, 264, true) -- Disable melee
			DisableControlAction(0, 257, true) -- Disable melee
			DisableControlAction(0, 140, true) -- Disable melee
			DisableControlAction(0, 141, true) -- Disable melee
			DisableControlAction(0, 142, true) -- Disable melee
			DisableControlAction(0, 143, true) -- Disable melee
			DisableControlAction(0, 75, true)  -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle
		else
			Citizen.Wait(500)
		end
	end
end)

-- Create blips
Citizen.CreateThread(function()

  for k,v in pairs(Config.StateStations) do

	local blip = AddBlipForCoord(v.Blip.Pos.x, v.Blip.Pos.y, v.Blip.Pos.z)

	SetBlipSprite (blip, v.Blip.Sprite)
	SetBlipDisplay(blip, v.Blip.Display)
	SetBlipScale  (blip, v.Blip.Scale)
	SetBlipColour (blip, v.Blip.Colour)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(_U('map_blip'))
	EndTextCommandSetBlipName(blip)

  end

end)

-- Display markers
Citizen.CreateThread(function()
  while true do

	Wait(0)

	if PlayerData.job ~= nil and PlayerData.job.name == 'state' then

	  local playerPed = PlayerPedId()
	  local coords    = GetEntityCoords(playerPed)

	  for k,v in pairs(Config.StateStations) do

		for i=1, #v.Cloakrooms, 1 do
		  if GetDistanceBetweenCoords(coords,  v.Cloakrooms[i].x,  v.Cloakrooms[i].y,  v.Cloakrooms[i].z,  true) < Config.DrawDistance then
			DrawMarker(Config.MarkerType, v.Cloakrooms[i].x, v.Cloakrooms[i].y, v.Cloakrooms[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
		  end
		end

		for i=1, #v.Armories, 1 do
		  if GetDistanceBetweenCoords(coords,  v.Armories[i].x,  v.Armories[i].y,  v.Armories[i].z,  true) < Config.DrawDistance then
			DrawMarker(Config.MarkerType, v.Armories[i].x, v.Armories[i].y, v.Armories[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
		  end
		end

		if GetDistanceBetweenCoords(coords,  v.VehicleSpawner.Pos.x,  v.VehicleSpawner.Pos.y,  v.VehicleSpawner.Pos.z,  true) < Config.DrawDistance then
			DrawMarker(
				v.VehicleSpawner.Type,
				v.VehicleSpawner.Pos.x, v.VehicleSpawner.Pos.y, v.VehicleSpawner.Pos.z,
				0.0, 0.0, 0.0, 0, 0.0, 0.0,
				v.VehicleSpawner.Size.x, v.VehicleSpawner.Size.y, v.VehicleSpawner.Size.z,
				v.VehicleSpawner.Color.r, v.VehicleSpawner.Color.g, v.VehicleSpawner.Color.b,
				100, false, true, 2, v.VehicleSpawner.Rotate, false, false, false)
		end

		for i=1, #v.Vehicles, 1 do
		  if GetDistanceBetweenCoords(coords,  v.Vehicles[i].Spawner.x,  v.Vehicles[i].Spawner.y,  v.Vehicles[i].Spawner.z,  true) < Config.DrawDistance then
			DrawMarker(Config.MarkerType, v.Vehicles[i].Spawner.x, v.Vehicles[i].Spawner.y, v.Vehicles[i].Spawner.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
		  end
		end

		for i=1, #v.VehicleDeleters, 1 do
		  if GetDistanceBetweenCoords(coords,  v.VehicleDeleters[i].x,  v.VehicleDeleters[i].y,  v.VehicleDeleters[i].z,  true) < Config.DrawDistance then
			DrawMarker(Config.MarkerType, v.VehicleDeleters[i].x, v.VehicleDeleters[i].y, v.VehicleDeleters[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.VehicleDeleters[i].MarkerSize.x, v.VehicleDeleters[i].MarkerSize.y, v.VehicleDeleters[i].MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
		  end
		end

		if Config.EnablePlayerManagement and PlayerData.job ~= nil and PlayerData.job.name == 'state' and (PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name == 'lowerboss1') then

		  for i=1, #v.BossActions, 1 do
			if not v.BossActions[i].disabled and GetDistanceBetweenCoords(coords,  v.BossActions[i].x,  v.BossActions[i].y,  v.BossActions[i].z,  true) < Config.DrawDistance then
			  DrawMarker(Config.MarkerType, v.BossActions[i].x, v.BossActions[i].y, v.BossActions[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
			end
		  end

		end

	  end

	end

  end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()

  while true do

	Wait(0)

	if PlayerData.job ~= nil and PlayerData.job.name == 'state' then

	  local playerPed      = PlayerPedId()
	  local coords         = GetEntityCoords(playerPed)
	  local isInMarker     = false
	  local currentStation = nil
	  local currentPart    = nil
	  local currentPartNum = nil

	  for k,v in pairs(Config.StateStations) do

		for i=1, #v.Cloakrooms, 1 do
		  if GetDistanceBetweenCoords(coords,  v.Cloakrooms[i].x,  v.Cloakrooms[i].y,  v.Cloakrooms[i].z,  true) < Config.MarkerSize.x then
			isInMarker     = true
			currentStation = k
			currentPart    = 'Cloakroom'
			currentPartNum = i
		  end
		end

		for i=1, #v.Armories, 1 do
		  if GetDistanceBetweenCoords(coords,  v.Armories[i].x,  v.Armories[i].y,  v.Armories[i].z,  true) < Config.MarkerSize.x then
			isInMarker     = true
			currentStation = k
			currentPart    = 'Armory'
			currentPartNum = i
		  end
		end

		if GetDistanceBetweenCoords(coords,  v.VehicleSpawner.Pos.x,  v.VehicleSpawner.Pos.y,  v.VehicleSpawner.Pos.z,  true) < Config.MarkerSize.x then
			isInMarker     = true
			currentStation = k
			currentPart    = 'VehicleSpawnWithShop'
			currentPartNum = 1
		end

		for i=1, #v.Vehicles, 1 do

		  if GetDistanceBetweenCoords(coords,  v.Vehicles[i].Spawner.x,  v.Vehicles[i].Spawner.y,  v.Vehicles[i].Spawner.z,  true) < Config.MarkerSize.x then
			isInMarker     = true
			currentStation = k
			currentPart    = 'VehicleSpawner'
			currentPartNum = i
		  end

		  if GetDistanceBetweenCoords(coords,  v.Vehicles[i].SpawnPoint.x,  v.Vehicles[i].SpawnPoint.y,  v.Vehicles[i].SpawnPoint.z,  true) < Config.MarkerSize.x then
			isInMarker     = true
			currentStation = k
			currentPart    = 'VehicleSpawnPoint'
			currentPartNum = i
		  end

		end

		for i=1, #v.Helicopters, 1 do

		  if GetDistanceBetweenCoords(coords,  v.Helicopters[i].Spawner.x,  v.Helicopters[i].Spawner.y,  v.Helicopters[i].Spawner.z,  true) < Config.MarkerSize.x then
			isInMarker     = true
			currentStation = k
			currentPart    = 'HelicopterSpawner'
			currentPartNum = i
		  end

		  if GetDistanceBetweenCoords(coords,  v.Helicopters[i].SpawnPoint.x,  v.Helicopters[i].SpawnPoint.y,  v.Helicopters[i].SpawnPoint.z,  true) < Config.MarkerSize.x then
			isInMarker     = true
			currentStation = k
			currentPart    = 'HelicopterSpawnPoint'
			currentPartNum = i
		  end

		end

		for i=1, #v.VehicleDeleters, 1 do
		  if GetDistanceBetweenCoords(coords,  v.VehicleDeleters[i].x,  v.VehicleDeleters[i].y,  v.VehicleDeleters[i].z,  true) < Config.MarkerSize.x then
			isInMarker     = true
			currentStation = k
			currentPart    = 'VehicleDeleter'
			currentPartNum = i
		  end
		end

		if Config.EnablePlayerManagement and PlayerData.job ~= nil and PlayerData.job.name == 'state' and (PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name == 'lowerboss1') then

		  for i=1, #v.BossActions, 1 do
			if GetDistanceBetweenCoords(coords,  v.BossActions[i].x,  v.BossActions[i].y,  v.BossActions[i].z,  true) < Config.MarkerSize.x then
			  isInMarker     = true
			  currentStation = k
			  currentPart    = 'BossActions'
			  currentPartNum = i
			end
		  end

		end

	  end

	  local hasExited = false

	  if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum) ) then

		if
		  (LastStation ~= nil and LastPart ~= nil and LastPartNum ~= nil) and
		  (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)
		then
		  TriggerEvent('esx_statejob:hasExitedMarker', LastStation, LastPart, LastPartNum)
		  hasExited = true
		end

		HasAlreadyEnteredMarker = true
		LastStation             = currentStation
		LastPart                = currentPart
		LastPartNum             = currentPartNum

		TriggerEvent('esx_statejob:hasEnteredMarker', currentStation, currentPart, currentPartNum)
	  end

	  if not hasExited and not isInMarker and HasAlreadyEnteredMarker then

		HasAlreadyEnteredMarker = false

		TriggerEvent('esx_statejob:hasExitedMarker', LastStation, LastPart, LastPartNum)
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

			if IsControlJustReleased(0, Keys['E']) and PlayerData.job ~= nil and PlayerData.job.name == 'state' then

				if CurrentAction == 'menu_cloakroom' then
					OpenCloakroomMenu()
				elseif CurrentAction == 'menu_armory' then
					OpenArmoryMenu(CurrentActionData.station)
				elseif CurrentAction == 'menu_vehicle_spawner_with_shop' then
					exports.nncore:OpenVehicleSpawnerMenu(Config.VehicleShopCoords, Config.SpawnPoints, Config.AuthorizedVehicles)
				elseif CurrentAction == 'menu_vehicle_spawner' then
					OpenVehicleSpawnerMenu(CurrentActionData.station, CurrentActionData.partNum)
				elseif CurrentAction == 'delete_vehicle' then
					if Config.EnableSocietyOwnedVehicles then
						local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
						TriggerServerEvent('esx_society:putVehicleILovePizzaInGarage', 'state', vehicleProps)
					else
						if GetEntityModel(vehicle) == GetHashKey('state') or
							GetEntityModel(vehicle) == GetHashKey('state2') or
							GetEntityModel(vehicle) == GetHashKey('state3') or
							GetEntityModel(vehicle) == GetHashKey('state4') or
							GetEntityModel(vehicle) == GetHashKey('stateb') or
							GetEntityModel(vehicle) == GetHashKey('statet')
						then
							TriggerServerEvent('esx_service:disableService', 'state')
						end
					end
					ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
				elseif CurrentAction == 'menu_boss_actions' then
					ESX.UI.Menu.CloseAll()
					TriggerEvent('esx_society:openBossMenu', 'state', function(data, menu)
						menu.close()
						CurrentAction     = 'menu_boss_actions'
						CurrentActionMsg  = _U('open_bossmenu')
						CurrentActionData = {}
					end)
				elseif CurrentAction == 'remove_entity' then
					DeleteEntity(CurrentActionData.entity)
				end
				
				CurrentAction = nil
			end
		end -- CurrentAction end
		
		if IsControlJustReleased(0, Keys['F6']) and not isDead and PlayerData.job ~= nil and PlayerData.job.name == 'state' and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'state_actions') then
			OpenstateActionsMenu()
		end
		
		if IsControlJustReleased(0, Keys['E']) and CurrentTask.Busy then
			ESX.ShowNotification(_U('impound_canceled'))
			ESX.ClearTimeout(CurrentTask.Task)
			ClearPedTasks(PlayerPedId())
			
			CurrentTask.Busy = false
		end
	end
end)

-- Create blip for colleagues
function createBlip(id)
	ped = GetPlayerPed(id)
	blip = GetBlipFromEntity(ped)
	
	if not DoesBlipExist(blip) then -- Add blip and create head display on player
		blip = AddBlipForEntity(ped)
		SetBlipSprite(blip, 1)
		ShowHeadingIndicatorOnBlip(blip, true) -- Player Blip indicator
		SetBlipRotation(blip, math.ceil(GetEntityHeading(veh))) -- update rotation
		SetBlipNameToPlayerName(blip, id) -- update blip name
		SetBlipScale(blip, 0.85) -- set scale
		SetBlipAsShortRange(blip, true)
		
		table.insert(blipsCops, blip) -- add blip to array so we can remove it later
	end
end

RegisterNetEvent('esx_statejob:updateBlip')
AddEventHandler('esx_statejob:updateBlip', function()
	
	-- -- Refresh all blips
	-- for k, existingBlip in pairs(blipsCops) do
	-- 	RemoveBlip(existingBlip)
	-- end
	
	-- -- Clean the blip table
	-- blipsCops = {}
	
	-- -- Is the player a cop? In that case show all the blips for other cops
	-- if PlayerData.job ~= nil and PlayerData.job.name == 'state' then
	-- 	ESX.TriggerServerCallback('esx_society:getOnlILovePizzainePlayers', function(players)
	-- 		for i=1, #players, 1 do
	-- 			if players[i].job.name == 'state' then
	-- 				for id = 0, 32 do
	-- 					if NetworkIsPlayerActive(id) and GetPlayerPed(id) ~= PlayerPedId() and GetPlayerName(id) == players[i].name then
	-- 						createBlip(id)
	-- 					end
	-- 				end
	-- 			end
	-- 		end
	-- 	end)
	-- end

end)

AddEventHandler('playerSpawned', function(spawn)
	isDead = false
	TriggerEvent('esx_statejob:unrestrain')
	
	if not hasAlreadyJoined then
		TriggerServerEvent('esx_statejob:spawned')
	end
	hasAlreadyJoined = true
end)

AddEventHandler('esx:onPlayerDeath', function(data)
	isDead = true
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('esx_statejob:unrestrain')
	end
end)

-- handcuff timer, unrestrain the player after an certain amount of time
function StartHandcuffTimer()
	if Config.EnableHandcuffTimer and HandcuffTimer then
		ESX.ClearTimeout(HandcuffTimer)
	end

	HandcuffTimer = ESX.SetTimeout(Config.HandcuffTimer, function()
		ESX.ShowNotification(_U('unrestrained_timer'))
		TriggerEvent('esx_statejob:unrestrain')
	end)

	HandcuffTimer = nil
end

-- TODO
--   - return to garage if owned
--   - message owner that his vehicle has been impounded
function ImpoundVehicle(vehicle)
	--local vehicleName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
	ESX.Game.DeleteVehicle(vehicle) 
	ESX.ShowNotification(_U('impound_successful'))
	CurrentTask.Busy = false
end