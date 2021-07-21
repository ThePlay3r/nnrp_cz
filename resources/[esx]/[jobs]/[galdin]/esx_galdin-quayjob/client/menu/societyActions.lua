local ESX = nil
local ANIMATION_SETTINGS = {
	lib = "mini@drinking", anim = "shots_barman_b"
}
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

AddEventHandler('esx_galdinjob:openSocietyActionsMenu', function(jobGrade)
	local elements = {}

	table.insert(elements, {label = 'Míchání drinků (A-G)', value = 'menu_crafting', letters = {'a', 'b', 'c', 'd', 'e', 'f', 'g'}})
	table.insert(elements, {label = 'Míchání drinků (H-O)', value = 'menu_crafting', letters = {'h', 'ch', 'i', 'j', 'k', 'l', 'm', 'n', 'o'}})
	table.insert(elements, {label = 'Míchání drinků (P-Z)', value = 'menu_crafting', letters = {'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'}})
	table.insert(elements, {label = 'Míchání drinků (Svatba)', value = 'menu_wedding'})
	table.insert(elements, {label = 'Příprava kávy', value = 'menu_coffee'})
	table.insert(elements, {label = 'Rozléváné pití', value = 'menu_shots'})
	table.insert(elements, {label = _U('billing'), value = 'billing'})

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'galdin_actions',
		{
			title    = _U('galdin'),
			align    = 'left',
			elements = elements
		},
		function(data, menu)
			if data.current.value == 'billing' then
				OpenBillingMenu()
			end

			if data.current.value == 'menu_coffee' then
				local drinks = {}

				for key in pairs(Config.CraftingCoffee) do
					table.insert(drinks, {label = key, value = key})
				end

				table.sort(drinks, function(a, b)
					return a.label < b.label
				end)

				ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'menu_crafting',
					{
						title = _U('crafting'),
						align = 'left',
						elements = drinks,
					},
					function(data2, menu2)
						TriggerServerEvent('esx_galdinjob:craftingCoktails', data2.current.value, true, false)
						TriggerEvent('esx_galdinjob:doAnimation', ANIMATION_SETTINGS)
					end,
					function(data2, menu2)
						menu2.close()
					end
				)
			end

			if data.current.value == 'menu_shots' then
				local drinks = {}

				for key in pairs(Config.CraftingShots) do
					table.insert(drinks, {label = key, value = key})
				end

				table.sort(drinks, function(a, b)
					return a.label < b.label
				end)

				ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'menu_crafting',
					{
						title = _U('crafting'),
						align = 'left',
						elements = drinks,
					},
					function(data2, menu2)
						TriggerServerEvent('esx_galdinjob:craftingCoktails', data2.current.value, false, true)
						TriggerEvent('esx_galdinjob:doAnimation', ANIMATION_SETTINGS)
					end,
					function(data2, menu2)
						menu2.close()
					end
				)
			end


			if data.current.value == 'menu_crafting' then
				local drinks = {}

				for key in pairs(Config.Crafting) do
					if has_value(data.current.letters, string.lower(string.sub(key, 1, 1))) then
						table.insert(drinks, {label = key, value = key})
					end
				end

				table.sort(drinks, function(a, b)
					return a.label < b.label
				end)

				ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'menu_crafting',
					{
						title = _U('crafting'),
						align = 'left',
						elements = drinks,
					},
					function(data2, menu2)
						TriggerServerEvent('esx_galdinjob:craftingCoktails', data2.current.value, false, false)
						TriggerEvent('esx_galdinjob:doAnimation', ANIMATION_SETTINGS)
					end,
					function(data2, menu2)
						menu2.close()
					end
				)
			end

			if data.current.value == 'menu_wedding' then
				local drinks = {}

				for key in pairs(Config.Svatba) do
					table.insert(drinks, {label = key, value = key})
				end

				table.sort(drinks, function(a, b)
					return a.label < b.label
				end)

				ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'menu_crafting',
					{
						title = _U('crafting'),
						align = 'left',
						elements = drinks,
					},
					function(data2, menu2)
						TriggerServerEvent('esx_galdinjob:craftingCoktails', data2.current.value, false, false, true)
						TriggerEvent('esx_galdinjob:doAnimation', ANIMATION_SETTINGS)
					end,
					function(data2, menu2)
						menu2.close()
					end
				)
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end)

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
					TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_galdin', _U('billing'), amount)
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