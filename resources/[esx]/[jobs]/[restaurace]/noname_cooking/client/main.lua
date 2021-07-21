local jobName                   = ''

local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local HasAlreadyEnteredMarker = false
local LastZone = nil

local ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	jobName = xPlayer.job.name
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    jobName = job.name
end)


AddEventHandler('cooking:hasEnteredMarker', function(zone)
    if zone == 'cooking' then
		CurrentAction     = 'menu_cooking'
		CurrentActionMsg  = _U('cooking_menu')
		CurrentActionData = {}
	end

	if zone == 'shop' then
		CurrentAction     = 'menu_shop'
		CurrentActionMsg  = _U('shop_menu')
		CurrentActionData = {}
    end
    
    if zone == 'sell' then
        CurrentAction     = 'menu_sell'
		CurrentActionMsg  = 'Zmáckni ~INPUT_CONTEXT~ pro prodej'
		CurrentActionData = {}
    end
end)

AddEventHandler('cooking:hasExitedMarker', function(zone)
	CurrentAction = nil
	ESX.UI.Menu.CloseAll()
end)

function OpenCookMenu ()
    local recipes = {}
    local society = nil
    local title = 'Sporak'

    if jobName == 'gang' then
        society = 'steakhouse'
    end
    if jobName == 'cozinheiro' then
        society = 'zensai'
    end
    if jobName == 'coffee' then
        title = 'Kavovar'
        society = 'coffee'
    end

    if society == nil then
        return
    end

    for key in pairs(Config.Recepty[society]) do
        table.insert(recipes, {label = key, value = key})
    end

    table.sort(recipes, function(a, b)
        return a.label < b.label
    end)

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'menu_cooking',
        {
            title = title,
            align = 'top-left',
            elements = recipes,
        },
        function(data, menu)
            menu.close()
            TriggerServerEvent('cooking:cookMeal', data.current.value, society)
            TriggerEvent('esx_galdinjob:doAnimation', { lib = "mini@drinking", anim = "shots_barman_b" })
        end,
        function(data, menu)
            menu.close()
        end
    )
end

exports('OpenCookMenu', OpenCookMenu)

function OpenShopMenu ()
    local elements = {}
    local society = nil

    if jobName == 'gang' then
        society = 'steakhouse'
    end
    if jobName == 'cozinheiro' then
        society = 'zensai'
    end
    if jobName == 'coffee' then
        society = 'coffee'
    end

    if society == nil then
        return
    end

	for i=1, #Config.Shopy[society].Items, 1 do
		local item = Config.Shopy[society].Items[i]

		table.insert(elements, {
			label = item.label  ..  ' '  .. item.price .. ' $',
			realLabel = item.label,
			value = item.name,
			price = item.price
		})
    end
    
    table.sort(elements, function(a, b)
        return a.label < b.label
    end)

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'menu_shop',
		{
			title    = 'Suroviny',
			elements = elements
		},
		function(data, menu)
			TriggerServerEvent('cooking:buyItem', jobName, data.current.value, data.current.price, data.current.realLabel)
		end,
		function(data, menu)
			menu.close()
		end
	)
end

