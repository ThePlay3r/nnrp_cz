ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

RegisterServerEvent('esx_truckILovePizzaerjob:pay')
AddEventHandler('esx_truckILovePizzaerjob:pay', function(payment)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	-- xPlayer.addMoney(tonumber(payment))
end)