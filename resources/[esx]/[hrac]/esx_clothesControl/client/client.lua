ESX = nil
local isFemale = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function takeOffClothes (clothesSkin)
	TriggerEvent('skinchanger:getSkin', function(skin)
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
	end)
end

function OpenActionMenuInteraction(target)
	local elements = {
		{label = _U('obleknout'), value = 'obleknout'},
		{label = _U('helmet'), value = 'helmet'},
		{label = _U('mask'), value = 'mask'},
		{label = _U('ears'), value = 'ears'},
		{label = _U('glasses'), value = 'glasses'},
		{label = _U('triko'), value = 'triko'},
		{label = 'Sundat nahrdelnik', value = 'nahrdelnik'},
		{label = 'Sundat vestu', value = 'vesta'},
		{label = 'Sundat hodinky', value = 'hodinky'},
		{label = 'Sundat naramky', value = 'naramky'},
		{label = _U('kalhoty'), value = 'kalhoty'},
		{label = _U('boty'), value = 'boty'},
		{label = 'Sundat tasku', value = 'taska'},
	}

	if isFemale then
		table.insert(elements, {label = 'Svleknout podprsenku', value = "podprda"})
	end
	
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'action_menu',
		{
			title    = ('Oblečení'),
			align    = 'top-left',
			elements = elements,
		},
		function(data, menu)
			if data.current.value == 'obleknout' then			
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					TriggerEvent('skinchanger:loadSkin', skin)
				end)
			elseif data.current.value == 'nahrdelnik' then
				local clothesSkin = {
					['chain_1'] = 0, ['chain_2'] = 0,
				}

				takeOffClothes(clothesSkin)
			elseif data.current.value == 'hodinky' then
				local clothesSkin = {
					['watches_1'] = -1, ['watches_2'] = 0,
				}

				takeOffClothes(clothesSkin)
			elseif data.current.value == 'naramky' then
				local clothesSkin = {
					['bracelets_1'] = -1, ['bracelets_2'] = 0,
				}

				takeOffClothes(clothesSkin)
			elseif data.current.value == 'podprda' then
				TriggerEvent('skinchanger:getSkin', function(skin)
					local clothesSkin = {
						['tshirt_1'] = 14, ['tshirt_2'] = 0,
						['torso_1'] = 91, ['torso_2'] = 0,
						['arms'] = 15, ['arms_2'] = 0
					}
			
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
				end)
			elseif data.current.value == 'triko' then
				if not isFemale then 
					TriggerEvent('skinchanger:getSkin', function(skin)
						local clothesSkin = {
							['tshirt_1'] = 15, ['tshirt_2'] = 0,
							['torso_1'] = 15, ['torso_2'] = 0,
							['arms'] = 15, ['arms_2'] = 0
						}

						if skin.tshirt_1 == 16 or skin.tshirt_1 == 17 then
							clothesSkin.tshirt_1 = skin.tshirt_1
						end

						takeOffClothes(clothesSkin)
					end)
				else
					local clothesSkin = {
						['tshirt_1'] = 14, ['tshirt_2'] = 0,
						['torso_1'] = 27, ['torso_2'] = math.random(0, 4),
						['arms'] = 15, ['arms_2'] = 0
					}
					takeOffClothes(clothesSkin)
				end
			elseif data.current.value == 'vesta' then
				local clothesSkin = {
					['bproof_1'] = 0, ['bproof_2'] = 0,
				}

				takeOffClothes(clothesSkin)
			elseif data.current.value == 'taska' then
				local clothesSkin = {
					['bags_1'] = 0, ['bags_2'] = 0,
				}

				takeOffClothes(clothesSkin)
			elseif data.current.value == 'kalhoty' then
				local clothesSkin = {
					['pants_1'] = 70,
					['pants_2'] = math.random(0, 13)
				}
		
				if isFemale then
					clothesSkin = {
						['pants_1'] = 25, ['pants_2'] = math.random(0, 4),
					}
				end
		
				takeOffClothes(clothesSkin)
			elseif data.current.value == 'boty' then
				local clothesSkin = {
					['shoes_1'] = 38, ['shoes_2'] = 0
				}
				
				takeOffClothes(clothesSkin)
			elseif data.current.value == 'helmet' then
				local clothesSkin = {
					helmet_1 = -1,
					helmet_2 = 0,
				}
				takeOffClothes(clothesSkin)
			elseif data.current.value == 'ears' then
				local clothesSkin = {
					ears_1 = -1,
					ears_2 = 0,
				}
				takeOffClothes(clothesSkin)
			elseif data.current.value == 'mask' then
				local clothesSkin = {
					mask_1 = 0,
					mask_2 = 0,
				}
				takeOffClothes(clothesSkin)
			elseif data.current.value == 'glasses' then
				local clothesSkin = {
					glasses_1 = 0,
					glasses_2 = 0,
				}

				if isFemale then
					clothesSkin['glasses_1'] = 12
				end
				takeOffClothes(clothesSkin)
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

-- Key controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		
		if IsControlJustReleased(0, 311) and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'action_menu') then
			if isFemale == nil then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					isFemale = skin.sex == 1
					OpenActionMenuInteraction()	
				end)
			else
				OpenActionMenuInteraction()
			end
		end
	end
end)
