local ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function( obj ) ESX = obj end)

ESX.RegisterUsableItem('ammo-box', function(source)
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('mrw_utils:AmmoBox', _source)
    xPlayer.removeInventoryItem('ammo-box', 1)
end)

ESX.RegisterUsableItem('bulletproof', function(source)
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('mrw_utils:bproof', _source)
end)

RegisterServerEvent('mrw_utils:DelBProof')
AddEventHandler('mrw_utils:DelBProof', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.removeInventoryItem('bulletproof', 1)
end)
