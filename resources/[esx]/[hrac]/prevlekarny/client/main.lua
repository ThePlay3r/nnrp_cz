local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local HasAlreadyEnteredMarker = false
local LastZone = nil

local ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

AddEventHandler('prevlekarny:hasEnteredMarker', function(zone)
	CurrentAction     = 'custom_clothes_menu'
	CurrentActionMsg  = 'Zmáckni ~INPUT_CONTEXT~ pro pristup do satny'
	CurrentActionData = {zone = zone}
end)

AddEventHandler('prevlekarny:hasExitedMarker', function(zone)
	CurrentAction = nil
	ESX.UI.Menu.CloseAll()
end)

-- Display markers
Citizen.CreateThread(function()
	while true do
		Wait(0)

		local coords = GetEntityCoords(GetPlayerPed(-1))

		for k,v in pairs(Config.Zones) do
			if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.MarkersDrawDistance) then
				DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, false, 2, false, false, false, false)
			end
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
			if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
				isInMarker = true
				currentZone = k
			end
		end

		if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
			HasAlreadyEnteredMarker = true
			LastZone = currentZone
			TriggerEvent('prevlekarny:hasEnteredMarker', currentZone)
		end

		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('prevlekarny:hasExitedMarker', LastZone)
		end
	end
end)

function OpenClothesMenu ()
	local elements = {{label = 'Vzit si puvodni obleceni', value = 'original_cloth'}}

	for k, v in pairs(Config.Zones[CurrentActionData.zone].clothes.male) do
		table.insert(elements, {
			label = k,
			value = k,
		})
	end

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'room',
		{
		  title    = 'Satna',
		  align    = 'top-left',
		  elements = elements,
		},
		function(data, menu)
			if data.current.value == 'original_cloth' then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					TriggerEvent('skinchanger:loadSkin', skin)
				end)
			else
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					local sex = 'male'
					if skin.sex == 1 then
						sex = 'female'
					end
					if 
						Config.Zones[CurrentActionData.zone] and
						Config.Zones[CurrentActionData.zone].clothes[sex] and
						Config.Zones[CurrentActionData.zone].clothes[sex][data.current.value]
					then
						TriggerEvent(
							'skinchanger:loadClothes',
							skin,
							Config.Zones[CurrentActionData.zone].clothes[sex][data.current.value]
						)
					end
				end)
			end
		end,
		function(data, menu)
		  menu.close()
	
		  CurrentAction     = 'custom_clothes_menu'
		  CurrentActionMsg  = 'Zmáckni ~INPUT_CONTEXT~ pro pristup do satny'
		  CurrentActionData = {}
		end
	) 
end

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if CurrentAction ~= nil then
			SetTextComponentFormat('STRING')
			AddTextComponentString(CurrentActionMsg)
			DisplayHelpTextFromStringLabel(0, 0, 1, -1)

			if IsControlJustReleased(0,  Config.Keys['E']) then
				if CurrentAction == 'custom_clothes_menu' then
					OpenClothesMenu()
				end
				
				CurrentAction = nil
			end
		end
	end
end)