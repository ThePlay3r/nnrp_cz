ESX = nil
local display = false
local show = false
local inDrawingRange2 = false
local inRecipesDrawingRange = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

function isWeapon(item)
	local weaponList = ESX.GetWeaponList()
	for i=1, #weaponList, 1 do
		if weaponList[i].label == item or item == 'gadget_parachute' then
			return true
		end
	end
	return false
end

local function craftItem(ingredients)
	local ingredientsPrepped = {}
	for name, count in pairs(ingredients) do
		if count > 0 then
			table.insert(ingredientsPrepped, { item = name , quantity = count})
		end
	end
	TriggerServerEvent('salty_crafting:craftItem', ingredientsPrepped, inDrawingRange2)
end

RegisterNetEvent('salty_crafting:startProgressBar')
AddEventHandler('salty_crafting:startProgressBar', function(timer)
	exports['progressBars']:startUI(timer, "Vyroba zbrane")
end)

RegisterNetEvent('salty_crafting:openMenu')
AddEventHandler('salty_crafting:openMenu', function(playerInventory)
	SetNuiFocus(true,true)
	local preppedInventory = {}
	for i=1, #playerInventory, 1 do
		if playerInventory[i].count > 0 and not isWeapon(playerInventory[i].label) then
			table.insert(preppedInventory, playerInventory[i])
		end
	end
	SendNUIMessage({
		inventory = preppedInventory,
		display = true
	})
	display = true
end)

RegisterNUICallback('craftItemNUI', function(data, cb)
	craftItem(data)
end)

RegisterNUICallback('NUIFocusOff', function()
	SetNuiFocus(false, false)
	SendNUIMessage({
		display = false,
		show = false,
	})
	display = false
	show = false
end)

if Config.Keyboard.useKeyboard then
	-- Handle menu input
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)
			if IsControlJustReleased(1, Config.Keyboard.keyCode) and GetLastInputMethod(2) then
				TriggerServerEvent('salty_crafting:getPlayerInventory')
			end
		end
	end)
end

if Config.Shop.useShop then
	local inDrawingRange = false
	local function isPlayerInRange(coords1, coords2, range)	
		return (Vdist2(coords1.x, coords1.y, coords1.z, coords2.x, coords2.y, coords2.z) < range)
	end
	
	Citizen.CreateThread(function()
		-- local blip = AddBlipForCoord(Config.Shop.shopCoordinates.x, Config.Shop.shopCoordinates.y, Config.Shop.shopCoordinates.z)
		-- SetBlipSprite (blip, Config.Shop.shopBlipID)
		-- SetBlipDisplay(blip, 4)
		-- SetBlipScale  (blip, 0.0)
		-- SetBlipAsShortRange(blip, true)
		-- BeginTextCommandSetBlipName("STRING")
		-- AddTextComponentString(Config.Shop.shopName)
		-- EndTextCommandSetBlipName(blip)
		
		while true do
			Citizen.Wait(250)
			local playerCoords = GetEntityCoords(PlayerPedId())
			inDrawingRange = isPlayerInRange(playerCoords, Config.Shop.shopCoordinates, 100)
			inDrawingRange2 = isPlayerInRange(playerCoords, Config.Shop2.shopCoordinates, 100)
			inRecipesDrawingRange = isPlayerInRange(playerCoords, Config.RecipesInfo.shopCoordinates, 20)
		end
	end)
		
	Citizen.CreateThread(function()		
		while true do
			Citizen.Wait(0)
			if inDrawingRange then
				DrawMarker(
					1,
					Config.Shop.shopCoordinates.x, Config.Shop.shopCoordinates.y, Config.Shop.shopCoordinates.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0,
					Config.Shop.zoneSize.x, Config.Shop.zoneSize.y, Config.Shop.zoneSize.z, Config.Shop.zoneColor.r, Config.Shop.zoneColor.g,
					Config.Shop.zoneColor.b, Config.Shop.zoneColor.a, false, true, 2, false, false, false, false
				)
				if not display and isPlayerInRange(GetEntityCoords(PlayerPedId()), Config.Shop.shopCoordinates, Config.Shop.zoneSize.x) then
					SetTextComponentFormat('STRING')
					AddTextComponentString("Stiskni ~INPUT_CONTEXT~ pro vstup do menu vyrobny")
					DisplayHelpTextFromStringLabel(0, 0, 1, -1)
					if IsControlJustReleased(1, 38) then
						TriggerServerEvent('salty_crafting:getPlayerInventory')
					end
				end
			end

			if inDrawingRange2 then
				DrawMarker(
					1,
					Config.Shop2.shopCoordinates.x, Config.Shop2.shopCoordinates.y, Config.Shop2.shopCoordinates.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0,
					Config.Shop2.zoneSize.x, Config.Shop2.zoneSize.y, Config.Shop2.zoneSize.z, Config.Shop2.zoneColor.r, Config.Shop2.zoneColor.g,
					Config.Shop2.zoneColor.b, Config.Shop2.zoneColor.a, false, true, 2, false, false, false, false
				)
				if not display and isPlayerInRange(GetEntityCoords(PlayerPedId()), Config.Shop2.shopCoordinates, Config.Shop2.zoneSize.x) then
					SetTextComponentFormat('STRING')
					AddTextComponentString("Stiskni ~INPUT_CONTEXT~ pro vstup do menu vyrobny")
					DisplayHelpTextFromStringLabel(0, 0, 1, -1)
					if IsControlJustReleased(1, 38) then
						TriggerServerEvent('salty_crafting:getPlayerInventory')
					end
				end
			end
			
			if inRecipesDrawingRange then
				DrawMarker(
					1,
					Config.RecipesInfo.shopCoordinates.x, Config.RecipesInfo.shopCoordinates.y, Config.RecipesInfo.shopCoordinates.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0,
					Config.RecipesInfo.zoneSize.x, Config.RecipesInfo.zoneSize.y, Config.RecipesInfo.zoneSize.z, Config.RecipesInfo.zoneColor.r, Config.RecipesInfo.zoneColor.g,
					Config.RecipesInfo.zoneColor.b, Config.RecipesInfo.zoneColor.a, false, true, 2, false, false, false, false
				)
				if not show and isPlayerInRange(GetEntityCoords(PlayerPedId()), Config.RecipesInfo.shopCoordinates, Config.RecipesInfo.zoneSize.x) then
					SetTextComponentFormat('STRING')
					AddTextComponentString("Stiskni ~INPUT_CONTEXT~ pro odhaleni receptu")
					DisplayHelpTextFromStringLabel(0, 0, 1, -1)
					if IsControlJustReleased(1, 38) then
						show = true
						local parsedRecipes = {}

						for k,v in pairs(Config.RecipesNelegal) do
							local recept = "<div class='item'>" .. k .. " - "

							for l,q in ipairs(v) do
								if q.item == 'iron' then
									recept = recept .. "Zelezo: x" .. q.quantity .. ' '
								end
								if q.item == 'weapon_piece' then
									recept = recept .. "Soucastky: x" .. q.quantity .. ' '
								end
								if q.item == 'leather' then
									recept = recept .. "Kuze: x" .. q.quantity .. ' '
								end
							end
							recept = recept .. '</div>'
							table.insert(parsedRecipes, recept)
						end

						SetNuiFocus(true,true)
						SendNUIMessage({
							recipes = parsedRecipes,
							show = true
						})
					end
				end
			end
		end
	end)
end