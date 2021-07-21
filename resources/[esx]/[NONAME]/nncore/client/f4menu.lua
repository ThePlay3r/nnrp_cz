local ESX = nil
local jobTitle = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	if xPlayer.job.label == xPlayer.job.grade_label then
		jobTitle = xPlayer.job.grade_label
	else
		if xPlayer.job.label == 'Cosa Nostra' and string.match(xPlayer.job.grade_name, 'taxi') then
			jobTitle = 'Taxi' .. ' - ' .. xPlayer.job.grade_label
		else
			jobTitle = xPlayer.job.label .. ' - ' .. xPlayer.job.grade_label
		end
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(playerJob)
	if playerJob.label == playerJob.grade_label then
		jobTitle = playerJob.grade_label
	else
		if playerJob.label == 'Cosa Nostra' and string.match(playerJob.grade_name, 'taxi') then
			jobTitle = 'Taxi' .. ' - ' .. playerJob.grade_label
		else
			jobTitle = playerJob.label .. ' - ' .. playerJob.grade_label
		end
	end
end)

function openActionsMenu ()
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'fourActionsMenu',
		{
			title = 'Akce',
			align = 'left',
			elements = {
				{value = 'klicenka', label = 'Klíčenka'},
				{value = 'remotes', label = 'Dálkové ovladače'},
				{value = 'gpslocs', label = 'GPS Lokace'},
				{value = 'udaje', label = 'Osobní údaje'},
				{value = 'insurance', label = 'EMS Pojisteni'},
				{value = 'oznameni', label = 'Oznameni'},
			},
		},
		function(data, menu)
			if data.current.value == 'oznameni' then
				TriggerEvent('nnannounces:showMenu')
			end
			if data.current.value == 'udaje' then
				ESX.TriggerServerCallback('esx_vizitka:getVizitkaData', function(userData)
					ESX.UI.Menu.Open(
						'default', GetCurrentResourceName(), 'fourActionsMenu',
						{
							title = 'Akce',
							align = 'left',
							elements = {
								{value = '', label = 'Jmeno: ' .. userData.name},
								{value = '', label = 'Datum narozeni: ' .. userData.dob},
								{value = '', label = jobTitle},
							},
						},
						function(data, menu)
						end,
						function(data, menu)
							menu.close()
						end
					)
				end)
			end
			if data.current.value == 'klicenka' then
				OpenKlicenka()
			end
			if data.current.value == 'remotes' then
				OpenRemotes()
			end
			if data.current.value == 'gpslocs' then
				OpenGPSLocsMenu()
			end
			if data.current.value == 'insurance' then
				ESX.TriggerServerCallback('esx_ambulancejob:getinsurancedate', function(date)
					local elements = {label = 'Nemas aktivni pojisteni'}

					if date then
						elements = {label = 'Pojisteni aktivni do ' .. date}
					end

					ESX.UI.Menu.Open(
						'default', GetCurrentResourceName(), 'insurancePreview',
						{
							title = 'Insurance',
							align = 'left',
							elements = elements,
						},
						function(data2, menu2)
							menu2.close()
						end,
						function(data2, menu2)
							menu2.close()
						end
					)
				end)
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

RegisterCommand('openActionsMenu', function()
	openActionsMenu()
end, false)


RegisterKeyMapping('openActionsMenu', 'Open Actions Menu', 'keyboard', 'F4')