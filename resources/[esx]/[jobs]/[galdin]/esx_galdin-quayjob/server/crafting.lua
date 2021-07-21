local ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

local PlayerCrafting = {}

function craftingCoktails (recipe, recipeName, _source, timeHash)
    SetTimeout(recipe.time, function()
        if PlayerCrafting[_source] == timeHash then
            local xPlayer = ESX.GetPlayerFromId(_source)
            local ingredients = recipe.ingredients
            local hasAllIngredients = true
            PlayerCrafting[_source] = nil

            for index, item in ipairs(ingredients) do
                local foundItem = xPlayer.getInventoryItem(item.name)

                if foundItem == nil then
                    TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. item.label .. '~w~')
                    hasAllIngredients = false
                end

                local count = xPlayer.getInventoryItem(item.name).count

                if item.count > count then
                    TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. item.label .. '~w~')
                    hasAllIngredients = false
                end
            end

            if hasAllIngredients then
                local chanceToMiss = math.random(100)
                
                if chanceToMiss <= Config.ChanceToFailCrafting then
                    TriggerClientEvent('esx:showNotification', _source, _U('craft_miss'))
                else
                    TriggerClientEvent('esx:showNotification', _source, _U('craft') .. recipeName .. ' ~w~!')
                    xPlayer.addInventoryItem(recipe.craftItem, 1)
                end

                for index, item in ipairs(ingredients) do
                    xPlayer.removeInventoryItem(item.name, item.count)
                end
            end
        else
            PlayerCrafting[_source] = nil
        end
    end)
end

RegisterServerEvent('esx_galdinjob:craftingCoktails')
AddEventHandler('esx_galdinjob:craftingCoktails', function(recipeName, isCoffee, isShots, isWedding)
    local _source = source
    
    TriggerClientEvent('esx:showNotification', _source, _U('assembling_cocktail'))

    local recipe

    if isCoffee then
       recipe = Config.CraftingCoffee[recipeName]
    elseif isShots then
        recipe = Config.CraftingShots[recipeName]
    elseif isWedding then
        recipe = Config.Svatba[recipeName]
    else
       recipe = Config.Crafting[recipeName]
    end
    
    if not PlayerCrafting[_source] then
        local timeHash = os.time()
        PlayerCrafting[_source] = timeHash
        craftingCoktails(recipe, recipeName, _source, timeHash)
    end
end)