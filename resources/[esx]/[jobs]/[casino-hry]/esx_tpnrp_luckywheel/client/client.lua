local ESX = nil
local _wheel = nil
local _lambo = nil
local _basewheel = nil
local _wheelPos = vector3(1109.76, 227.89, -49.64)
local _baseWheelPos = vector3(1111.052, 229.8492, -50.64093)
local Keys = {
	["ESC"] = 322, ["BACKSPACE"] = 177, ["E"] = 38, ["ENTER"] = 18,	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173
}
local _isRolling = false

function LoadEverything ()
    local model = GetHashKey('vw_prop_vw_luckywheel_02a')
    local baseWheelModel = GetHashKey('vw_prop_vw_luckywheel_01a')
    local carmodel = GetHashKey('18performante')

    Citizen.CreateThread(function()
        -- Base wheel
        RequestModel(baseWheelModel)
        while not HasModelLoaded(baseWheelModel) do
            Citizen.Wait(0)
        end

        _basewheel = CreateObject(baseWheelModel, _baseWheelPos.x, _baseWheelPos.y, _baseWheelPos.z, true, false, true)
        SetEntityHeading(_basewheel, 0.0)
        SetModelAsNoLongerNeeded(baseWheelModel)

        -- Wheel
        RequestModel(model)

        while not HasModelLoaded(model) do
            Citizen.Wait(0)
        end

        _wheel = CreateObject(model, 1111.052, 229.8492, -50.38, true, false, true)
        SetEntityHeading(_wheel, 0.0)
        SetModelAsNoLongerNeeded(model)
        
        -- Car
        RequestModel(carmodel)
        while not HasModelLoaded(carmodel) do
            Citizen.Wait(0)
        end

        local vehicle = CreateVehicle(carmodel, 1100.648, 219.8622, -49.7, 0.0, false, false)
        ESX.Game.SetVehicleProperties(vehicle, {color1 = 138})
        SetModelAsNoLongerNeeded(carmodel)
        

        -- RequestCollisionAtCoord(1100.39, 220.09, -48.75)

        -- while not HasCollisionLoadedAroundEntity(vehicle) do
        --     RequestCollisionAtCoord(1100.39, 220.09, -48.75)
        --     Citizen.Wait(0)
        -- end

        -- SetVehRadioStation(vehicle, 'OFF')
        FreezeEntityPosition(vehicle, true)
        local _curPos = GetEntityCoords(vehicle)
        SetEntityCoords(vehicle, 1100.648, 219.8622, -49.7, false, false, true, true)
        _lambo = vehicle
        
    end)
end

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	while not ESX.IsPlayerLoaded() do 
        Citizen.Wait(500)
    end

    if ESX.IsPlayerLoaded() then
        LoadEverything()
    end
end)

Citizen.CreateThread(function() 
    while true do
        if _lambo ~= nil then
            local _heading = GetEntityHeading(_lambo)
            local _z = _heading - 0.3
            SetEntityHeading(_lambo, _z)
        end
        Citizen.Wait(5)
    end
end)

function round(x)
    return x>=0 and math.floor(x+0.5) or math.ceil(x-0.5)
end

RegisterCommand('testwheel', function(source, args)
    TriggerEvent('esx_tpnrp_luckywheel:doRoll', args[1])
end)

