ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

-- RegisterServerEvent('esx_clotheshop:saveOutfit')
-- AddEventHandler('esx_clotheshop:saveOutfit', function(label, skin)
-- 	local _source = source
-- 	local xPlayer = ESX.GetPlayerFromId(_source)
-- 	local count = 0
-- 	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
-- 		local dressing = store.get('dressing')
-- 		count  = store.count('dressing')
		
-- 		if count < 10 then
-- 			if dressing == nil then
-- 				dressing = {}
-- 			end

-- 			table.insert(dressing, {
-- 				label = label,
-- 				skin  = skin
-- 			})

-- 			store.set('dressing', dressing)
-- 		else
-- 			TriggerClientEvent("pNotify:SendNotification",source, {text ='Nemas misto v satniku' , type = "info", timeout = 2000})			
-- 		end
-- 	end)
-- end)

ESX.RegisterServerCallback('esx_clotheshop:buyClothes', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local count = 0
	if xPlayer.get('money') >= Config.Price then
		xPlayer.removeMoney(Config.Price)
		TriggerClientEvent("pNotify:SendNotification",source, {text ='Koupil jsi obleceni za ' .. Config.Price , type = "info", timeout = 2000})
		cb(true)
	else
		TriggerClientEvent("pNotify:SendNotification",source, {text ='Nemas dost penez' , type = "info", timeout = 2000})
		cb(false)

	end
end)


RegisterServerEvent('esx_clotheshop:save')
AddEventHandler('esx_clotheshop:save', function(skin)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	for i=1,#Config.Cloth do
			local Cloth = Config.Cloth[i]
			if Cloth.objName == "Arms" then
				TriggerEvent('esx_datastore:getDataStore', 'user_' .. string.lower(Cloth.objName), xPlayer.identifier, function(store)

					store.set('has' .. Cloth.objName, true)
	
					local itemSkin = {}
					local item1 = string.lower(Cloth.objName)

					itemSkin[item1] = skin[item1]	
					store.set('skin', itemSkin)
				end)
			else
				TriggerEvent('esx_datastore:getDataStore', 'user_' .. string.lower(Cloth.objName), xPlayer.identifier, function(store)

				store.set('has' .. Cloth.objName, true)

				local itemSkin = {}
				local item1 = string.lower(Cloth.objName) .. '_1'
				local item2 = string.lower(Cloth.objName) .. '_2'

				itemSkin[item1] = skin[item1]
				itemSkin[item2] = skin[item2]

				store.set('skin', itemSkin)
				
			end)
		end
	end
end)

-- ESX.RegisterServerCallback('esx_clotheshop:checkPropertyDataStore', function(source, cb)
-- 	local xPlayer = ESX.GetPlayerFromId(source)
-- 	local foundStore = false

-- 	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
-- 		foundStore = true
-- 	end)

-- 	cb(foundStore)
-- end)


ESX.RegisterServerCallback('esx_clotheshop:checkMoney', function(source, cb)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.get('money') >= Config.Price then
		cb(true)
	else
		cb(false)
	end

end)