ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj)
	ESX = obj
end)

RegisterServerEvent('esx_gym:hireBmx')
AddEventHandler('esx_gym:hireBmx', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if(xPlayer.getBank() >= 250) then
		xPlayer.removeAccountMoney('bank', 250)
			
		notification("Pronajal/a sis ~g~BMX.")
	else
		notification("Ukradl/a jsi kolo, protoze si nemel/a dostatek ~r~penez.")
	end	
end)

RegisterServerEvent('esx_gym:hireCruiser')
AddEventHandler('esx_gym:hireCruiser', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getBank() >= 300) then
		xPlayer.removeAccountMoney('bank', 300)
			
		notification("Pronajal/a sis ~g~CRUISER")
	else
		notification("Ukradl/a jsi kolo, protoze si nemel/a dostatek ~r~penez.")
	end	
end)

RegisterServerEvent('esx_gym:hireFixter')
AddEventHandler('esx_gym:hireFixter', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getBank() >= 329) then
		xPlayer.removeAccountMoney('bank', 329)
			
		notification("Pronajal/a sis ~g~FIXTER")
	else
		notification("Ukradl/a jsi kolo, protoze si nemel/a dostatek ~r~penez.")
	end	
end)

RegisterServerEvent('esx_gym:hireScorcher')
AddEventHandler('esx_gym:hireScorcher', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getBank() >= 400) then
		xPlayer.removeAccountMoney('bank', 400)
			
		notification("Pronajal/a sis ~g~SCORCHER")
	else
		notification("Ukradl/a jsi kolo, protoze si nemel/a dostatek ~r~penez.")
	end	
end)

RegisterServerEvent('esx_gym:checkMembership')
AddEventHandler('esx_gym:checkMembership', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local oneQuantity = xPlayer.getInventoryItem('gym_membership').count
	
	TriggerClientEvent('esx_gym:hasMembership', source, oneQuantity > 0) -- true
end)

RegisterServerEvent('esx_gym:buyMembership')
AddEventHandler('esx_gym:buyMembership', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getBank() >= 15000) then
		xPlayer.removeAccountMoney('bank', 15000)
		
		xPlayer.addInventoryItem('gym_membership', 1)		
		notification("Zakoupil/a sis ~g~karticku do posilky")
		
		TriggerClientEvent('esx_gym:trueMembership', source) -- true
	else
		notification("Nemas dostatek ~r~penez!")
	end	
end)


RegisterServerEvent('esx_gym:buyProteinshake')
AddEventHandler('esx_gym:buyProteinshake', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local playerItem = xPlayer.getInventoryItem('protein_shake')

	if playerItem.count >= 5 then
		notification("Vic toho po kapsach neuneses.")
		return
	end
	
	if(xPlayer.getBank() >= 800) then
		xPlayer.removeAccountMoney('bank', 800)
		
		xPlayer.addInventoryItem('protein_shake', 1)
		
		notification("Zakoupila/a sis ~g~proteinovy shake.")
	else
		notification("Nemas dostatek ~r~penez!")
	end	
end)

ESX.RegisterUsableItem('protein_shake', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('protein_shake', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_status:add', source, 'hunger', 80000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vypil/a si ~g~proteinovy shake')

end)

RegisterServerEvent('esx_gym:buyWater')
AddEventHandler('esx_gym:buyWater', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local playerItem = xPlayer.getInventoryItem('water')

	if playerItem.count >= 5 then
		notification("Vic toho po kapsach neuneses.")
		return
	end
	
	if(xPlayer.getBank() >= 250) then
		xPlayer.removeAccountMoney('bank', 250)
		
		xPlayer.addInventoryItem('water', 1)
		
		notification("Zakoupil/a sis ~g~vodu")
	else
		notification("Nemas dostatek ~r~penez!")
	end		
end)

RegisterServerEvent('esx_gym:buySportlunch')
AddEventHandler('esx_gym:buySportlunch', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local playerItem = xPlayer.getInventoryItem('sportlunch')

	if playerItem.count >= 5 then
		notification("Vic toho po kapsach neuneses.")
		return
	end
	
	if(xPlayer.getBank() >= 550) then
		xPlayer.removeAccountMoney('bank', 550)
		
		xPlayer.addInventoryItem('sportlunch', 1)
		
		notification("Zakoupila/a sis ~g~proteinovou tycinku.")
	else
		notification("Nemas dostatek ~r~penez!")
	end		
end)

ESX.RegisterUsableItem('sportlunch', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('sportlunch', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 150000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a si ~g~proteinovou tycinku.')

end)

RegisterServerEvent('esx_gym:buyPowerade')
AddEventHandler('esx_gym:buyPowerade', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local playerItem = xPlayer.getInventoryItem('powerade')

	if playerItem.count >= 5 then
		notification("Vic toho po kapsach neuneses.")
		return
	end
	
	if(xPlayer.getBank() >= 1000) then
		xPlayer.removeAccountMoney('bank', 1000)
		
		xPlayer.addInventoryItem('powerade', 1)
		
		notification("Zakoupil/a sis a ~g~napoj.")
	else
		notification("Nemas dostatek ~r~penez!")
	end		
end)

ESX.RegisterUsableItem('powerade', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('powerade', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 400000)
	TriggerClientEvent('esx_status:add', source, 'hunger', 150000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vypil/a si ~g~napoj')

end)

RegisterServerEvent('esx_gym:handleStatus')
AddEventHandler('esx_gym:handleStatus', function()
	TriggerClientEvent('esx_status:remove', source, 'hunger', 40000)
    TriggerClientEvent('esx_status:remove', source, 'thirst', 80000)
end)

-- FUNCTIONS IN THE FUTURE (COMING SOON...)

--RegisterServerEvent('esx_gym:trainArms')
--AddEventHandler('esx_gym:trainArms', function()
	
--end)

--RegisterServerEvent('esx_gym:trainChins')
--AddEventHandler('esx_gym:trainArms', function()
	
--end)

--RegisterServerEvent('esx_gym:trainPushups')
--AddEventHandler('esx_gym:trainPushups', function()
	
--end)

--RegisterServerEvent('esx_gym:trainYoga')
--AddEventHandler('esx_gym:trainYoga', function()
	
--end)

--RegisterServerEvent('esx_gym:trainSitups')
--AddEventHandler('esx_gym:trainSitups', function()
	
--end)

function notification(text)
	TriggerClientEvent('esx:showNotification', source, text)
end
