local ESX = nil

local PlayerTickets = {}

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

TriggerEvent('esx_phone:registerNumber', 'casino', 'Kasino', true, true)
TriggerEvent('esx_society:registerSociety', 'casino', 'casino', 'society_casino', 'society_casino', 'society_casino', {type = 'private'})

ESX.RegisterServerCallback('esx_casinojob:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	cb({items = xPlayer.inventory})
end)


ESX.RegisterServerCallback('esx_casino:payEntry', function(source, cb, type, price)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerMoney = xPlayer.getAccount('bank').money
    local societyAccount = nil

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_casino' , function(account)
        societyAccount = account
    end)
    
    if price <= playerMoney then
        xPlayer.setAccountMoney('bank', playerMoney - price)
        societyAccount.addMoney(price)
        PlayerTickets[xPlayer.identifier] = type
        local url = 'https://discordapp.com/api/webhooks/733722602325016576/vehGtGDtuubenfGcXD4eOH07o9HbmcZHkY3CxBiY_xndylZsM4UjqXkl_m_JV_UvVNAr'
        local time = os.date("%d/%m/%Y %X")
        local name = GetPlayerName(source)
        local identifier = GetPlayerIdentifiers(source)
        local msg = time .. ' : ' .. name .. ' - ' .. identifier[1] .. ' : zaplatil/a ' .. price .. ' za vstup'
        PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
        cb(true)
    else
        cb(false)
    end
end)


RegisterServerEvent('esx_casinojob:smenaZetonu')
AddEventHandler('esx_casinojob:smenaZetonu', function(type, amount)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local societyAccount = nil

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_casino' , function(account)
        societyAccount = account
    end)

    if type == 'nakupzetonu' then
        local playerMoney = xPlayer.getMoney()

        if amount <= playerMoney then
            xPlayer.addInventoryItem('zetony', amount)
            xPlayer.removeMoney(amount)
            societyAccount.addMoney(amount)
            xPlayer.showNotification('Nakoupil/a sis zetony')
            sendZetonyToDiscord(_source, 'nakoupil/a', amount)
        else
            xPlayer.showNotification('Na nakup nemas dostatek hotovosti')
        end

    elseif type == 'prodejzetonu' then
        local playerZetony = xPlayer.getInventoryItem('zetony').count

        if amount <= playerZetony then
            xPlayer.removeInventoryItem('zetony', amount)
            xPlayer.addMoney(amount)
            societyAccount.removeMoney(amount)
            xPlayer.showNotification('Prodal/a si zetony')
            sendZetonyToDiscord(_source, 'prodal/a', amount)
        else
            xPlayer.showNotification('Na prodej nemas dostatek zetonu')
        end
    end
end)

RegisterServerEvent('esx_casinojob:doplneniZetonu')
AddEventHandler('esx_casinojob:doplneniZetonu', function(amount)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local societyAccount = nil

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_casino' , function(account)
        societyAccount = account
    end)

    local playerZetony = xPlayer.getInventoryItem('cards').count

    if amount <= playerZetony then
        xPlayer.removeInventoryItem('cards', amount)
        local price = 65 * amount
        xPlayer.addMoney(price * 0.4)
        societyAccount.addMoney(price * 0.6)

        xPlayer.showNotification('Doplnil/a si karty')
        sendZetonyToDiscord(_source, 'doplnil/a', amount)
    else
        xPlayer.showNotification('Na doplneni nemas dostatek karet')
    end
end)

function sendZetonyToDiscord (source, action, count)
    local time = os.date("%d/%m/%Y %X")
	local name = GetPlayerName(source)
	local identifier = GetPlayerIdentifiers(source)
	local msg = time .. ' : ' .. name .. ' - ' .. identifier[1] .. ' : ' .. action .. ' x' .. count .. ' karet'
	local url = 'https://discordapp.com/api/webhooks/730481241324912764/XARmGgs185h4iYolz2r1EIuXg_NVze5e9n-znS3afKVacMz8hUNzr3p2dhN6X64g_Ahs'
	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end

-- PRACKA

function secondsToClock(seconds)
  local seconds = tonumber(seconds)

  if seconds <= 0 then
    return "00:00:00";
  else
    hours = string.format("%02.f", math.floor(seconds/3600));
    mins = string.format("%02.f", math.floor(seconds/60 - (hours*60)));
    secs = string.format("%02.f", math.floor(seconds - hours*3600 - mins *60));
    return hours..":"..mins..":"..secs
  end
end

RegisterServerEvent('esx_casinojob:washMoney')
AddEventHandler('esx_casinojob:washMoney', function(usersAmount)
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local tax = math.random(75, 95) / 100
	local amount = ESX.Math.Round(tonumber(usersAmount))
	local washedCash = amount * tax
	local washedTotal = ESX.Math.Round(tonumber(washedCash))

	sendLogToDiscord(source, usersAmount, amount, tax, washedCash, washedTotal)

    local timer = 5000
    local timeClock = ESX.Math.Round(timer / 1000)

    if amount > 0 and xPlayer.getAccount('black_money').money >= amount then
        xPlayer.removeAccountMoney('black_money', amount)
        TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_have_washed_waiting') ..  secondsToClock(timeClock))
        Citizen.Wait(timer)
        
        TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_have_received') .. ESX.Math.GroupDigits(washedTotal) .. _U('clean_money'))
        xPlayer.addMoney(washedTotal)
    else
        TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_amount'))
    end
end)

function sendLogToDiscord (source, usersAmount, amount, tax, washedCash, washedTotal)
    local time = os.date("%d/%m/%Y %X")
	local name = GetPlayerName(source)
	local identifier = GetPlayerIdentifiers(source)
	local washInfo = 'zadal: ' .. usersAmount .. ', vypocitano: ' .. amount .. ', poplatek: ' .. tax .. ', dostane: ' .. washedCash .. ', zaokrouhlene: ' .. washedTotal
	local msg = time .. ' : ' .. name .. ' - ' .. identifier[1] .. ' : ' .. 'pere penize: ' .. washInfo
	local url = 'https://discordapp.com/api/webhooks/730444100121395380/mtP9lbRIK8XHNWYkn4VuPeTDn27Rhb9dFdURWkk33aVikuw4yroCgNP2NzuoOHSSF7dM'
	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end


-- HARVEST KARET
local FarmingPlayers = {}


RegisterServerEvent('esx_casinojob:startFarming')
AddEventHandler('esx_casinojob:startFarming', function()
    local _source = source
    
    if not FarmingPlayers[_source] then
        local timeHash = os.time()
        FarmingPlayers[_source] = timeHash

        local xPlayer = ESX.GetPlayerFromId(_source)
        harvest(_source, xPlayer, timeHash)
    end
end)


local harvestTime = 2000
function harvest (source, xPlayer, timeHash)
    if FarmingPlayers[source] then
        SetTimeout(harvestTime, function()
            if FarmingPlayers[source] == timeHash then
                xPlayer.addInventoryItem('cards', 1)
                harvest(source, xPlayer, timeHash)
            end
        end)
	end
end

RegisterServerEvent('esx_casinojob:stopFarming')
AddEventHandler('esx_casinojob:stopFarming', function()
    local _source = source
    FarmingPlayers[_source] = false
end)