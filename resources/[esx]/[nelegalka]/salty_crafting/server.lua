ESX = nil
TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)

RegisterServerEvent('salty_crafting:getPlayerInventory')
AddEventHandler('salty_crafting:getPlayerInventory', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer ~= nil then
		TriggerClientEvent('salty_crafting:openMenu', _source, xPlayer.inventory)
	end
end)

function findRecipe(list, recipes)
	for item, ingredients in pairs(recipes) do
		if #ingredients == #list then
			-- same length, let's compare
			local found = 0
			for i=1, #ingredients, 1 do
				for j=1, #list, 1 do
					if ingredients[i].item == list[j].item and ingredients[i].quantity == list[j].quantity then
						found = found + 1
					end
				end
			end
			if found == #list then
				return item
			end
		end
	end
	return false
end

function hasAllIngredients(inventory, ingredients)
	for i=1, #ingredients, 1 do
		for j=1, #inventory, 1 do
			if ingredients[i].name == inventory[j].name then
				if inventory[j].count < ingredients[i].quantity then
					return false
				end
			end
		end
	end
	return true
end

function itemLabel(name, inventory)
	if string.match(string.lower(name), "weapon_") or string.match(string.lower(name), "gadget_") then
		return ESX.GetWeaponLabel(name)
	else
		for i=1, #inventory, 1 do
			if inventory[i].name == name then
				return inventory[i].label
			end
		end
	end
	return "unknown item"
end

function deleteUsedItems (xPlayer, items)
	for k, v in pairs(items) do
		if v.item ~= 'keycardweapon' then
			xPlayer.removeInventoryItem(v.item, v.quantity)
		end
	end
end

local PlayerCrafting = {}

function CreateWeapon (item, _source, xPlayer, timeHash, Timer)
	SetTimeout(Timer, function()
		if PlayerCrafting[xPlayer.identifier] == timeHash then
			if string.match(string.lower(item), "weapon_") or string.match(string.lower(item), "gadget_") then
				xPlayer.addWeapon(item, Config.WeaponAmmo)
			else
				xPlayer.addInventoryItem(item, 1)
			end
			TriggerClientEvent('esx:showNotification', _source, '~y~Vyrobil/a jsi: ~w~' .. itemLabel(item, xPlayer.inventory))
		end
	end)
end

RegisterServerEvent('salty_crafting:craftItem')
AddEventHandler('salty_crafting:craftItem', function(ingredients, inDrawingRange2)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local recipes = Config.Recipes

	if inDrawingRange2 then
		recipes = Config.Recipes
	else
		recipes = Config.RecipesNelegal
	end

	local item = findRecipe(ingredients, recipes)

	if not item then
		deleteUsedItems(xPlayer, ingredients)
	else
		if xPlayer ~= nil then
			if hasAllIngredients(xPlayer.inventory, recipes[item]) then
				for _,ingredient in pairs(recipes[item]) do
					if (ingredient.remove ~= nil and ingredient.remove) or (ingredient.remove == nil) then
						xPlayer.removeInventoryItem(ingredient.item, ingredient.quantity)
					end
				end

				local Timer = 30000

				if item == "WEAPON_PUMPSHOTGUN" or item == "WEAPON_SAWNOFFSHOTGUN" or item == "WEAPON_MUSKET" then
					Timer = 90000
				end
				if item == "WEAPON_SNSPISTOL" or item == "WEAPON_REVOLVER" or
				item == "WEAPON_HEAVYPISTOL" or item == "WEAPON_DOUBLEACTION" or item == "WEAPON_VINTAGEPISTOL" or
				item == "WEAPON_MARKSMANPISTOL" or item == "WEAPON_PISTOL" or item == "WEAPON_COMBATPISTOL" or item == "WEAPON_PISTOL50" then
					Timer = 60000
				end
				local TimerLabel = tonumber(Timer / 1000) .. " sekund"

				local timeHash = os.time()
				PlayerCrafting[xPlayer.identifier] = timeHash
				TriggerClientEvent('esx:showNotification', _source, 'Zahajil/a jsi vyrobu. Bude to trvat priblizne ' .. TimerLabel)
				TriggerClientEvent('salty_crafting:startProgressBar', _source, Timer)
				CreateWeapon(item, _source, xPlayer, timeHash, Timer)

				if inDrawingRange2 then
					local url = Config.Shop2.log
					local msg = GetPlayerName(source) .. " vyrobil/a " .. item
            		PerformHttpRequest(url, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
				end
			else
				TriggerClientEvent('esx:showNotification', _source, 'Nemas vsechny potrebne ingredience')
			end
		end
	end
end)
