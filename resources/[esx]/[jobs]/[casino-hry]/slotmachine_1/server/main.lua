ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) 
  ESX = obj
end)


RegisterServerEvent('payforplayer2')
AddEventHandler('payforplayer2',function(winnings)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
	local winDecrease = math.random(7, 14) / 10

	xPlayer.addInventoryItem('zetony', winnings * winDecrease)
end)

RegisterServerEvent('playerpays2')
AddEventHandler('playerpays2',function(bet)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
	local playerZetonyCount = xPlayer.getInventoryItem('zetony').count

	if playerZetonyCount >= bet then
		xPlayer.removeInventoryItem('zetony', bet)
		TriggerClientEvent('spinit2',_source)
	else
		TriggerClientEvent('errormessage2',_source)
	end
end)
