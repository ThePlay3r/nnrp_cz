local ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

local PlayerCooking = {}

function cookMeal (recipe, recipeName, _source, timeHash)
    SetTimeout(recipe.time, function()
        if PlayerCooking[_source] == timeHash then
            local xPlayer = ESX.GetPlayerFromId(_source)
            local ingredients = recipe.ingredients
            local hasAllIngredients = true
            PlayerCooking[_source] = nil

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
            PlayerCooking[_source] = nil
        end
    end)
end

RegisterServerEvent('cooking:cookMeal')
AddEventHandler('cooking:cookMeal', function(recipeName, society)
    local _source = source
    
    TriggerClientEvent('esx:showNotification', _source, _U('assembling_cocktail'))

    local recipe = Config.Recepty[society][recipeName]
    if not PlayerCooking[_source] then
        local timeHash = os.time()
        PlayerCooking[_source] = timeHash
        cookMeal(recipe, recipeName, _source, timeHash)
    end
end)

RegisterServerEvent('cooking:buyItem')
AddEventHandler('cooking:buyItem', function(society, itemName, price, itemLabel)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local limit = xPlayer.getInventoryItem(itemName).limit
    local qtty = xPlayer.getInventoryItem(itemName).count
    local societyAccount = nil

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_' .. society, function(account)
        societyAccount = account
    end)

    if societyAccount ~= nil and societyAccount.money >= price * 25 then
        if qtty < limit then
            societyAccount.removeMoney(price * 25)
            xPlayer.addInventoryItem(itemName, 25)
            sendLogToDiscord(source, society, itemLabel)
            TriggerClientEvent('esx:showNotification', _source, _U('bought') .. itemLabel)
        else
            TriggerClientEvent('esx:showNotification', _source, _U('max_item'))
        end
    else
        TriggerClientEvent('esx:showNotification', _source, _U('pasassezargent'))
    end

end)

function sendLogToDiscord (source, society, text)
    local time = os.date("%d/%m/%Y %X")
	local name = GetPlayerName(source)
	local identifier = GetPlayerIdentifiers(source)
	local msg = time .. ' : ' .. name .. ' - ' .. identifier[1] .. ' koupil: ' .. text
	PerformHttpRequest(Config.Logy[society], function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end

local function Sell(source, society)
    local xPlayer = ESX.GetPlayerFromId(source)
    local itemsSold = 0
    local totalCash = 0
    local itemsToSold = Config.Sell[society].Items

    for k,v in ipairs(itemsToSold) do
        if xPlayer.getInventoryItem(v.item) and xPlayer.getInventoryItem(v.item).count > 0 then
            local playerCount = xPlayer.getInventoryItem(v.item).count
            itemsSold = itemsSold + playerCount
            totalCash = totalCash + (playerCount * v.price)
            xPlayer.removeInventoryItem(v.item, playerCount)
        end
    end

    if itemsSold == 0 then
        xPlayer.showNotification('Nemas nic na prodej.')
    else
        local societyAccount = nil
        local societyName = 'cozinheiro'
        if society == 'steakhouse' then
            societyName = 'gang'
        elseif society == 'coffee' then
            societyName = 'coffee'
        end
        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_' .. societyName, function(account)
            societyAccount = account
        end)

        if societyAccount ~= nil then
            societyAccount.addMoney(totalCash * 0.55)
            xPlayer.addMoney(totalCash * 0.45)
            xPlayer.showNotification('Prodal/a jsi ' .. itemsSold .. ' vyrobku za ' .. totalCash * 0.45 .. ' pro sebe a ' .. totalCash * 0.55 .. ' pro firmu.')

            local msg = GetPlayerName(source) .. " prodal/a " .. itemsSold .. " vyrobku za " .. totalCash * 0.45 .. ' pro sebe a ' .. totalCash * 0.55 .. ' pro firmu.'
            local url = "https://discordapp.com/api/webhooks/720243576033902672/oXIe3owyFu5ZFDopmxAj2R8zIztt6OTNk6hfRqE68y7xXD9BISNQ8j1Vqd8ILYEjL9qO"
            if society == 'steakhouse' then
                url = 'https://discordapp.com/api/webhooks/726192734767153243/xR9SWwWcSr_oicy4ZN7RaAhUPO1O4IYLinHLkIrFDsqP32CRqCwPOUwI-e0PT6TUTrNk'
            elseif society == 'coffee' then
                url = 'https://discordapp.com/api/webhooks/737756963882139680/nMV_1z1obraqBRTIlZpUmeIhsN27z6f6podMgMsOmVfs3BrBffY1NR_izkpPQt0wlDSF'
            end
            PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})

            itemsSold = 0
            totalCash = 0
        end
    end
end

RegisterServerEvent('cooking:startSell')
AddEventHandler('cooking:startSell', function(society)
	local _source = source
    Sell(_source, society)
end)