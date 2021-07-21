TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
local spawned = false

ESX.RegisterServerCallback('callbackname', function( source, cb )
	cb(spawned)
    if not spawned then
        spawned = true
    end

end)