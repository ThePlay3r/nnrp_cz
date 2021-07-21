local ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/vizitka',  'Vypíše do chatu základní informace o hráči')
	TriggerEvent('chat:addSuggestion', '/telvizitka',  'Vypíše do chatu telefonní číslo hráče')
	TriggerEvent('chat:addSuggestion', '/fullvizitka',  'Vypíše do chatu základní informace o hráči včetně telefonního čísla')
	TriggerEvent('chat:addSuggestion', '/mojeid',  'Vypíše hráči jeho ID')
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('chat:removeSuggestion', '/vizitka')
		TriggerEvent('chat:removeSuggestion', '/telvizitka')
		TriggerEvent('chat:removeSuggestion', '/fullvizitka')
		TriggerEvent('chat:removeSuggestion', '/mojeid')
	end
end)

RegisterCommand('vizitka', function(source)
	ESX.TriggerServerCallback('esx_vizitka:getVizitkaData', function(data)
		TriggerServerEvent(
			'3ddo:shareDisplay',
			'Vizitka: ' .. data.name .. ' | ' .. data.sex .. ' | ' .. data.dob
		)
	end)
end, false)

RegisterCommand('telvizitka', function(source)
	ESX.TriggerServerCallback('esx_vizitka:getVizitkaData', function(data)
		TriggerServerEvent('3ddo:shareDisplay', 'Telefon: ' .. data.phone)
	end)
end, false)


RegisterCommand('fullvizitka', function(source)
	ESX.TriggerServerCallback('esx_vizitka:getVizitkaData', function(data)
		TriggerServerEvent(
			'3ddo:shareDisplay',
			'Vizitka: ' .. data.name .. ' | ' .. data.sex .. ' | ' .. data.dob .. ' | tel: ' .. data.phone .. ' | ' .. data.height
		)
	end)
end, false) 

RegisterCommand('mojeid', function()
	ESX.ShowNotification('Tvoje ID: ' .. GetPlayerServerId(PlayerId()))
end, false)