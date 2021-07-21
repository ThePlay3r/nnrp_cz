local ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

local isRoll = false


local isCarAllowed = false
local isBigMoneyAllowed = false

RegisterServerEvent('esx_tpnrp_luckywheel:editPrices')
AddEventHandler('esx_tpnrp_luckywheel:editPrices', function(type, state)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local job = xPlayer.job.name

    if job == 'casino' then
        if type == 'car' then
            isCarAllowed = state
        end
        if type == 'money' then
            isBigMoneyAllowed = state
        end
    end
end)

ESX.RegisterServerCallback('esx_tpnrp_luckywheel:getLuckyWheelSettings', function(source, cb)
    cb({isCarAllowed = isCarAllowed, isBigMoneyAllowed = isBigMoneyAllowed})
end)

local PriceIndexes = {
    CAR = {12},
    BIG_MONEY = {19},
    VIP_PARTY = {6},
    MONEY = {4,8,11,16},
    TICKET = {3,7,15,20},
    NOTHING = {2,10,14,18},
    DRINK = {1,5,9,13,17},
}
local PriceChance = {
    CAR = 1,
    BIG_MONEY = 3,
    VIP_PARTY = 5,
    MONEY = 10,
    DRINK = 35,
    TICKET = 35,
    NOTHING = 40,
}
local PricesLabel = {
    CAR = 'Vyhral/a jsi auto! O vyhru se muzes prihlasit u obsluhy',
    BIG_MONEY = 'Vyhral/a jsi $500 000. Penize ti vyplatime v hotovosti',
    VIP_PARTY = 'Vyhral/a jsi VIP PARTY v Penthousu. O vyhru se muzes prihlasit u obsluhy',
    MONEY = 'Vyhral/a jsi $50 000. Penize ti vyplatime v hotovosti',
    DRINK = 'Vyhral/a jsi ALL YOU CAN DRINK na jeden vecer. O vyhru se muzes prihlasit u obsluhy',
    TICKET = 'Vyhral/a jsi GOLD/PLATINUM ticket. O vyhru se muzes prihlasit u obsluhy',
    NOTHING = 'Bohuzel jsi nevyhral/a nic. Hodne stesti priste',
}

function payPrices (xPlayer, winItem)
    local societyAccount = nil
    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_casino', function(account)
        societyAccount = account
    end)
    if winItem == 'BIG_MONEY' then
        xPlayer.addMoney(500000)
        societyAccount.removeMoney(500000)
    end
    if winItem == 'MONEY' then
        xPlayer.addMoney(50000)
        societyAccount.removeMoney(50000)
    end
end

function pickPrice ()
    local possiblePrices = {}
    if isCarAllowed then
        for i = 1, PriceChance.CAR, 1 do
            table.insert(possiblePrices, 'CAR')
        end
    end
    if isBigMoneyAllowed then
        for i = 1, PriceChance.BIG_MONEY, 1 do
            table.insert(possiblePrices, 'BIG_MONEY')
        end
    end

    for i = 1, PriceChance.VIP_PARTY, 1 do
        table.insert(possiblePrices, 'VIP_PARTY')
    end
    for i = 1, PriceChance.MONEY, 1 do
        table.insert(possiblePrices, 'MONEY')
    end
    for i = 1, PriceChance.DRINK, 1 do
        table.insert(possiblePrices, 'DRINK')
    end
    for i = 1, PriceChance.TICKET, 1 do
        table.insert(possiblePrices, 'TICKET')
    end
    for i = 1, PriceChance.NOTHING, 1 do
        table.insert(possiblePrices, 'NOTHING')
    end

    local winItem = possiblePrices[math.random(1, #possiblePrices)]
    local winItemsIndexes = PriceIndexes[winItem]
    
    local hasMoreIndexes = #winItemsIndexes
    local winIndex = PriceIndexes[winItem][1]

    if hasMoreIndexes then
        winIndex = PriceIndexes[winItem][math.random(1, #PriceIndexes[winItem])]
    end
    
    return {index = winIndex, label = PricesLabel[winItem], winItem = winItem}
end


ESX.RegisterServerCallback('esx_tpnrp_luckywheel:pickPrice', function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local itemCount = xPlayer.getInventoryItem('lucky_wheel_ticket').count
    local hasItem = itemCount >= 1
    
    if not isRoll then
        if xPlayer ~= nil then
            if hasItem then
                xPlayer.removeInventoryItem('lucky_wheel_ticket', 1)
                isRoll = true
                local _prices = pickPrice()
                local priceIndex = _prices.index

                cb(priceIndex)
                SetTimeout(12000, function()
                    isRoll = false
                    TriggerClientEvent('esx:showNotification', _source, _prices.label)
                    discordLog(_prices.label, source)
                    payPrices(xPlayer, _prices.winItem)
                end)
            else
                cb(false)
                TriggerClientEvent('esx:showNotification', _source, "Kolem stesti nemuzes zatocit bez listku")
            end
        end
    end
end)

ESX.RegisterServerCallback('esx_tpnrp_luckywheel:hasItem', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local itemCount = xPlayer.getInventoryItem('lucky_wheel_ticket').count
    local hasItem = itemCount >= 1
    cb(hasItem)
end)

function discordLog(text, source)
	local time = os.date("%d.%m.%Y %X")
	local name = GetPlayerName(source)
	local identifier = GetPlayerIdentifiers(source)
	local msg = time .. ' : ' .. name .. ' - ' .. identifier[1] .. ' : ' .. text
    local LogUrl = 'https://discordapp.com/api/webhooks/730363326110105601/AU_jxC1DCMxbojT5iYkxvWkJDv273PdXZgN2yiuDH9P7PpaYzRt4ZnTV4wupEPqSKkug'
	PerformHttpRequest(LogUrl, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end