RegisterNetEvent("esx_tpnrp_luckywheel:doRoll")
AddEventHandler("esx_tpnrp_luckywheel:doRoll", function(_priceIndex) 
    _isRolling = true

    SetEntityHeading(_wheel, -30.0)
    SetEntityRotation(_wheel, 0.0, 0.0, 0.0, 1, true)

    Citizen.CreateThread(function()
        local speedIntCnt = 1
        local rollspeed = 1.0
        local _winAngle = -164 + ((_priceIndex - 1) * 18)
        local _rollAngle = _winAngle + (360 * 8)
        local _midLength = (_rollAngle / 2)
        local intCnt = 0
        while speedIntCnt > 0 do
            local retval = GetEntityRotation(_wheel, 1)
            if _rollAngle > _midLength then
                speedIntCnt = speedIntCnt + 1
            else
                speedIntCnt = speedIntCnt - 1
                if speedIntCnt < 0 then
                    speedIntCnt = 0
                end
            end
            intCnt = intCnt + 1
            rollspeed = speedIntCnt / 10
            local _y = retval.y - rollspeed
            _rollAngle = _rollAngle - rollspeed
            SetEntityRotation(_wheel, 0.0, _y, 0.0, 1, true)
            Citizen.Wait(0)
        end

        if GetEntityRotation(_wheel, 1).y ~= _winAngle then
            local speedIntCnt2 = 1
            while speedIntCnt2 > 0 do
                local retval = GetEntityRotation(_wheel, 1)
                local _y = retval.y - speedIntCnt2
                print(round(_y), round(_winAngle))
                if round(_y) == round(_winAngle) then
                    print(_winAngle)
                    _y = _winAngle
                    speedIntCnt2 = 0
                end
                SetEntityRotation(_wheel, 0.0, _y, 0.0, 1, true)
                Citizen.Wait(0)
            end
        end

        print(GetEntityRotation(_wheel, 1).y)
    end)
end)

RegisterNetEvent("esx_tpnrp_luckywheel:rollFinished")
AddEventHandler("esx_tpnrp_luckywheel:rollFinished", function() 
    _isRolling = false
end)


function doRoll(priceIndex)
    if not _isRolling then
        _isRolling = true
        local playerPed = PlayerPedId()
        local _lib = 'anim_casino_a@amb@casino@games@lucky7wheel@female'
        if IsPedMale(playerPed) then
            _lib = 'anim_casino_a@amb@casino@games@lucky7wheel@male'
        end
        local lib, anim = _lib, 'enter_right_to_baseidle'
        ESX.Streaming.RequestAnimDict(lib, function()
            local _movePos = vector3(1109.55, 228.88, -49.64)
            TaskGoStraightToCoord(playerPed,  _movePos.x,  _movePos.y,  _movePos.z,  1.0,  -1,  312.2,  0.0)
            local _isMoved = false
            while not _isMoved do
                local coords = GetEntityCoords(PlayerPedId())
                if coords.x >= (_movePos.x - 0.01) and coords.x <= (_movePos.x + 0.01) and coords.y >= (_movePos.y - 0.01) and coords.y <= (_movePos.y + 0.01) then
                    _isMoved = true
                end
                Citizen.Wait(0)
            end
            TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
            while IsEntityPlayingAnim(playerPed, lib, anim, 3) do
                    Citizen.Wait(0)
                    DisableAllControlActions(0)
            end
            TaskPlayAnim(playerPed, lib, 'enter_to_armraisedidle', 8.0, -8.0, -1, 0, 0, false, false, false)
            while IsEntityPlayingAnim(playerPed, lib, 'enter_to_armraisedidle', 3) do
                Citizen.Wait(0)
                DisableAllControlActions(0)
            end
            TriggerEvent("esx_tpnrp_luckywheel:doRoll", priceIndex)
            TaskPlayAnim(playerPed, lib, 'armraisedidle_to_spinningidle_high', 8.0, -8.0, -1, 0, 0, false, false, false)
        end)
    end
end

-- Menu Controls
Citizen.CreateThread(function()
	while true do
        Citizen.Wait(1)
        local coords = GetEntityCoords(PlayerPedId())

        if(GetDistanceBetweenCoords(coords, _wheelPos.x, _wheelPos.y, _wheelPos.z, true) < 1.5) and not _isRolling then
            ESX.ShowHelpNotification("Stiskni ~INPUT_CONTEXT~ pro zatoceni kolem")
            if IsControlJustReleased(0, Keys['E']) then
                ESX.TriggerServerCallback('esx_tpnrp_luckywheel:hasItem', function(hasItem)
                    if hasItem then
                        ESX.TriggerServerCallback('esx_tpnrp_luckywheel:pickPrice', function(priceIndex)
                            if priceIndex then
                                doRoll(priceIndex)
                            end
                        end)
                    else
                        ESX.ShowNotification('Nemuzes tocit kolem bez listku')
                    end
                end)
            end
        end		
	end
end)