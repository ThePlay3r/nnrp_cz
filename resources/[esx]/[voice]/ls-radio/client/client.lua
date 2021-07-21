
--===============================================================================
--=== Stworzone przez Alcapone aka suprisex. Zakaz rozpowszechniania skryptu! ===
--===================== na potrzeby LS-Story.pl =================================
--===============================================================================


-- ESX

ESX = nil
local jobName = nil
local jobGradeName = nil

Citizen.CreateThread(function()
  while ESX == nil do
	TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
	Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	jobName = xPlayer.job.name
	jobGradeName = xPlayer.job.grade_name
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	jobName = job.name
	jobGradeName = job.grade_name
end)

local radioMenu = false

function PrintChatMessage(text)
	TriggerEvent('chatMessage', "system", { 255, 0, 0 }, text)
end



function enableRadio(enable)

  SetNuiFocus(true, true)
  radioMenu = enable

  SendNUIMessage({

	type = "enableui",
	enable = enable

  })

end

--- sprawdza czy komenda /radio jest włączony

RegisterCommand('radio', function(source, args)
	if Config.enableCmd then
	  enableRadio(true)
	end
end, false)


-- radio test
local savedChannel = nil

function handleRadioMute ()
	local playerName = GetPlayerName(PlayerId())
	local data = exports.tokovoip_script:getPlayerData(playerName, "radio:channel")

	if data == "nil" and savedChannel ~= nil then
	  connectToRadio({channel = savedChannel})
	  savedChannel = nil
	elseif data ~= "nil" then
	  savedChannel = data
	  disconnectRadio()
  end
end

RegisterCommand('radiomute', function(source, args)
	handleRadioMute()
end, false)

-- dołączanie do radia

RegisterNUICallback('joinRadio', function(data, cb)
	connectToRadio(data, cb)
end)

function connectToRadio (data, cb)
	local playerName = GetPlayerName(PlayerId())
	local getPlayerRadioChannel = exports.tokovoip_script:getPlayerData(playerName, "radio:channel")

	if data.channel and tonumber(data.channel) ~= tonumber(getPlayerRadioChannel) then
		if tonumber(data.channel) <= Config.IZSChannels then
		  if(jobName == 'police' or jobName == 'ambulance' or jobName == 'hasici' or jobName == 'state' or jobName == 'sheriff') then
			exports.tokovoip_script:removePlayerFromRadio(getPlayerRadioChannel)
			exports.tokovoip_script:setPlayerData(playerName, "radio:channel", tonumber(data.channel), true);
			exports.tokovoip_script:addPlayerToRadio(tonumber(data.channel))
			exports['mythic_notify']:DoHudText('inform', Config.messages['joined_to_radio'] .. data.channel .. '.00 MHz </b>')
		  else
			exports['mythic_notify']:DoHudText('error', Config.messages['restricted_channel_error'])
		  end
		elseif tonumber(data.channel) > Config.IZSChannels and tonumber(data.channel) <= Config.RestrictedChannels then
			if jobName == Config.FractionChannels[tonumber(data.channel)] then
				if jobName == 'cosanostra' and string.match(jobGradeName, 'taxi') then
					exports['mythic_notify']:DoHudText('error', Config.messages['restricted_channel_error'])
				else
					exports.tokovoip_script:removePlayerFromRadio(getPlayerRadioChannel)
					exports.tokovoip_script:setPlayerData(playerName, "radio:channel", tonumber(data.channel), true);
					exports.tokovoip_script:addPlayerToRadio(tonumber(data.channel))
					exports['mythic_notify']:DoHudText('inform', Config.messages['joined_to_radio'] .. data.channel .. '.00 MHz </b>')
				end
			else
				exports['mythic_notify']:DoHudText('error', Config.messages['restricted_channel_error'])
			end
		end

		if tonumber(data.channel) > Config.RestrictedChannels then
		  exports.tokovoip_script:removePlayerFromRadio(getPlayerRadioChannel)
		  exports.tokovoip_script:setPlayerData(playerName, "radio:channel", tonumber(data.channel), true);
		  exports.tokovoip_script:addPlayerToRadio(tonumber(data.channel))
		  exports['mythic_notify']:DoHudText('inform', Config.messages['joined_to_radio'] .. data.channel .. '.00 MHz </b>')
		end
	  else
		exports['mythic_notify']:DoHudText('error', Config.messages['you_on_radio'] .. data.channel .. '.00 MHz </b>')
	  end
	  if cb then
		cb('ok')
	  end
end

-- opuszczanie radia

function disconnectRadio ()
  local playerName = GetPlayerName(PlayerId())
  local getPlayerRadioChannel = exports.tokovoip_script:getPlayerData(playerName, "radio:channel")

   if getPlayerRadioChannel == "nil" then
	 exports['mythic_notify']:DoHudText('inform', Config.messages['not_on_radio'])
	   else
		 exports.tokovoip_script:removePlayerFromRadio(getPlayerRadioChannel)
		 exports.tokovoip_script:setPlayerData(playerName, "radio:channel", "nil", true)
		 exports['mythic_notify']:DoHudText('inform', Config.messages['you_leave'] .. getPlayerRadioChannel .. '.00 MHz </b>')
   end
end

AddEventHandler("ls-radio:disconnectRadio", function()
  disconnectRadio()
end)

RegisterNUICallback('leaveRadio', function(data, cb)
   disconnectRadio()

   cb('ok')

end)

RegisterNUICallback('escape', function(data, cb)

	enableRadio(false)
	SetNuiFocus(false, false)


	cb('ok')
end)

-- net eventy

RegisterNetEvent('ls-radio:use')
AddEventHandler('ls-radio:use', function()
  enableRadio(true)
end)

RegisterNetEvent('ls-radio:onRadioDrop')
AddEventHandler('ls-radio:onRadioDrop', function(source)
  local playerName = GetPlayerName(source)
  local getPlayerRadioChannel = exports.tokovoip_script:getPlayerData(playerName, "radio:channel")


  if getPlayerRadioChannel ~= "nil" then

	exports.tokovoip_script:removePlayerFromRadio(getPlayerRadioChannel)
	exports.tokovoip_script:setPlayerData(playerName, "radio:channel", "nil", true)
	exports['mythic_notify']:DoHudText('inform', Config.messages['you_leave'] .. getPlayerRadioChannel .. '.00 MHz </b>')

end
end)


Citizen.CreateThread(function()
	while true do
		if radioMenu then
			DisableControlAction(0, 1, guiEnabled) -- LookLeftRight
			DisableControlAction(0, 2, guiEnabled) -- LookUpDown

			DisableControlAction(0, 142, guiEnabled) -- MeleeAttackAlternate

			DisableControlAction(0, 106, guiEnabled) -- VehicleMouseControlOverride

			if IsDisabledControlJustReleased(0, 142) then -- MeleeAttackAlternate
				SendNUIMessage({
					type = "click"
				})
			end
		end
		
		Citizen.Wait(0)
	end
end)

RegisterKeyMapping('radiomute', 'Vysilacka - mute', 'keyboard', 'HOME')