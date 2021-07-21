ESX                = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
  TriggerEvent('esx_service:activateService', 'cozinheiro', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'cozinheiro', _U('cozinheiro_customer'), true, true)
TriggerEvent('esx_society:registerSociety', 'cozinheiro', 'Cozinheiro', 'society_cozinheiro', 'society_cozinheiro', 'society_cozinheiro', {type = 'private'})



RegisterServerEvent('esx_cozinheirojob:getStockItem')
AddEventHandler('esx_cozinheirojob:getStockItem', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_cozinheiro', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)

  end)

end)

RegisterServerEvent('esx_cozinheirojob:Billing')--Not Working...
AddEventHandler('esx_cozinheirojob:Billing', function(money, player)

  local xPlayer = ESX.GetPlayerFromId(source)
  local xTarget = ESX.GetPlayerFromId(player)
  local valor = money

    if xTarget.getMoney() >= valor then
      xTarget.removeMoney(valor)
      xPlayer.addMoney(valor)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, "O seu cliente nao tem esse dinheiro, valor: " ..valor)
	  TriggerClientEvent('esx:showNotification', xTarget.source, "Voce nao tem esse dinheiro, valor: " ..valor)
    end
end)--Not Working

ESX.RegisterServerCallback('esx_cozinheirojob:getStockItems', function(source, cb)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_cozinheiro', function(inventory)
    cb(inventory.items)
  end)

end)

RegisterServerEvent('esx_cozinheirojob:putStockItems')
AddEventHandler('esx_cozinheirojob:putStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_cozinheiro', function(inventory)

    local item = inventory.getItem(itemName)
    local playerItemCount = xPlayer.getInventoryItem(itemName).count

    if item.count >= 0 and count <= playerItemCount then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. item.label)

  end)

end)


RegisterServerEvent('esx_cozinheirojob:getFridgeStockItem')
AddEventHandler('esx_cozinheirojob:getFridgeStockItem', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_cozinheiro_fridge', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)

  end)

end)

ESX.RegisterServerCallback('esx_cozinheirojob:getFridgeStockItems', function(source, cb)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_cozinheiro_fridge', function(inventory)
    cb(inventory.items)
  end)

end)

RegisterServerEvent('esx_cozinheirojob:putFridgeStockItems')
AddEventHandler('esx_cozinheirojob:putFridgeStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_cozinheiro_fridge', function(inventory)

    local item = inventory.getItem(itemName)
    local playerItemCount = xPlayer.getInventoryItem(itemName).count

    if item.count >= 0 and count <= playerItemCount then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. item.label)

  end)

end)


RegisterServerEvent('esx_cozinheirojob:buyItem')
AddEventHandler('esx_cozinheirojob:buyItem', function(itemName, price, itemLabel)

    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local limit = xPlayer.getInventoryItem(itemName).limit
    local qtty = xPlayer.getInventoryItem(itemName).count
    local societyAccount = nil

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_cozinheiro', function(account)
        societyAccount = account
      end)
    
    if societyAccount ~= nil and societyAccount.money >= price then
        if qtty < limit then
            societyAccount.removeMoney(price)
            xPlayer.addInventoryItem(itemName, 1)
            TriggerClientEvent('esx:showNotification', _source, _U('bought') .. itemLabel)
        else
            TriggerClientEvent('esx:showNotification', _source, _U('max_item'))
        end
    else
        TriggerClientEvent('esx:showNotification', _source, _U('not_enough'))
    end

end)


