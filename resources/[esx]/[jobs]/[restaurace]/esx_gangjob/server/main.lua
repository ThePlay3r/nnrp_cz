ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
  TriggerEvent('esx_service:activateService', 'gang', Config.MaxInService)
end

-- TriggerEvent('esx_phone:registerNumber', 'mafia', _U('alert_mafia'), true, true)
TriggerEvent('esx_phone:registerNumber', 'gang', _U('alert_steakhouse'), true, true)
TriggerEvent('esx_society:registerSociety', 'gang', 'Gang', 'society_gang', 'society_gang', 'society_gang', {type = 'public'})


function discordLog(text, source)
	local time = os.date("%d.%m.%Y %X")
	local name = GetPlayerName(source)
	local identifier = GetPlayerIdentifiers(source)
	local msg = time .. ' : ' .. name .. ' - ' .. identifier[1] .. ' : ' .. text
	local url = "https://discordapp.com/api/webhooks/723615199650644018/YeLilQ-OB_7Sjg6C1W-a7t_ae0jg9ZQGXJzDBQH2axV4jSR_81hshvUmGyLxQAanhC3i"
	PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end

RegisterServerEvent('esx_gangjob:confiscatePlayerItem')
AddEventHandler('esx_gangjob:confiscatePlayerItem', function(target, itemType, itemName, amount)

  local _source = source
	local sourceXPlayer = ESX.GetPlayerFromId(_source)
  local targetXPlayer = ESX.GetPlayerFromId(target)
  local hasAllowedJob = sourceXPlayer.job.name == 'gang' or sourceXPlayer.job.name == 'pulya' or sourceXPlayer.job.name == 'cosanostra' or sourceXPlayer.job.name == 'unicorn' or sourceXPlayer.job.name == 'ballas'

	if not hasAllowedJob then
		print(('esx_gangjob: %s attempted to confiscate! [' .. sourceXPlayer.job.name .. ']'):format(sourceXPlayer.identifier))
		return
	end

	if itemType == 'item_standard' then
		local targetItem = targetXPlayer.getInventoryItem(itemName)
		local sourceItem = sourceXPlayer.getInventoryItem(itemName)

		-- does the target player have enough in their inventory?
		if targetItem.count > 0 then
			-- can the player carry the said amount of x item?
			if sourceXPlayer.canCarryItem(itemName, 1) then
				targetXPlayer.removeInventoryItem(itemName, 1)
				sourceXPlayer.addInventoryItem(itemName, 1)
				sourceXPlayer.showNotification(_U('you_confiscated', 1, sourceItem.label, targetXPlayer.name))
				targetXPlayer.showNotification(_U('got_confiscated', 1, sourceItem.label, sourceXPlayer.name))
			else
				sourceXPlayer.showNotification('Vic toho uz neuneses')
			end
		else
			sourceXPlayer.showNotification('Vic toho uz neuneses')
		end
	elseif itemType == 'item_account' then
		targetXPlayer.removeAccountMoney(itemName, amount)
		sourceXPlayer.addAccountMoney   (itemName, amount)

		sourceXPlayer.showNotification(_U('you_confiscated_account', amount, itemName, targetXPlayer.name))
		targetXPlayer.showNotification(_U('got_confiscated_account', amount, itemName, sourceXPlayer.name))

	elseif itemType == 'item_weapon' then
		if amount == nil then amount = 0 end
		targetXPlayer.removeWeapon(itemName, amount)
		sourceXPlayer.addWeapon   (itemName, amount)

		sourceXPlayer.showNotification(_U('you_confiscated_weapon', ESX.GetWeaponLabel(itemName), targetXPlayer.name, amount))
		targetXPlayer.showNotification(_U('got_confiscated_weapon', ESX.GetWeaponLabel(itemName), amount, sourceXPlayer.name))
	end
end)

RegisterServerEvent('esx_gangjob:handcuff')
AddEventHandler('esx_gangjob:handcuff', function(target)
  TriggerClientEvent('esx_gangjob:handcuff', target)
end)

RegisterServerEvent('esx_gangjob:drag')
AddEventHandler('esx_gangjob:drag', function(target)
  local _source = source
  TriggerClientEvent('esx_gangjob:drag', target, _source)
end)

RegisterServerEvent('esx_gangjob:putInVehicle')
AddEventHandler('esx_gangjob:putInVehicle', function(target)
  TriggerClientEvent('esx_gangjob:putInVehicle', target)
end)

RegisterServerEvent('esx_gangjob:OutVehicle')
AddEventHandler('esx_gangjob:OutVehicle', function(target)
    TriggerClientEvent('esx_gangjob:OutVehicle', target)
end)

RegisterServerEvent('esx_gangjob:getStockItem')
AddEventHandler('esx_gangjob:getStockItem', function(itemName, count, inventoryName)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', inventoryName, function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
      discordLog("vytahl **" .. item.label .. "** v mnozstvi " .. count, source)
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_withdrawn') .. count .. ' ' .. item.label)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end
  end)

end)

RegisterServerEvent('esx_gangjob:putStockItems')
AddEventHandler('esx_gangjob:putStockItems', function(itemName, count, inventoryName)

  local xPlayer = ESX.GetPlayerFromId(source)
  local playerCount = xPlayer.getInventoryItem(itemName).count

  TriggerEvent('esx_addoninventory:getSharedInventory', inventoryName, function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= 0 and playerCount >= count then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
      discordLog("vlozil **" .. item.label .. "** v mnozstvi " .. count, source)
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('added') .. count .. ' ' .. item.label)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end
  end)

