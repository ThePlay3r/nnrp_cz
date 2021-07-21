local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local HasAlreadyEnteredMarker = false
local LastZone = nil

local ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

AddEventHandler('osobnisatny:hasEnteredMarker', function(zone)
	CurrentAction     = 'custom_clothes_menu'
	CurrentActionMsg  = 'Zmáckni ~INPUT_CONTEXT~ pro pristup do satny'
	CurrentActionData = {}
end)

AddEventHandler('osobnisatny:hasExitedMarker', function(zone)
	CurrentAction = nil
	ESX.UI.Menu.CloseAll()
end)

-- Display markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

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
		Citizen.Wait(500)

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
			TriggerEvent('osobnisatny:hasEnteredMarker', currentZone)
		end

		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('osobnisatny:hasExitedMarker', LastZone)
		end
	end
end)

function OpenClothesMenu ()
	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'room',
		{
		  title    = 'Satna',
		  align    = 'top-left',
		  elements = {
			  {label = 'Obleceni', value = 'player_dressing'},
			  {label = 'Odstranit obleceni', value = 'remove_cloth'},
		  },
		},
		function(data, menu)   
			if data.current.value == 'player_dressing' then
				ESX.TriggerServerCallback('nncore:getPlayerOutfits', function(outfits)
					local elements = {}

					for k,v in pairs(outfits) do
						table.insert(elements, {label = v.label, value = v.outfit})
					end

					table.sort(elements, function(a,b)
						return a.label:lower() < b.label:lower()
					end)

					ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'player_dressing',
					{
						title    = 'Obleceni',
						align    = 'top-left',
						elements = elements,
					},
					function(data, menu)
						TriggerEvent('skinchanger:getSkin', function(skin)
							TriggerEvent('skinchanger:loadClothes', skin, data.current.value)
							TriggerEvent('esx_skin:setLastSkin', skin)

							TriggerEvent('skinchanger:getSkin', function(skin)
								TriggerServerEvent('esx_skin:save', skin)
							end)
						end)
					end,
					function(data, menu)
						menu.close()
					end)
				end)
				-- ESX.TriggerServerCallback('esx_property:getPlayerDressing', function(dressing)
				-- 	local elements = {}

				-- 	for i=1, #dressing, 1 do
				-- 		table.insert(elements, {label = dressing[i], value = i, outfit = dressing[i]})
				-- 	end

				-- 	ESX.UI.Menu.Open(
				-- 	'default', GetCurrentResourceName(), 'player_dressing',
				-- 	{
				-- 		title    = 'Obleceni',
				-- 		align    = 'top-left',
				-- 		elements = elements,
				-- 	},
				-- 	function(data, menu)

				-- 		TriggerEvent('skinchanger:getSkin', function(skin)
				-- 				TriggerEvent('skinchanger:loadClothes', skin, data.current.outfit)
				-- 				TriggerEvent('esx_skin:setLastSkin', skin)

				-- 				TriggerEvent('skinchanger:getSkin', function(skin)
				-- 					TriggerServerEvent('esx_skin:save', skin)
				-- 				end)
				-- 		end)

				-- 	end,
				-- 	function(data, menu)
				-- 		menu.close()
				-- 	end
				-- )
			-- end)

			end
			
			if data.current.value == 'remove_cloth' then
				ESX.TriggerServerCallback('nncore:getPlayerOutfits', function(outfits)
					local elements = {}

					for k,v in pairs(outfits) do
						table.insert(elements, {label = v.label, value = v.outfit})
					end

					ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'remove_cloth', {
						title    = 'Odstranit obleceni',
						align    = 'top-left',
						elements = elements
					}, function(data2, menu2)
						menu2.close()
						ESX.TriggerServerCallback('nncore:deleteOutfit', function(success)
							if success then
								ESX.ShowNotification('Obleceni odstraneno')
							else
								ESX.ShowNotification('Obleceni se nepodarilo odstranit')
							end
						end, data2.current.label)
					end, function(data2, menu2)
						menu2.close()
					end)
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