RegisterServerEvent('esx_cozinheirojob:craftingCoktails')
AddEventHandler('esx_cozinheirojob:craftingCoktails', function(Value)

    local _source = source
    local escolha = Value       
		if escolha == "ovoes" then
            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('manteiga').count
            local bethQuantity      = xPlayer.getInventoryItem('ovo').count

            if alephQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Maslo~w~")
            elseif bethQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Vejce~w~")
            else
                    TriggerClientEvent('esx:showNotification', _source, "Smazene vejce je ~g~pripraveno~w~")
                    xPlayer.removeInventoryItem('ovo', 1)
                    xPlayer.removeInventoryItem('manteiga', 1)
                    xPlayer.addInventoryItem('ovoes', 1)
            end
		elseif escolha == "vitela" then
            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('manteiga').count
            local bethQuantity      = xPlayer.getInventoryItem('vitela').count
			local bethQuantity2      = xPlayer.getInventoryItem('oregaos').count

            if alephQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Maslo~w~")
            elseif bethQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Syrove teleci maso~w~")
            elseif bethQuantity2 < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Oregano~w~")
            else
                    TriggerClientEvent('esx:showNotification', _source, "Syrove teleci maso je ~g~pripraveno~w~")
                    xPlayer.removeInventoryItem('oregaos', 1)
					xPlayer.removeInventoryItem('vitela', 1)
                    xPlayer.removeInventoryItem('manteiga', 1)
                    xPlayer.addInventoryItem('vitelaass', 1)
            end
		elseif escolha == "polvo" then
            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('manteiga').count
            local bethQuantity      = xPlayer.getInventoryItem('polvo').count
			local bethQuantity2      = xPlayer.getInventoryItem('alho').count

            if alephQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Maslo~w~")
            elseif bethQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Syrova chobotnice~w~")
            elseif bethQuantity2 < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Cesnek~w~")
            else
                    TriggerClientEvent('esx:showNotification', _source, "Grilovana chobotnice je ~g~pripraveno~w~")
                    xPlayer.removeInventoryItem('alho', 1)
					xPlayer.removeInventoryItem('polvo', 1)
                    xPlayer.removeInventoryItem('manteiga', 1)
                    xPlayer.addInventoryItem('polvogre', 1)
            end
		elseif escolha == "ham" then
            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('bread').count
            local bethQuantity      = xPlayer.getInventoryItem('carnep').count
			local bethQuantity2      = xPlayer.getInventoryItem('alface').count
			local bethQuantity3      = xPlayer.getInventoryItem('tomate').count
			local bethQuantity4      = xPlayer.getInventoryItem('queijo').count

            if alephQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Vejce~w~")
            elseif bethQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Mlete maso~w~")
            elseif bethQuantity2 < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Salat~w~")
            elseif bethQuantity3 < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Rajce~w~")
            elseif bethQuantity4 < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Syr~w~")
            else
                    TriggerClientEvent('esx:showNotification', _source, "Hamburger je ~g~pripraven~w~")
                    xPlayer.removeInventoryItem('bread', 1)
					xPlayer.removeInventoryItem('carnep', 1)
                    xPlayer.removeInventoryItem('alface', 1)
					xPlayer.removeInventoryItem('tomate', 1)
					xPlayer.removeInventoryItem('queijo', 1)
                    xPlayer.addInventoryItem('hamb', 1)
            end
		elseif escolha == "anglishbreak" then
            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('bread').count
            local bethQuantity      = xPlayer.getInventoryItem('bacon').count
			local bethQuantity2      = xPlayer.getInventoryItem('ovo').count

            if alephQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Chleba~w~")
            elseif bethQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Slanina~w~")
            elseif bethQuantity2 < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Vejce~w~")
            else
                    TriggerClientEvent('esx:showNotification', _source, "Anglicka snidane je ~g~pripravena~w~")
                    xPlayer.removeInventoryItem('bread', 1)
					xPlayer.removeInventoryItem('bacon', 1)
                    xPlayer.removeInventoryItem('ovo', 1)
                    xPlayer.addInventoryItem('anglishbreak', 1)
            end
		elseif escolha == "fishchips" then
            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('fish').count
            local bethQuantity      = xPlayer.getInventoryItem('potato').count
			local bethQuantity2      = xPlayer.getInventoryItem('lemon').count

            if alephQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Ryba~w~")
            elseif bethQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Brambory~w~")
            elseif bethQuantity2 < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Citron~w~")
            else
                    TriggerClientEvent('esx:showNotification', _source, "Ryba z hranolkami je ~g~pripravena~w~")
                    xPlayer.removeInventoryItem('fish', 1)
					xPlayer.removeInventoryItem('potato', 1)
                    xPlayer.removeInventoryItem('lemon', 1)
                    xPlayer.addInventoryItem('fishchips', 1)
            end
			elseif escolha == "gulas" then
            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('water').count
            local bethQuantity      = xPlayer.getInventoryItem('potato').count
			local bethQuantity2      = xPlayer.getInventoryItem('pork').count

            if alephQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Voda~w~")
            elseif bethQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Brambory~w~")
            elseif bethQuantity2 < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Syrove veprove~w~")
            else
                    TriggerClientEvent('esx:showNotification', _source, "Gulas je ~g~pripraven~w~")
                    xPlayer.removeInventoryItem('water', 1)
					xPlayer.removeInventoryItem('potato', 1)
                    xPlayer.removeInventoryItem('pork', 1)
                    xPlayer.addInventoryItem('gulas', 1)
            end
			elseif escolha == "pumpkinsoap" then
            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('pumpkin').count
            local bethQuantity      = xPlayer.getInventoryItem('mleko').count
			local bethQuantity2      = xPlayer.getInventoryItem('water').count

            if alephQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Dyne~w~")
            elseif bethQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Mleko~w~")
            elseif bethQuantity2 < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Voda~w~")
            else
                    TriggerClientEvent('esx:showNotification', _source, "Dinova polevka je ~g~pripravena~w~")
                    xPlayer.removeInventoryItem('pumpkin', 1)
					xPlayer.removeInventoryItem('mleko', 1)
                    xPlayer.removeInventoryItem('water', 1)
                    xPlayer.addInventoryItem('pumpkinsoap', 1)
            end
			elseif escolha == "lobster" then
            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('freshlobster').count
            local bethQuantity      = xPlayer.getInventoryItem('alface').count
			local bethQuantity2      = xPlayer.getInventoryItem('lemon').count
			local bethQuantity2      = xPlayer.getInventoryItem('tomate').count

            if alephQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Cerstvy humr~w~")
            elseif bethQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Salat~w~")
            elseif bethQuantity2 < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Citron~w~")
			 elseif bethQuantity3 < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Rajce~w~")
            else
                    TriggerClientEvent('esx:showNotification', _source, "Dinova polevka je ~g~pripravena~w~")
                    xPlayer.removeInventoryItem('freshlobster', 1)
					xPlayer.removeInventoryItem('alface', 1)
                    xPlayer.removeInventoryItem('lemon', 1)
					xPlayer.removeInventoryItem('tomate', 1)
                    xPlayer.addInventoryItem('lobster', 1)
            end
		elseif escolha == "nudle" then
            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('torteliny').count
            local bethQuantity      = xPlayer.getInventoryItem('pork').count
			local bethQuantity2      = xPlayer.getInventoryItem('ovo').count

            if alephQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Testoviny~w~")
            elseif bethQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Syrove veprove~w~")
            elseif bethQuantity2 < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Vejce~w~")
            else
                    TriggerClientEvent('esx:showNotification', _source, "Nudle jsou ~g~pripravene~w~")
                    xPlayer.removeInventoryItem('torteliny', 1)
					xPlayer.removeInventoryItem('pork', 1)
                    xPlayer.removeInventoryItem('ovo', 1)
                    xPlayer.addInventoryItem('nudle', 1)
            end
		elseif escolha == "palacinky" then
            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('ovo').count
            local bethQuantity      = xPlayer.getInventoryItem('flour').count
			local bethQuantity2      = xPlayer.getInventoryItem('mleko').count
			local bethQuantity2      = xPlayer.getInventoryItem('strawberries').count

            if alephQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Vejce~w~")
            elseif bethQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Mouka~w~")
            elseif bethQuantity2 < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Mleko~w~")
			 elseif bethQuantity3 < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Jahody~w~")
            else
                    TriggerClientEvent('esx:showNotification', _source, "Palacinky jsou ~g~pripravene~w~")
                    xPlayer.removeInventoryItem('ovo', 1)
					xPlayer.removeInventoryItem('flour', 1)
                    xPlayer.removeInventoryItem('mleko', 1)
					xPlayer.removeInventoryItem('strawberries', 1)
                    xPlayer.addInventoryItem('palacinky', 1)
            end
		elseif escolha == "pizza" then
            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('flour').count
            local bethQuantity      = xPlayer.getInventoryItem('pepperoni').count
			local bethQuantity2      = xPlayer.getInventoryItem('tomate').count
			local bethQuantity3      = xPlayer.getInventoryItem('alho').count
			local bethQuantity4      = xPlayer.getInventoryItem('queijo').count

            if alephQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Mouka~w~")
            elseif bethQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Paprika~w~")
            elseif bethQuantity2 < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Rajcata~w~")
            elseif bethQuantity3 < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Cesnek~w~")
            elseif bethQuantity4 < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Syr~w~")
            else
                    TriggerClientEvent('esx:showNotification', _source, "Pizza je ~g~pripravena~w~")
                    xPlayer.removeInventoryItem('flour', 1)
					xPlayer.removeInventoryItem('pepperoni', 1)
                    xPlayer.removeInventoryItem('tomate', 1)
					xPlayer.removeInventoryItem('alho', 1)
					xPlayer.removeInventoryItem('queijo', 1)
                    xPlayer.addInventoryItem('pizza', 1)
            end
		elseif escolha == "ramen" then
            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('torteliny').count
            local bethQuantity      = xPlayer.getInventoryItem('water').count
			local bethQuantity2      = xPlayer.getInventoryItem('pork').count
			local bethQuantity2      = xPlayer.getInventoryItem('ovo').count

            if alephQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Testoviny~w~")
            elseif bethQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Voda~w~")
            elseif bethQuantity2 < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Syrove veprove~w~")
			 elseif bethQuantity3 < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Vejce~w~")
            else
                    TriggerClientEvent('esx:showNotification', _source, "Ramen je ~g~pripraven~w~")
                    xPlayer.removeInventoryItem('torteliny', 1)
					xPlayer.removeInventoryItem('water', 1)
                    xPlayer.removeInventoryItem('pork', 1)
					xPlayer.removeInventoryItem('ovo', 1)
                    xPlayer.addInventoryItem('ramen', 1)
            end
		elseif escolha == "ribs" then
            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('freshribs').count
            local bethQuantity      = xPlayer.getInventoryItem('tomate').count
			local bethQuantity2      = xPlayer.getInventoryItem('oregaos').count

            if alephQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Syrove rebirka~w~")
            elseif bethQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Rajce~w~")
            elseif bethQuantity2 < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Oregano~w~")
            else
                    TriggerClientEvent('esx:showNotification', _source, "Pecene rebirka jsou ~g~pripravene~w~")
                    xPlayer.removeInventoryItem('freshribs', 1)
					xPlayer.removeInventoryItem('tomate', 1)
                    xPlayer.removeInventoryItem('oregaos', 1)
                    xPlayer.addInventoryItem('ribs', 1)
            end
		elseif escolha == "rizekhranolky" then
            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('pork').count
            local bethQuantity      = xPlayer.getInventoryItem('potato').count
			local bethQuantity2      = xPlayer.getInventoryItem('flour').count
			local bethQuantity2      = xPlayer.getInventoryItem('ovo').count

            if alephQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Syrove veprove~w~")
            elseif bethQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Brambory~w~")
            elseif bethQuantity2 < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Mouka~w~")
			 elseif bethQuantity3 < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Vejce~w~")
            else
                    TriggerClientEvent('esx:showNotification', _source, "Rizek s hranolkami je ~g~pripraven~w~")
                    xPlayer.removeInventoryItem('pork', 1)
					xPlayer.removeInventoryItem('potato', 1)
                    xPlayer.removeInventoryItem('flour', 1)
					xPlayer.removeInventoryItem('ovo', 1)
                    xPlayer.addInventoryItem('rizekhranolky', 1)
            end
		elseif escolha == "salmon" then
            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('freshsalmon').count
            local bethQuantity      = xPlayer.getInventoryItem('manteiga').count
			local bethQuantity2      = xPlayer.getInventoryItem('potato').count
			local bethQuantity2      = xPlayer.getInventoryItem('lemon').count

            if alephQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Syrovy losos~w~")
            elseif bethQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Maslo~w~")
            elseif bethQuantity2 < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Brambory~w~")
			 elseif bethQuantity3 < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Citron~w~")
            else
                    TriggerClientEvent('esx:showNotification', _source, "Losos s bramborami je ~g~pripraven~w~")
                    xPlayer.removeInventoryItem('freshsalmon', 1)
					xPlayer.removeInventoryItem('manteiga', 1)
                    xPlayer.removeInventoryItem('potato', 1)
					xPlayer.removeInventoryItem('lemon', 1)
                    xPlayer.addInventoryItem('salmon', 1)
            end
		elseif escolha == "seakpotato" then
            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('pork').count
            local bethQuantity      = xPlayer.getInventoryItem('potato').count
			local bethQuantity2      = xPlayer.getInventoryItem('oregaos').count
			local bethQuantity2      = xPlayer.getInventoryItem('tomate').count

            if alephQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Syrove Veprove~w~")
            elseif bethQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Brambory~w~")
            elseif bethQuantity2 < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Oregano~w~")
			 elseif bethQuantity3 < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Rajce~w~")
            else
                    TriggerClientEvent('esx:showNotification', _source, "Steak s bramborami je ~g~pripraven~w~")
                    xPlayer.removeInventoryItem('pork', 1)
					xPlayer.removeInventoryItem('potato', 1)
                    xPlayer.removeInventoryItem('oregaos', 1)
					xPlayer.removeInventoryItem('tomate', 1)
                    xPlayer.addInventoryItem('seakpotato', 1)
            end
		elseif escolha == "spagety" then
            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('torteliny').count
            local bethQuantity      = xPlayer.getInventoryItem('tomate').count
			local bethQuantity2      = xPlayer.getInventoryItem('queijo').count
			local bethQuantity2      = xPlayer.getInventoryItem('carnep').count

            if alephQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Testoviny~w~")
            elseif bethQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Rajce~w~")
            elseif bethQuantity2 < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Syr~w~")
			 elseif bethQuantity3 < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Mlete maso~w~")
            else
                    TriggerClientEvent('esx:showNotification', _source, "Spagety jsou ~g~pripravene~w~")
                    xPlayer.removeInventoryItem('torteliny', 1)
					xPlayer.removeInventoryItem('tomate', 1)
                    xPlayer.removeInventoryItem('queijo', 1)
					xPlayer.removeInventoryItem('carnep', 1)
                    xPlayer.addInventoryItem('spagety', 1)
            end
		elseif escolha == "spiz" then
            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('pork').count
            local bethQuantity      = xPlayer.getInventoryItem('potato').count
			local bethQuantity2      = xPlayer.getInventoryItem('pepperoni').count

            if alephQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Syrove Veprove~w~")
            elseif bethQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Brambory~w~")
            elseif bethQuantity2 < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Paprika~w~")
            else
                    TriggerClientEvent('esx:showNotification', _source, "Spiz je ~g~pripraven~w~")
                    xPlayer.removeInventoryItem('pork', 1)
					xPlayer.removeInventoryItem('potato', 1)
                    xPlayer.removeInventoryItem('pepperoni', 1)
                    xPlayer.addInventoryItem('spiz', 1)
            end
		elseif escolha == "tiramisu" then
            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('mascarpone').count
            local bethQuantity      = xPlayer.getInventoryItem('freshcoffe').count

            if alephQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Mascarpone~w~")
            elseif bethQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Kavove zrna~w~")
            else
                    TriggerClientEvent('esx:showNotification', _source, "Tiramisu je ~g~pripraveno~w~")
                    xPlayer.removeInventoryItem('mascarpone', 1)
					xPlayer.removeInventoryItem('freshcoffe', 1)
                    xPlayer.addInventoryItem('tiramisu', 1)
            end
		elseif escolha == "tortelini" then
            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('torteliny').count
            local bethQuantity      = xPlayer.getInventoryItem('tomate').count
			local bethQuantity2      = xPlayer.getInventoryItem('queijo').count
			local bethQuantity2      = xPlayer.getInventoryItem('pork').count

            if alephQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Testoviny~w~")
            elseif bethQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Rajce~w~")
            elseif bethQuantity2 < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Syr~w~")
			 elseif bethQuantity3 < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Syrove veprove~w~")
            else
                    TriggerClientEvent('esx:showNotification', _source, "Tortelini jsou ~g~pripravene~w~")
                    xPlayer.removeInventoryItem('torteliny', 1)
					xPlayer.removeInventoryItem('tomate', 1)
                    xPlayer.removeInventoryItem('queijo', 1)
					xPlayer.removeInventoryItem('pork', 1)
                    xPlayer.addInventoryItem('tortelini', 1)
            end
		elseif escolha == "wafle" then
            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('flour').count
            local bethQuantity      = xPlayer.getInventoryItem('ovo').count
			local bethQuantity2      = xPlayer.getInventoryItem('strawberries').count
			local bethQuantity3      = xPlayer.getInventoryItem('slehacka').count
			local bethQuantity4      = xPlayer.getInventoryItem('mleko').count

            if alephQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Mouka~w~")
            elseif bethQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Vejce~w~")
            elseif bethQuantity2 < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Jahody~w~")
            elseif bethQuantity3 < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Slehacka~w~")
            elseif bethQuantity4 < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Chybi ti ~r~Mleko~w~")
            else
                    TriggerClientEvent('esx:showNotification', _source, "Wafle jsou ~g~pripravene~w~")
                    xPlayer.removeInventoryItem('flour', 1)
					xPlayer.removeInventoryItem('ovo', 1)
                    xPlayer.removeInventoryItem('strawberries', 1)
					xPlayer.removeInventoryItem('slehacka', 1)
					xPlayer.removeInventoryItem('mleko', 1)
                    xPlayer.addInventoryItem('wafle', 1)
            end
		else
			TriggerClientEvent('esx:showNotification', _source, "Rip ~r~ERROR 404~w~")
		end
end)

RegisterServerEvent('esx_cozinheirojob:shop')
AddEventHandler('esx_cozinheirojob:shop', function(item, valor)

    local _source = source
    local xPlayer           = ESX.GetPlayerFromId(_source)
	local comida = item
	local preco = valor
	if xPlayer.getMoney() >= preco then
        xPlayer.removeMoney(preco)
        xPlayer.addInventoryItem(comida, 1)
	end
end)

ESX.RegisterServerCallback('esx_cozinheirojob:getVaultWeapons', function(source, cb)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_cozinheiro', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    cb(weapons)

  end)

end)

ESX.RegisterServerCallback('esx_cozinheirojob:addVaultWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.removeWeapon(weaponName)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_cozinheiro', function(store)

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

ESX.RegisterServerCallback('esx_cozinheirojob:removeVaultWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.addWeapon(weaponName, 1000)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_cozinheiro', function(store)

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

ESX.RegisterServerCallback('esx_cozinheirojob:getPlayerInventory', function(source, cb)

  local xPlayer    = ESX.GetPlayerFromId(source)
  local items      = xPlayer.inventory

  cb({
    items      = items
  })

end)