end)

ESX.RegisterServerCallback('esx_gangjob:getOtherPlayerData', function(source, cb, target)

  if Config.EnableESXIdentity then

    local xPlayer = ESX.GetPlayerFromId(target)

    local identifier = GetPlayerIdentifiers(target)[1]

    local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
      ['@identifier'] = identifier
    })

    local user      = result[1]
    local firstname     = user['firstname']
    local lastname      = user['lastname']
    local sex           = user['sex']
    local dob           = user['dateofbirth']
    local height        = user['height'] .. " Inches"

    local data = {
      name        = GetPlayerName(target),
      job         = xPlayer.job,
      inventory   = xPlayer.inventory,
      accounts    = xPlayer.accounts,
      weapons     = xPlayer.loadout,
      firstname   = firstname,
      lastname    = lastname,
      sex         = sex,
      dob         = dob,
      height      = height
    }

    TriggerEvent('esx_status:getStatus', source, 'drunk', function(status)

      if status ~= nil then
        data.drunk = math.floor(status.percent)
      end

    end)

    if Config.EnableLicenses then

      TriggerEvent('esx_license:getLicenses', source, function(licenses)
        data.licenses = licenses
        cb(data)
      end)

    else
      cb(data)
    end

  else

    local xPlayer = ESX.GetPlayerFromId(target)

    local data = {
      name       = GetPlayerName(target),
      job        = xPlayer.job,
      inventory  = xPlayer.inventory,
      accounts   = xPlayer.accounts,
      weapons    = xPlayer.loadout
    }

    TriggerEvent('esx_status:getStatus', _source, 'drunk', function(status)

      if status ~= nil then
        data.drunk = status.getPercent()
      end

    end)

    TriggerEvent('esx_license:getLicenses', _source, function(licenses)
      data.licenses = licenses
    end)

    cb(data)

  end

end)

ESX.RegisterServerCallback('esx_gangjob:getFineList', function(source, cb, category)

  MySQL.Async.fetchAll(
    'SELECT * FROM fine_types_gang WHERE category = @category',
    {
      ['@category'] = category
    },
    function(fines)
      cb(fines)
    end
  )

end)

ESX.RegisterServerCallback('esx_gangjob:getVehicleInfos', function(source, cb, plate)

  if Config.EnableESXIdentity then

    MySQL.Async.fetchAll(
      'SELECT * FROM owned_vehicles',
      {},
      function(result)

        local foundIdentifier = nil

        for i=1, #result, 1 do

          local vehicleData = json.decode(result[i].vehicle)

          if vehicleData.plate == plate then
            foundIdentifier = result[i].owner
            break
          end

        end

        if foundIdentifier ~= nil then

          MySQL.Async.fetchAll(
            'SELECT * FROM users WHERE identifier = @identifier',
            {
              ['@identifier'] = foundIdentifier
            },
            function(result)

              local ownerName = result[1].firstname .. " " .. result[1].lastname

              local infos = {
                plate = plate,
                owner = ownerName
              }

              cb(infos)

            end
          )

        else

          local infos = {
          plate = plate
          }

          cb(infos)

        end

      end
    )

  else

    MySQL.Async.fetchAll(
      'SELECT * FROM owned_vehicles',
      {},
      function(result)

        local foundIdentifier = nil

        for i=1, #result, 1 do

          local vehicleData = json.decode(result[i].vehicle)

          if vehicleData.plate == plate then
            foundIdentifier = result[i].owner
            break
          end

        end

        if foundIdentifier ~= nil then

          MySQL.Async.fetchAll(
            'SELECT * FROM users WHERE identifier = @identifier',
            {
              ['@identifier'] = foundIdentifier
            },
            function(result)

              local infos = {
                plate = plate,
                owner = result[1].name
              }

              cb(infos)

            end
          )

        else

          local infos = {
          plate = plate
          }

          cb(infos)

        end

      end
    )

  end

end)

ESX.RegisterServerCallback('esx_gangjob:getArmoryWeapons', function(source, cb)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_gang', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    cb(weapons)

  end)

end)

ESX.RegisterServerCallback('esx_gangjob:addArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.removeWeapon(weaponName)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_gang', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = weapons[i].count + 1
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 1
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('esx_gangjob:removeArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.addWeapon(weaponName, 250)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_gang', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 0
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)


ESX.RegisterServerCallback('esx_gangjob:buy', function(source, cb, amount)

  TriggerEvent('esx_addonaccount:getSharedAccount', 'society_gang', function(account)

    if account.money >= amount then
      account.removeMoney(amount)
      cb(true)
    else
      cb(false)
    end

  end)

end)

ESX.RegisterServerCallback('esx_gangjob:getStockItems', function(source, cb, inventoryName)

  TriggerEvent('esx_addoninventory:getSharedInventory', inventoryName, function(inventory)
    cb(inventory.items)
  end)

end)

ESX.RegisterServerCallback('esx_gangjob:getPlayerInventory', function(source, cb)

  local xPlayer = ESX.GetPlayerFromId(source)
  local items   = xPlayer.inventory

  cb({
    items = items
  })

end)