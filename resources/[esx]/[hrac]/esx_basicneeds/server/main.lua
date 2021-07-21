ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

ESX.RegisterUsableItem('bread', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('bread', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 175000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_bread'))
end)

ESX.RegisterUsableItem('cake_qwearty', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('cake_qwearty', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 800000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi kousek z narozeninoveho dortu')
end)

-- RANCh
ESX.RegisterUsableItem('mleko', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('mleko', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
	TriggerClientEvent('esx_status:add', source, 'hunger', 80000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Vypil/a jsi mleko')
end)
ESX.RegisterUsableItem('smetana', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('smetana', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
	TriggerClientEvent('esx_status:add', source, 'hunger', 80000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Vypil/a jsi smetanu')
end)
ESX.RegisterUsableItem('slehacka', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('slehacka', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 80000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi slehacu')
end)
ESX.RegisterUsableItem('manteiga', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('manteiga', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 80000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi maslo')
end)
ESX.RegisterUsableItem('queijo', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('queijo', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 125000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi syr')
end)
-- RANCH

ESX.RegisterUsableItem('bolchips', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('bolchips', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_bolchips'))
end)

ESX.RegisterUsableItem('pizza_slice_cheese', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('pizza_slice_cheese', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi kousek pizzy')
end)

ESX.RegisterUsableItem('pizza_slice_margarita', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('pizza_slice_margarita', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi kousek pizzy')
end)

ESX.RegisterUsableItem('pizza_slice_salami', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('pizza_slice_salami', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi kousek pizzy')
end)

ESX.RegisterUsableItem('bolpistache', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeInventoryItem('bolpistache', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 125000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_bolpistache'))
end)

ESX.RegisterUsableItem('bolcacahuetes', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeInventoryItem('bolcacahuetes', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 135000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_bolcacahuetes'))
end)

ESX.RegisterUsableItem('baguette', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeInventoryItem('baguette', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 250000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_baguette'))
end)

ESX.RegisterUsableItem('chocolate', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeInventoryItem('chocolate', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 175000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_chocolate'))
end)

ESX.RegisterUsableItem('saucisson', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('saucisson', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 120000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_saucisson'))
end)

ESX.RegisterUsableItem('grapperaisin', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('grapperaisin', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 80000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_grapperaisin'))
end)

ESX.RegisterUsableItem('bolnoixcajou', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('bolnoixcajou', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 90000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_bolnoixcajou'))
end)

ESX.RegisterUsableItem('apple', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('apple', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 25000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 50000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_apple'))
end)

ESX.RegisterUsableItem('pomrdanc', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('pomrdanc', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 25000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 50000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_pomrdanc'))
end)

ESX.RegisterUsableItem('avocado', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('avocado', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 25000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi avokado')
end)

ESX.RegisterUsableItem('coco', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('coco', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 25000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi kokos')
end)

ESX.RegisterUsableItem('lime', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('lime', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 25000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 50000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi limetku')
end)

ESX.RegisterUsableItem('mango', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('mango', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 25000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 50000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi mango')
end)

ESX.RegisterUsableItem('strawberries', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('strawberries', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 25000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 50000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi jahody')
end)

ESX.RegisterUsableItem('carrot', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('carrot', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 25000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi mrkev')
end)

ESX.RegisterUsableItem('cucumber', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('cucumber', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 25000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 50000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi okurku')
end)

ESX.RegisterUsableItem('alface', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('alface', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 25000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi zeli')
end)

ESX.RegisterUsableItem('lemon', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('lemon', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 25000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 50000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi citron')
end)

ESX.RegisterUsableItem('tomate', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('tomate', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 25000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 50000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi rajce')
end)

ESX.RegisterUsableItem('pepperoni', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('pepperoni', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 25000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi papriku')
end)

ESX.RegisterUsableItem('raisin', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('raisin', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_raisin'))
end)

--steakhouse
ESX.RegisterUsableItem('polevka_rajcatova', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('polevka_rajcatova', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 550000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_polevka_rajcatova'))
end)

ESX.RegisterUsableItem('polevka_syrova', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('polevka_syrova', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 550000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_polevka_syrova'))
end)

ESX.RegisterUsableItem('polevka_minestrone', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('polevka_minestrone', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 600000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_polevka_minestrone'))
end)

ESX.RegisterUsableItem('spagety', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('spagety', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 850000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_spagety'))
end)

ESX.RegisterUsableItem('spagety_carbonara', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('spagety_carbonara', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 850000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_spagety_carbonara'))
end)

ESX.RegisterUsableItem('spagety_bucatini', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('spagety_bucatini', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 820000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_spagety_bucatini'))
end)

ESX.RegisterUsableItem('spagety_pomodoro', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('spagety_pomodoro', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 835000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_spagety_pomodoro'))
end)

ESX.RegisterUsableItem('spagety_aglio', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('spagety_aglio', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 845000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_spagety_aglio'))
end)

ESX.RegisterUsableItem('lasagne', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('lasagne', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 870000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_lasagne'))
end)

ESX.RegisterUsableItem('pizza_salami', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('pizza_salami', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 1000000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_pizza_salami'))
end)

ESX.RegisterUsableItem('pizza_4formaggi', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('pizza_4formaggi', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 1000000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_pizza_4formaggi'))
end)

ESX.RegisterUsableItem('pizza_margarita', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('pizza_margarita', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 1000000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_pizza_margarita'))
end)

ESX.RegisterUsableItem('pizza_prosciutto', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('pizza_prosciutto', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 1000000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_pizza_prosciutto'))
end)

ESX.RegisterUsableItem('pizza_funghi', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('pizza_funghi', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 1000000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_pizza_funghi'))
end)

ESX.RegisterUsableItem('tiramisu', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('tiramisu', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 300000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_tiramisu'))
end)

ESX.RegisterUsableItem('panna_cotta', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('panna_cotta', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 320000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_panna_cotta'))
end)

ESX.RegisterUsableItem('tivoli_strada', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('tivoli_strada', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 300000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_tivoli_strada'))
end)

-- ostatni
ESX.RegisterUsableItem('tresen', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('tresen', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 40000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_tresen'))
end)

ESX.RegisterUsableItem('olives', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('olives', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 20000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_olives'))
end)


 --Piti

ESX.RegisterUsableItem('water', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('water', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 220000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_water'))
end)

ESX.RegisterUsableItem('soda', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('soda', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 180000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_soda'))
end)

ESX.RegisterUsableItem('cinderella', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('cinderella', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 180000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vypil/a jsi cinderellu')
end)

ESX.RegisterUsableItem('nojito', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('nojito', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 180000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vypil/a jsi nojito')
end)

ESX.RegisterUsableItem('safe_sex_on_the_beach', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('safe_sex_on_the_beach', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 180000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vypil/a jsi safe sex on the beach')
end)

ESX.RegisterUsableItem('virgin_margarita', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('virgin_margarita', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 180000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vypil/a jsi virgin margaritu')
end)

ESX.RegisterUsableItem('virgin_pina_colada', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('virgin_pina_colada', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 180000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vypil/a jsi virgin pina coladu')
end)

ESX.RegisterUsableItem('limonade', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('limonade', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_limonade'))
end)

ESX.RegisterUsableItem('icetea', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('icetea', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 280000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_icetea'))
end)

ESX.RegisterUsableItem('drpepper', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('drpepper', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 245000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_drpepper'))
end)

ESX.RegisterUsableItem('energy', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('energy', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 235000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_energy'))
end)

ESX.RegisterUsableItem('cocacola', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('cocacola', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 255000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_cocacola'))
end)

ESX.RegisterUsableItem('sprunk', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('sprunk', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 255000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vypil/a jsi sprunk')
end)

ESX.RegisterUsableItem('fanta', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('fanta', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 255000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vypil/a jsi fantu')
end)


ESX.RegisterUsableItem('coffee', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('coffee', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 190000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_coffee'))
end)

ESX.RegisterUsableItem('jusfruit', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('jusfruit', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 220000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_jusfruit'))
end)

ESX.RegisterUsableItem('liquer_apple', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('liquer_apple', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 210000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_liquer_apple'))
end)

ESX.RegisterUsableItem('tonic', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('tonic', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 205000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_tonic'))
end)

ESX.RegisterUsableItem('liquer_curacao', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('liquer_curacao', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 180000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_liquer_curacao'))
end)

ESX.RegisterUsableItem('juice_ananas', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('juice_ananas', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 215000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_juice_ananas'))
end)


ESX.RegisterUsableItem('juice_apple', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('juice_apple', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 215000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vypil/a jsi jablecný dzus')
end)

ESX.RegisterUsableItem('juice_orange', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('juice_orange', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 215000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vypil/a jsi pomerancovy dzus')
end)

ESX.RegisterUsableItem('mleko', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('mleko', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 195000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_mleko'))
end)

ESX.RegisterUsableItem('liquer_orange', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('liquer_orange', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 210000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_liquer_orange'))
end)

ESX.RegisterUsableItem('juice_brusinka', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('juice_brusinka', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 215000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_juice_brusinka'))
end)

ESX.RegisterUsableItem('gomme', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('gomme', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 185000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_gomme'))
end)

ESX.RegisterUsableItem('grenadina', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('grenadina', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 185000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_grenadina'))
end)

ESX.RegisterUsableItem('liquer_peach', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('liquer_peach', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 205000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_liquer_peach'))
end)

ESX.RegisterUsableItem('liquer_coffee', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('liquer_coffee', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 195000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_liquer_coffee'))
end)

ESX.RegisterUsableItem('raisin', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('raisin', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 75000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_raisin'))
end)

ESX.RegisterUsableItem('grapperaisin', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('grapperaisin', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 60000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_grapperaisin'))
end)

--steakhouse
ESX.RegisterUsableItem('hot_chocolate', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('hot_chocolate', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 650000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_hot_chocolate'))
end)

ESX.RegisterUsableItem('kava_espresso', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('kava_espresso', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 550000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_kava_espresso'))
end)

ESX.RegisterUsableItem('tea', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('tea', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 850000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_tea'))
end)

ESX.RegisterUsableItem('tea_black', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('tea_black', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 850000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_tea'))
end)

ESX.RegisterUsableItem('tea_fruit', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('tea_fruit', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 850000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_tea'))
end)

ESX.RegisterUsableItem('energy_drink', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('energy_drink', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 500000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_energy_drink'))
end)

-- KAFE
ESX.RegisterUsableItem('kava_ristretto', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('kava_ristretto', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_coffee'))
end)
ESX.RegisterUsableItem('kava_espresso', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('kava_espresso', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_coffee'))
end)
ESX.RegisterUsableItem('kava_macchiato', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('kava_macchiato', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_coffee'))
end)
ESX.RegisterUsableItem('kava_americano', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('kava_americano', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_coffee'))
end)
ESX.RegisterUsableItem('kava_cappuccino', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('kava_cappuccino', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_coffee'))
end)
ESX.RegisterUsableItem('kava_flat_white', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('kava_flat_white', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_coffee'))
end)
ESX.RegisterUsableItem('kava_latte', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('kava_latte', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_coffee'))
end)
ESX.RegisterUsableItem('kava_latte_macchiato', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('kava_latte_macchiato', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_coffee'))
end)
ESX.RegisterUsableItem('caramel_frappuccino', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('caramel_frappuccino', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_coffee'))
end)
ESX.RegisterUsableItem('icecoffee', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('icecoffee', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_coffee'))
end)

-- Zensai
ESX.RegisterUsableItem('cupcake', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('cupcake', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 300000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_cupcake'))
end)

ESX.RegisterUsableItem('cookie', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('cookie', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 300000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi cookie')
end)
ESX.RegisterUsableItem('donut', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('donut', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 300000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi donut')
end)
ESX.RegisterUsableItem('ice_cream', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('ice_cream', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 400000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi zmrzlinu')
end)
ESX.RegisterUsableItem('sandwich_cheese', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('sandwich_cheese', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi syrovy sandwich')
end)
ESX.RegisterUsableItem('sandwich_ham', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('sandwich_ham', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi sunkovy sandwich')
end)


ESX.RegisterUsableItem('tapioca_puding', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('tapioca_puding', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 300000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi tapioca puding')
end)

ESX.RegisterUsableItem('pancakes', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('pancakes', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 300000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_pancakes'))
end)

ESX.RegisterUsableItem('marlenka', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('marlenka', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 300000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_marlenka'))
end)

ESX.RegisterUsableItem('banh_mi', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('banh_mi', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_banh_mi'))
end)

ESX.RegisterUsableItem('mochi', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('mochi', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 450000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_mochi'))
end)

ESX.RegisterUsableItem('onigiri', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('onigiri', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 1000000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_onigiri'))
end)

ESX.RegisterUsableItem('sushi_california', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('sushi_california', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 1000000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_sushi'))
end)

ESX.RegisterUsableItem('temaki', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('temaki', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 1000000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_sushi'))
end)

ESX.RegisterUsableItem('temari', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('temari', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 1000000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_sushi'))
end)

ESX.RegisterUsableItem('tamago', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('tamago', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 1000000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_sushi'))
end)

ESX.RegisterUsableItem('gunkan', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('gunkan', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 1000000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_sushi'))
end)

ESX.RegisterUsableItem('sushi_sashimi', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('sushi_sashimi', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 1000000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_sushi'))
end)

ESX.RegisterUsableItem('sushi_maki', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('sushi_maki', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 1000000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_sushi'))
end)

ESX.RegisterUsableItem('sushi_nigiri', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('sushi_nigiri', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 1000000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_sushi'))
end)

ESX.RegisterUsableItem('ginger', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('ginger', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 20000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source,'Snedl/a jsi zazvor')
end)

ESX.RegisterUsableItem('wasabi', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('wasabi', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 20000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source,'Snedl/a jsi wasabi')
end)

ESX.RegisterUsableItem('soy_sauce', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('soy_sauce', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 20000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source,'Snedl/a jsi sojovku')
end)

ESX.RegisterUsableItem('mango_pudink', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('mango_pudink', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 400000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_mango_pudink'))
end)

ESX.RegisterUsableItem('kolacky_stesti', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('kolacky_stesti', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 300000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_kolacky_stesti'))
end)

ESX.RegisterUsableItem('tapioca', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('tapioca', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 400000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_tapioca'))
end)

ESX.RegisterUsableItem('icecream_sesame', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('icecream_sesame', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 300000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_icecream_sesame'))
end)

ESX.RegisterUsableItem('soba_bowl', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('soba_bowl', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 900000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_soba_bowl'))
end)

ESX.RegisterUsableItem('ahi_poke', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('ahi_poke', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 900000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_ahi_poke'))
end)

ESX.RegisterUsableItem('tigercry_steak', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('tigercry_steak', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 900000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_tigercry_steak'))
end)

ESX.RegisterUsableItem('mu_shu', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('mu_shu', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 900000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_mu_shu'))
end)

ESX.RegisterUsableItem('togu_nuggets', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('togu_nuggets', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 900000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_togu_nuggets'))
end)

ESX.RegisterUsableItem('kungpao', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('kungpao', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 900000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_kungpao'))
end)

ESX.RegisterUsableItem('dumplings', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('dumplings', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 900000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_dumplings'))
end)

ESX.RegisterUsableItem('soup_noodle', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('soup_noodle', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 600000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_soup_noodle'))
end)

ESX.RegisterUsableItem('soup_egg', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('soup_egg', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 600000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_soup_egg'))
end)

ESX.RegisterUsableItem('soup_wonton', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('soup_wonton', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 600000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_soup_wonton'))
end)

ESX.RegisterUsableItem('soup_coco', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('soup_coco', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 600000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_soup_coco'))
end)

ESX.RegisterUsableItem('soup_misoramen', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('soup_misoramen', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 600000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_soup_misoramen'))
end)

ESX.RegisterUsableItem('soup_noodlecurry', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('soup_noodlecurry', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 600000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_soup_noodlecurry'))
end)

ESX.RegisterUsableItem('soup_napa', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('soup_napa', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 600000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_soup_napa'))
end)

ESX.RegisterUsableItem('potstickers', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('potstickers', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 400000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_potstickers'))
end)

ESX.RegisterUsableItem('zavitky', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('zavitky', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 400000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_zavitky'))
end)

ESX.RegisterUsableItem('chao_tom', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('chao_tom', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 400000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_chao_tom'))
end)

ESX.RegisterUsableItem('eggroll', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('eggroll', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 400000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_eggroll'))
end)

ESX.RegisterUsableItem('chicken_wings', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('chicken_wings', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 400000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_chicken_wings'))
end)

ESX.RegisterUsableItem('avocado_dressing', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('avocado_dressing', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 400000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_avocado_dressing'))
end)

ESX.RegisterUsableItem('crab_rangoon', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('crab_rangoon', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 400000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_crab_rangoon'))
end)

ESX.RegisterUsableItem('vitelaass', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('vitelaass', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 600000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi opeceny steak')
end)

ESX.RegisterUsableItem('seakpotato', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('seakpotato', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 600000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi steak s bramborem')
end)

ESX.RegisterUsableItem('ribs', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('ribs', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 600000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi opecena zebirka')
end)

ESX.RegisterUsableItem('salmon', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('salmon', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 600000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi opeceneho lososa')
end)

ESX.RegisterUsableItem('bbq_baguette', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('bbq_baguette', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 600000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi opecenou bagetu')
end)

ESX.RegisterUsableItem('bbq_potato', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('bbq_potato', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 600000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi opeceny brambor')
end)

ESX.RegisterUsableItem('steak_ribeye', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('steak_ribeye', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 600000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi steak')
end)

ESX.RegisterUsableItem('steak_striploin', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('steak_striploin', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 600000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi steak')
end)

ESX.RegisterUsableItem('steak_tbone', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('steak_tbone', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 600000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi steak')
end)

ESX.RegisterUsableItem('steak_rumpsteak', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('steak_rumpsteak', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 600000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi steak')
end)

ESX.RegisterUsableItem('steak_flank', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('steak_flank', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 600000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi steak')
end)

ESX.RegisterUsableItem('burger_classic', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('burger_classic', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 800000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi burger')
end)

ESX.RegisterUsableItem('burger_texas', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('burger_texas', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 800000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi burger')
end)

ESX.RegisterUsableItem('burger_mtchiliad', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('burger_mtchiliad', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 800000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi burger')
end)

ESX.RegisterUsableItem('burger_ls', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('burger_ls', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 800000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi burger')
end)

ESX.RegisterUsableItem('hranolky', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('hranolky', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 400000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi hranolky')
end)

ESX.RegisterUsableItem('hranolky_steak', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('hranolky_steak', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 400000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi hranolky')
end)

ESX.RegisterUsableItem('brambory', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('brambory', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 400000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi brambory')
end)

ESX.RegisterUsableItem('onion_rings', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('onion_rings', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 400000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi cibulové krouzky')
end)

ESX.RegisterUsableItem('krokety', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('krokety', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 400000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi krokety')
end)

ESX.RegisterUsableItem('deer_burger', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('deer_burger', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 800000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi burger')
end)

ESX.RegisterUsableItem('doe_burger', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('doe_burger', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 800000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi burger')
end)

ESX.RegisterUsableItem('doe_steak', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('doe_steak', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 600000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi steak')
end)

ESX.RegisterUsableItem('deer_steak', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('deer_steak', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 600000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi burger')
end)

ESX.RegisterUsableItem('salad_caesar', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('salad_caesar', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 600000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi salát')
end)

ESX.RegisterUsableItem('salad_vege', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('salad_vege', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi salát')
end)

ESX.RegisterUsableItem('salad_tofu', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('salad_tofu', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 600000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, 'Snedl/a jsi salát')
end)