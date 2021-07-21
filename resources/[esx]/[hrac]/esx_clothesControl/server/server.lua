-- ESX = nil

-- TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

-- ESX.RegisterServerCallback('esx_clothesControl:get', function(source, cb, accessory)
-- 	local xPlayer = ESX.GetPlayerFromId(source)

-- 	TriggerEvent('esx_datastore:getDataStore', 'user_' .. string.lower(accessory), xPlayer.identifier, function(store)
-- 		local hasAccessory = (store.get('has' .. accessory) and store.get('has' .. accessory) or false)
-- 		local skin = (store.get('skin') and store.get('skin') or {})

-- 		cb(hasAccessory, skin)
-- 	end)

-- end)