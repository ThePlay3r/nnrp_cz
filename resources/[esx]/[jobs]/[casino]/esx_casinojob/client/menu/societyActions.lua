local ESX = nil
local ANIMATION_SETTINGS = {
	lib = "mini@drinking", anim = "shots_barman_b"
}
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)


AddEventHandler('esx_casinojob:openSocietyActionsMenu', function(jobGrade)
	local elements = {}

	table.insert(elements, {label = _U('billing'), value = 'billing'})
	if jobGrade == 'boss' then
	table.insert(elements, {label = 'Kolo stesti', value = 'luckywheel'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'casino_actions',
		{
			title    = _U('casino'),
			align    = 'left',
			elements = elements
		},
		function(data, menu)
			if data.current.value == 'billing' then
				OpenBillingMenu()
			end
			if data.current.value == 'luckywheel' then
				OpenLuckyWheelMenu()
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
					TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_casino', _U('billing'), amount)
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

function PrepareLuckyWheelMenu()
	ESX.TriggerServerCallback('esx_tpnrp_luckywheel:getLuckyWheelSettings', function(settings)
		OpenLuckyWheelMenu(settings.isCarAllowed, settings.isBigMoneyAllowed)
	end)
end

function OpenLuckyWheelMenu (isCarAllowed, isBigMoneyAllowed)
	local elements = {}

	if isCarAllowed then
		table.insert(elements, {value = "car", label = "Vypnout vyhru: AUTO"})
	else
		table.insert(elements, {value = "car", label = "Zapnout vyhru: AUTO"})
	end

	if isBigMoneyAllowed then
		table.insert(elements, {value = "money", label = "Vypnout vyhru: VELKY PRACHY"})
	else
		table.insert(elements, {value = "money", label = "Zapnout vyhru: VELKY PRACHY"})
	end

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'casino_luckywheel_actions',
		{
			title    = 'Kolo stesti',
			align    = 'left',
			elements = elements
		},
		function(data, menu)
			if data.current.value == 'car' then
				TriggerServerEvent('esx_tpnrp_luckywheel:editPrices', data.current.value, not isCarAllowed)
				menu.close()
				PrepareLuckyWheelMenu()
			end
			if data.current.value == 'money' then
				TriggerServerEvent('esx_tpnrp_luckywheel:editPrices', data.current.value, not isBigMoneyAllowed)
				menu.close()
				PrepareLuckyWheelMenu()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end