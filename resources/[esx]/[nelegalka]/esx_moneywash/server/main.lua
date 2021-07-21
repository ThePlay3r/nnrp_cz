ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

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

RegisterServerEvent('esx_moneywash:washMoney')
AddEventHandler('esx_moneywash:washMoney', function(usersAmount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local tax = math.random(70, 80) / 100
	local amount = ESX.Math.Round(tonumber(usersAmount))
	local washedCash = amount * tax
	local washedTotal = ESX.Math.Round(tonumber(washedCash))

	sendLogToDiscord(source, usersAmount, amount, tax, washedCash, washedTotal)

	if Config.enableTimer == true then
		local timer = Config.timer
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
	else 
	
		if amount > 0 and xPlayer.getAccount('black_money').money >= amount then
			xPlayer.removeAccountMoney('black_money', amount)
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_have_washed') .. ESX.Math.GroupDigits(amount) .. _U('dirty_money') .. _U('you_have_received') .. ESX.Math.GroupDigits(washedTotal) .. _U('clean_money'))
			xPlayer.addMoney(washedTotal)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_amount'))
		end
	end
	
end)

function sendLogToDiscord (source, usersAmount, amount, tax, washedCash, washedTotal)
    local time = os.date("%d/%m/%Y %X")
	local name = GetPlayerName(source)
	local identifier = GetPlayerIdentifiers(source)
	local washInfo = 'zadal: ' .. usersAmount .. ', vypocitano: ' .. amount .. ', poplatek: ' .. tax .. ', dostane: ' .. washedCash .. ', zaokrouhlene: ' .. washedTotal
	local msg = time .. ' : ' .. name .. ' - ' .. identifier[1] .. ' : ' .. 'pere penize: ' .. washInfo
	local url = 'https://discordapp.com/api/webhooks/712582570763878470/bErI_NjwvxigZ-Yew4CNCu0ucVxx-3Zia4VaH9ywORTsGcU0IzWb2PpV-82_CnrHDgmN'
	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end