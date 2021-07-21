ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj)
	ESX = obj
end)

-- Normal napoje

ESX.RegisterUsableItem('beer', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('beer', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 75000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 50000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_beer'))
	
end)



ESX.RegisterUsableItem('beer_nealko', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('beer_nealko', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_beer'))
	
end)


ESX.RegisterUsableItem('beer_fruit', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('beer_fruit', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 50000)
	TriggerClientEvent('esx_status:add', source, 'drunk', 50000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_beer'))
	
end)

ESX.RegisterUsableItem('white_wine_grand', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('white_wine_grand', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 100000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vypil/a jsi exkluzivni bile vino')
	
end)

ESX.RegisterUsableItem('red_wine_grand', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('red_wine_grand', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 100000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vypil/a jsi exkluzivni cervene vino')
	
end)

ESX.RegisterUsableItem('white_wine', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('white_wine', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 100000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vypil/a jsi bile vino')
	
end)

ESX.RegisterUsableItem('red_wine', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('red_wine', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 100000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vypil/a jsi cervene vino')
	
end)

ESX.RegisterUsableItem('vodkafruit', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('vodkafruit', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 300000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vypil/a jsi vodku s dzusem')
	
end)

ESX.RegisterUsableItem('rhumcoca', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('rhumcoca', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 300000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vypil/a jsi cuba libre')
	
end)
	
ESX.RegisterUsableItem('grand_cru', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeInventoryItem('grand_cru', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 300000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_grand_cru'))

end)

ESX.RegisterUsableItem('prosecco_shot', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('prosecco_shot', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 350000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_prosecco'))
	
end)

ESX.RegisterUsableItem('aperol_shot', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('aperol_shot', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 400000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_aperol'))
	
end)


ESX.RegisterUsableItem('blowjob', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('blowjob', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 400000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _'Vypil/a jsi blowjob')
	
end)

ESX.RegisterUsableItem('sangria', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('sangria', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 400000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _'Vypil/a jsi sangriu')
	
end)

ESX.RegisterUsableItem('vajecny_liker_shot', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('vajecny_liker_shot', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_vajecny_liker'))
	
end)

ESX.RegisterUsableItem('triple_sec_shot', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('triple_sec_shot', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 550000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_triple_sec'))
	
end)

ESX.RegisterUsableItem('brandy_shot', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('brandy_shot', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 550000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_brandy'))
	
end)

ESX.RegisterUsableItem('gin_shot', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('gin_shot', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 650000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_gin'))
	
end)

ESX.RegisterUsableItem('cinzano_shot', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('cinzano_shot', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 550000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_cinzano'))
	
end)

ESX.RegisterUsableItem('champagne', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('champagne', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_champagne'))
	
end)

ESX.RegisterUsableItem('campari_shot', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('campari_shot', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 450000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_campari'))
	
end)

ESX.RegisterUsableItem('zelena_shot', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('zelena_shot', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 350000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_zelena'))
	
end)

ESX.RegisterUsableItem('liqueur_peach_shot', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('liqueur_peach_shot', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 350000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vypil/a jsi broskvovy liker')
	
end)

ESX.RegisterUsableItem('campari_shot', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('campari_shot', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 350000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vypil/a jsi campari')
	
end)

ESX.RegisterUsableItem('liqueur_orange_shot', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('liqueur_orange_shot', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 350000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vypil/a jsi pomerancovy liker')
	
end)

ESX.RegisterUsableItem('liqueur_curacao_shot', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('liqueur_curacao_shot', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 350000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vypil/a jsi curacao liker')
	
end)

ESX.RegisterUsableItem('fernet_shot', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('fernet_shot', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 650000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_fernet'))
	
end)

ESX.RegisterUsableItem('liqueur_coffee_shot', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('liqueur_coffee_shot', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 350000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vypil/a jsi kavovy liker')
	
end)

ESX.RegisterUsableItem('liqueur_apple_shot', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('liqueur_apple_shot', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 350000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vypil/a jsi jablecny liker')
	
end)

ESX.RegisterUsableItem('vine', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('vine', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_vine'))
	
end)

ESX.RegisterUsableItem('baileys_shot', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('baileys_shot', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_baileys'))
	
end)


-- Michane napoje
ESX.RegisterUsableItem('mixapero', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('mixapero', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 450000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_mixapero'))
	
end)

ESX.RegisterUsableItem('appletini', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('appletini', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 450000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_appletini'))
	
end)

ESX.RegisterUsableItem('beton', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('beton', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 400000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_beton'))
	
end)

ESX.RegisterUsableItem('blue_hawai', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('blue_hawai', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 450000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_blue_hawai'))
	
end)

ESX.RegisterUsableItem('blue_lagoon', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('blue_lagoon', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 450000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_blue_lagoon'))
	
end)

ESX.RegisterUsableItem('bombardino', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('bombardino', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 480000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_bombardino'))
	
end)

ESX.RegisterUsableItem('cosmopolitan', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('cosmopolitan', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 420000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_cosmopolitan'))
	
end)

ESX.RegisterUsableItem('rhum_coca', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('rhum_coca', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 350000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_rhum_coca'))
	
end)

ESX.RegisterUsableItem('honey_punch', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('honey_punch', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 450000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_honey_punch'))
	
end)

ESX.RegisterUsableItem('gin_tonic', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('gin_tonic', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 400000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_gin_tonic'))
	
end)

ESX.RegisterUsableItem('jager_cola', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('jager_cola', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 320000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_jager_cola'))
	
end)

ESX.RegisterUsableItem('kamikadze', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('kamikadze', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 500000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_kamikadze'))
	
end)

ESX.RegisterUsableItem('letajici_jelen', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('letajici_jelen', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 320000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_letajici_jelen'))
	
end)

ESX.RegisterUsableItem('long_island', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('long_island', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 720000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_long_island'))
	
end)

ESX.RegisterUsableItem('margarita', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('margarita', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 550000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_margarita'))
	
end)

ESX.RegisterUsableItem('martini', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('martini', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 550000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vypil/a jsi martini')
	
end)

ESX.RegisterUsableItem('manhattan', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('manhattan', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 520000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_manhattan'))
	
end)

ESX.RegisterUsableItem('mimosa', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('mimosa', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 270000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_mimosa'))
	
end)

ESX.RegisterUsableItem('mojito', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('mojito', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 300000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_mojito'))
	
end)

ESX.RegisterUsableItem('negroni', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('negroni', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 500000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_negroni'))
	
end)

ESX.RegisterUsableItem('paradise', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('paradise', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 380000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_paradise'))
	
end)

ESX.RegisterUsableItem('pina_colada', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('pina_colada', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 315000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_pina_colada'))
	
end)

ESX.RegisterUsableItem('sex_on_the_beach', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('sex_on_the_beach', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 320000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_sex_on_the_beach'))
	
end)

ESX.RegisterUsableItem('svarak', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('svarak', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 70000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_svarak'))
	
end)

ESX.RegisterUsableItem('teleport', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('teleport', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 900000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_teleport'))
	
end)

ESX.RegisterUsableItem('tequila_sunrise', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('tequila_sunrise', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 325000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_tequila_sunrise'))
	
end)

ESX.RegisterUsableItem('vodka_juice', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('vodka_juice', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 500000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_vodka_juice'))
	
end)

ESX.RegisterUsableItem('vodnikovo_semeno', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('vodnikovo_semeno', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 400000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_vodnikovo_semeno'))
	
end)

ESX.RegisterUsableItem('white_russian', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('white_russian', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 540000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_white_russian'))
	
end)

ESX.RegisterUsableItem('zazelezobetonovany_rumburak', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('zazelezobetonovany_rumburak', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 990000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_zazelezobetonovany_rumburak'))
	
end)

-- Kafe
ESX.RegisterUsableItem('kava_irska', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('kava_irska', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 40000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_kava_irska'))
end)

ESX.RegisterUsableItem('kava_s_baileys', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('kava_s_baileys', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 40000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_kava_s_baileys'))
	
end)

ESX.RegisterUsableItem('kava_alzirska', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('kava_alzirska', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 40000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_kava_alzirska'))
	
end)


-- Vinne striky
ESX.RegisterUsableItem('spritzer_white', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('spritzer_white', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 150000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_spritzer_white'))
	
end)

ESX.RegisterUsableItem('spritzer_red', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('spritzer_red', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 150000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_spritzer_red'))
end)

-- PANAKY
ESX.RegisterUsableItem('becherovka_shot', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('becherovka_shot', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 300000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('becherovka_shot'))
	
end)

ESX.RegisterUsableItem('absinth_shot', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('absinth_shot', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 300000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vypil/a jsi panak absinthu')
	
end)


ESX.RegisterUsableItem('borovicka_shot', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('borovicka_shot', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 300000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('borovicka_shot'))
	
end)

ESX.RegisterUsableItem('jager_shot', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('jager_shot', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 400000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('jager_shot'))
	
end)

ESX.RegisterUsableItem('rum_shot', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('rum_shot', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 400000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('rum_shot'))
	
end)

ESX.RegisterUsableItem('rhum_shot', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('rhum_shot', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 400000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('rum_shot'))
	
end)

ESX.RegisterUsableItem('tequila_shot', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('tequila_shot', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 500000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('tequila_shot'))
	
end)

ESX.RegisterUsableItem('tequila_gold_shot', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('tequila_gold_shot', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 500000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('tequila_shot'))
	
end)

ESX.RegisterUsableItem('vodka_shot', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('vodka_shot', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 400000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('vodka_shot'))
	
end)

ESX.RegisterUsableItem('whisky_shot', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('whisky_shot', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 500000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('whisky_shot'))
	
end)

ESX.RegisterUsableItem('whisky_shot_apple', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('whisky_shot_apple', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 500000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('whisky_shot'))
	
end)

ESX.RegisterUsableItem('ashi_drink', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('ashi_drink', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 200000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vypil/a jsi Ashiho drink')
	
end)

ESX.RegisterUsableItem('ashi_drink_non', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('ashi_drink_non', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vypil/a jsi Ashiho drink')
	
end)

ESX.RegisterUsableItem('whisky_shot_honey', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('whisky_shot_honey', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 500000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('whisky_shot'))
	
end)

ESX.RegisterUsableItem('champagne_glass', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('champagne_glass', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 100000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vypil/a jsi sklenicku sampanskeho')
	
end)

ESX.RegisterUsableItem('wedding_champagne', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('wedding_champagne', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 100000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vypil/a jsi sklenicku sampanskeho')
	
end)

ESX.RegisterUsableItem('wedding_julep', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('wedding_julep', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 400000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vypil/a jsi Bourbon Mint Julep')
	
end)

ESX.RegisterUsableItem('wedding_mule', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('wedding_mule', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 400000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vypil/a jsi Moscow Mule')
	
end)

ESX.RegisterUsableItem('wedding_diablo', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('wedding_diablo', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 400000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vypil/a jsi El Diablo')
	
end)

ESX.RegisterUsableItem('wedding_daiquiri', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('wedding_daiquiri', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 400000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vypil/a jsi Daiquiri')
	
end)

-- ROZKRAFTOVANI LAHVI
ESX.RegisterUsableItem('baileys', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('baileys', 1)
	xPlayer.addInventoryItem('baileys_shot', 10)
end)

ESX.RegisterUsableItem('borovicka', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('borovicka', 1)
	xPlayer.addInventoryItem('borovicka_shot', 10)
end)

ESX.RegisterUsableItem('fernet', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('fernet', 1)
	xPlayer.addInventoryItem('fernet_shot', 10)
end)

ESX.RegisterUsableItem('liqueur_coffee', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('liqueur_coffee', 1)
	xPlayer.addInventoryItem('liqueur_coffee_shot', 10)
end)

ESX.RegisterUsableItem('zelena', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('zelena', 1)
	xPlayer.addInventoryItem('zelena_shot', 10)
end)

ESX.RegisterUsableItem('absinth', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('absinth', 1)
	xPlayer.addInventoryItem('absinth_shot', 10)
end)

ESX.RegisterUsableItem('liqueur_peach', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('liqueur_peach', 1)
	xPlayer.addInventoryItem('liqueur_peach_shot', 10)
end)

ESX.RegisterUsableItem('campari', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('campari', 1)
	xPlayer.addInventoryItem('campari_shot', 10)
end)

ESX.RegisterUsableItem('cinzano', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('cinzano', 1)
	xPlayer.addInventoryItem('cinzano_shot', 10)
end)

ESX.RegisterUsableItem('jack', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('jack', 1)
	xPlayer.addInventoryItem('whisky_shot', 10)
end)

ESX.RegisterUsableItem('jack_honey', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('jack_honey', 1)
	xPlayer.addInventoryItem('whisky_shot_honey', 10)
end)

ESX.RegisterUsableItem('jack_apple', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('jack_apple', 1)
	xPlayer.addInventoryItem('whisky_shot_apple', 10)
end)

ESX.RegisterUsableItem('gin', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('gin', 1)
	xPlayer.addInventoryItem('gin_shot', 10)
end)

ESX.RegisterUsableItem('liqueur_orange', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('liqueur_orange', 1)
	xPlayer.addInventoryItem('liqueur_orange_shot', 10)
end)

ESX.RegisterUsableItem('brandy', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('brandy', 1)
	xPlayer.addInventoryItem('brandy_shot', 10)
end)

ESX.RegisterUsableItem('vajecny_liker', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('vajecny_liker', 1)
	xPlayer.addInventoryItem('vajecny_liker_shot', 10)
end)

ESX.RegisterUsableItem('liqueur_curacao', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('liqueur_curacao', 1)
	xPlayer.addInventoryItem('liqueur_curacao_shot', 10)
end)

ESX.RegisterUsableItem('becherovka', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('becherovka', 1)
	xPlayer.addInventoryItem('becherovka_shot', 10)
end)

ESX.RegisterUsableItem('liqueur_apple', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('liqueur_apple', 1)
	xPlayer.addInventoryItem('liqueur_apple_shot', 10)
end)

ESX.RegisterUsableItem('aperol', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('aperol', 1)
	xPlayer.addInventoryItem('aperol_shot', 10)
end)

ESX.RegisterUsableItem('prosecco', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('prosecco', 1)
	xPlayer.addInventoryItem('prosecco_shot', 10)
end)

ESX.RegisterUsableItem('tequila_gold', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('tequila_gold', 1)
	xPlayer.addInventoryItem('tequila_gold_shot', 10)
end)

ESX.RegisterUsableItem('tequila', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('tequila', 1)
	xPlayer.addInventoryItem('tequila_shot', 10)
end)

ESX.RegisterUsableItem('rhum', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('rhum', 1)
	xPlayer.addInventoryItem('rhum_shot', 10)
end)

ESX.RegisterUsableItem('vodka', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('vodka', 1)
	xPlayer.addInventoryItem('vodka_shot', 10)
end)

ESX.RegisterUsableItem('jager', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('jager', 1)
	xPlayer.addInventoryItem('jager_shot', 10)
end)

ESX.RegisterUsableItem('rhum_dark', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('rhum_dark', 1)
	xPlayer.addInventoryItem('rum_shot', 10)
end)