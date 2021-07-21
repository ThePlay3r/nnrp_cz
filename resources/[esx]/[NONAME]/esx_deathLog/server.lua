RegisterNetEvent('esx:onPlayerDeath')
AddEventHandler('esx:onPlayerDeath', function(data)
	sendMessageToDiscord(prepareMessageFromData(data))
end)

function checkArray (array, val)
	  for name, value in ipairs(array) do
		  if value == val then
			  return true
		  end
	  end
  
	  return false
end

function getDeathCause (d)
	local zmlacen = { -1569615261, 1737195953, 1317494643, -1786099057, 1141786504, -2067956739, -868994466 }
	local nuz = { -1716189206, 1223143800, -1955384325, -1833087301, 910830060, }
	local kulka = { 453432689, 1593441988, 584646201, -1716589765, 324215364, 736523883, -270015777, -1074790547, -2084633992, -1357824103, -1660422300, 2144741730, 487013001, 2017895192, -494615257, -1654528753, 100416529, 205991906, 1119849093 }
	local zvire = { -100946242, 148160082 }
	local pad = { -842959696 }
	local exploze = { -1568386805, 1305664598, -1312131151, 375527679, 324506233, 1752584910, -1813897027, 741814745, -37975472, 539292904, 341774354, -1090665087 }
	local plyn = { -1600701090 }
	local popaleniny = { 615608432, 883325847, -544306709 }
	local utopeni = { -10959621, 1936677264 }
	local autonehoda = { 133987706, -1553120962 }
	
	if checkArray(zmlacen, d) then
		return 'Zmlácen'
	elseif checkArray(nuz, d) then
		return 'Pobodán nožem'
	elseif checkArray(kulka, d) then
		return 'Postřelen'
	elseif checkArray(zvire, d) then
		return 'Zvíře'
	elseif checkArray(pad, d) then
		return 'Pád z výšky'
	elseif checkArray(exploze, d) then
		return 'Exploze'
	elseif checkArray(plyn, d) then
		return 'Plyn'
	elseif checkArray(popaleniny, d) then
		return 'Popáleniny'
	elseif checkArray(utopeni, d) then
		return 'Utopil(a) se'
	elseif checkArray(autonehoda, d) then
		return 'Autonehoda'
	else
		return 'Neznámá'
	end
end

function prepareMessageFromData (data)
	local isKilledByPlayer = data.killedByPlayer
	local time = os.date("%d.%m.%Y %X")
	local playerNick = GetPlayerName(data.victimId)
	local playerId = data.victimId
	local playerHex = GetPlayerIdentifiers(data.victimId)[1]
	local victimCoords = '[x: ' .. data.victimCoords.x .. ', y: ' .. data.victimCoords.y .. ', z: ' .. data.victimCoords.z .. ']'
	local deathCause = getDeathCause(data.deathCause)

	local msg = '**Hráč:** ' .. playerNick .. '\n**ID hráče:** ' .. playerId .. '\n**HEX hráče:** ' .. playerHex .. '\n**Poloha hráče:** ' .. victimCoords .. '\n**Příčina:** ' .. deathCause
	local msg2 = ''

	if isKilledByPlayer then
		local killerNick = GetPlayerName(data.killerServerId)
		local killerId = data.killerServerId
		local killerHex = GetPlayerIdentifiers(data.killerServerId)[1]
		local killerCoords = '[x: ' .. data.killerCoords.x .. ', y: ' .. data.killerCoords.y .. ', z: ' .. data.killerCoords.z .. ']'
		local distance = data.distance
		msg2 = '**Vrah:** ' .. killerNick .. '\n**ID vraha:** ' .. killerId .. '\n**HEX vraha**: ' .. killerHex .. '\n**Poloha vraha:** ' .. killerCoords .. '\n**Vzdálenost:** ' .. distance
	end

	return '**Čas:** ' .. time .. '\n' .. msg .. '\n' .. msg2
end

function sendMessageToDiscord (msg)
	local url = 'https://discordapp.com/api/webhooks/703209008030285894/zIougguooQiHV6w006JMEH1EpyhltMRCllQuY3RPYG65SqKvJ_I2YxbvzqjMN7EmgpFu'
        PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({embeds={{title="NoName Smrti",description=msg,color=65280,}}}), {["Content-Type"]="application/json"})
end