-- Display markers
Citizen.CreateThread(function()
	while true do
        Wait(0)
        local society = nil

        if jobName == 'gang' then
            society = 'steakhouse'
        end
        if jobName == 'cozinheiro' then
            society = 'zensai'
        end
        if jobName == 'coffee' then
            society = 'coffee'
        end

        if society then
            local cooking = Config.Craftings[society]
            local cooking2 = Config.Craftings[society .. '2']
            local shop = Config.Shopy[society]
            local sell = Config.Sell[society]
            local coords = GetEntityCoords(GetPlayerPed(-1))
            
            if(cooking.Type ~= -1 and GetDistanceBetweenCoords(coords, cooking.Pos.x, cooking.Pos.y, cooking.Pos.z, true) < Config.MarkersDrawDistance) then
                DrawMarker(
                    cooking.Type, cooking.Pos.x, cooking.Pos.y, cooking.Pos.z,
                    0.0, 0.0, 0.0, 0, 0.0, 0.0,
                    cooking.Size.x, cooking.Size.y, cooking.Size.z, cooking.Color.r, cooking.Color.g, cooking.Color.b, 100,
                    false, false, 2, false, false, false, false
                )
            end

            if cooking2 and (cooking.Type ~= -1 and GetDistanceBetweenCoords(coords, cooking2.Pos.x, cooking2.Pos.y, cooking2.Pos.z, true) < Config.MarkersDrawDistance) then
                DrawMarker(
                    cooking2.Type, cooking2.Pos.x, cooking2.Pos.y, cooking2.Pos.z,
                    0.0, 0.0, 0.0, 0, 0.0, 0.0,
                    cooking2.Size.x, cooking2.Size.y, cooking2.Size.z, cooking2.Color.r, cooking2.Color.g, cooking2.Color.b, 100,
                    false, false, 2, false, false, false, false
                )
            end

            if(shop.Type ~= -1 and GetDistanceBetweenCoords(coords, shop.Pos.x, shop.Pos.y, shop.Pos.z, true) < Config.MarkersDrawDistance) then
                DrawMarker(
                    shop.Type, shop.Pos.x, shop.Pos.y, shop.Pos.z,
                    0.0, 0.0, 0.0, 0, 0.0, 0.0,
                    shop.Size.x, shop.Size.y, shop.Size.z, shop.Color.r, shop.Color.g, shop.Color.b, 100,
                    false, false, 2, false, false, false, false
                )
            end

            if (sell.Type ~= -1 and GetDistanceBetweenCoords(coords, sell.Pos.x, sell.Pos.y, sell.Pos.z, true) < Config.MarkersDrawDistance) then
                DrawMarker(
                    sell.Type, sell.Pos.x, sell.Pos.y, sell.Pos.z,
                    0.0, 0.0, 0.0, 0, 0.0, 0.0,
                    sell.Size.x, sell.Size.y, sell.Size.z, sell.Color.r, sell.Color.g, sell.Color.b, 100,
                    false, false, 2, false, false, false, false
                )
            end
		end
	end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do
        Wait(0)
        local society = nil

        if jobName == 'gang' then
            society = 'steakhouse'
        end
        if jobName == 'cozinheiro' then
            society = 'zensai'
        end
        if jobName == 'coffee' then
            society = 'coffee'
        end
        

        if society then
            local cooking = Config.Craftings[society]
            local cooking2 = Config.Craftings[society .. '2']
            local shop = Config.Shopy[society]
            local sell = Config.Sell[society]
			local coords = GetEntityCoords(GetPlayerPed(-1))
			local isInMarker = false
            local currentZone = nil

            if CurrentAction == nil then
				isInMarker = false
				currentZone = nil
				HasAlreadyEnteredMarker = false
			end

            if(GetDistanceBetweenCoords(coords, cooking.Pos.x, cooking.Pos.y, cooking.Pos.z, true) < cooking.Size.x) then
                isInMarker = true
                currentZone = 'cooking'
            end

            if cooking2 and (GetDistanceBetweenCoords(coords, cooking2.Pos.x, cooking2.Pos.y, cooking2.Pos.z, true) < cooking2.Size.x) then
                isInMarker = true
                currentZone = 'cooking'
            end

            if(GetDistanceBetweenCoords(coords, shop.Pos.x, shop.Pos.y, shop.Pos.z, true) < shop.Size.x) then
                isInMarker = true
                currentZone = 'shop'
            end

            if(GetDistanceBetweenCoords(coords, sell.Pos.x, sell.Pos.y, sell.Pos.z, true) < sell.Size.x) then
                isInMarker = true
                currentZone = 'sell'
            end

			if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
				HasAlreadyEnteredMarker = true
                LastZone = currentZone
				TriggerEvent('cooking:hasEnteredMarker', currentZone)
			end

			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('cooking:hasExitedMarker', LastZone)
			end
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

        if CurrentAction ~= nil then
            SetTextComponentFormat('STRING')
			AddTextComponentString(CurrentActionMsg)
			DisplayHelpTextFromStringLabel(0, 0, 1, -1)

            if IsControlJustReleased(0,  Config.Keys['E']) and (jobName == 'gang' or jobName == 'cozinheiro' or jobName == 'coffee') then
				if CurrentAction == 'menu_cooking' then
                    OpenCookMenu()
				end

				if CurrentAction == 'menu_shop' then
                    OpenShopMenu()
                end
                
                if CurrentAction == 'menu_sell' and jobName == 'cozinheiro' then
                    local society = 'zensai'
                    TriggerServerEvent('cooking:startSell', society)
                end
                
                if CurrentAction == 'menu_sell' and jobName == 'gang' then
                    local society = 'steakhouse'
                    TriggerServerEvent('cooking:startSell', society)
                end
                
                if CurrentAction == 'menu_sell' and jobName == 'coffee' then
                    local society = 'coffee'
                    TriggerServerEvent('cooking:startSell', society)
				end
				
				CurrentAction = nil
			end
		end
	end
end)