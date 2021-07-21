local Keys = {["F6"] = 167}

local PlayerData                = {}
ESX                             = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

function OpenAdminActionsMenu()

  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'admin_actions',
    {
      title    = 'Admin',
      align    = 'top-left',
      elements = {
        {label = 'Interakce s vozidlem', value = 'vehicle_interaction'},
      },
    },
    function(data, menu)


      if data.current.value == 'vehicle_interaction' then

        ESX.UI.Menu.Open(
          'default', GetCurrentResourceName(), 'vehicle_interaction',
          {
            title    = 'Interakce s vozidlem',
            align    = 'top-left',
            elements = {
              {label = 'Odemknout vozidlo',    value = 'hijack_vehicle'},
              {label = 'Umyt vozidlo', value = 'vehicle_clean'},
              {label = 'Opravit vozidlo', value = 'vehicle_repair'},
            },
          },
          function(data2, menu2)

            local playerPed = GetPlayerPed(-1)
            local coords    = GetEntityCoords(playerPed)
            local vehicle   = GetClosestVehicle(coords.x,  coords.y,  coords.z,  3.0,  0,  71)

            if DoesEntityExist(vehicle) then

              local vehicleData = ESX.Game.GetVehicleProperties(vehicle)

              if data2.current.value == 'vehicle_repair' then         
                if IsPedSittingInAnyVehicle(playerPed) then
                  ESX.ShowNotification('Nemuzes umyt auto kdyz sedis uvnitr')
                  return
                end
            
                isBusy = true
                TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
                Citizen.CreateThread(function()
                  Citizen.Wait(2000)
          
                  SetVehicleFixed(vehicle)
                  SetVehicleDeformationFixed(vehicle)
                  SetVehicleUndriveable(vehicle, false)
                  SetVehicleEngineOn(vehicle, true, true)
                  ClearPedTasksImmediately(playerPed)
          
                  ESX.ShowNotification('Vozidlo opraveno')
                  isBusy = false
                end)
              end
              
              if data2.current.value == 'vehicle_clean' then
                local text = "*Bere hadr z kapsy a cistí vozidlo*"
          
                if IsPedSittingInAnyVehicle(playerPed) then
                  ESX.ShowNotification('Nemuzes umyt auto kdyz sedis uvnitr')
                  return
                end
          
                IsBusy = true
                TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_MAID_CLEAN", 0, true)
                TriggerServerEvent('3dme:shareDisplay', text)
                Citizen.CreateThread(function()
                  exports['progressBars']:startUI(2000, "Cistení vozidla")
                  Citizen.Wait(2000)
        
                  WashDecalsFromVehicle(vehicle, 1.0)
                  SetVehicleDirtLevel(vehicle)
                  ClearPedTasksImmediately(playerPed)
        
                  ESX.ShowNotification('Auto umyto')
                  IsBusy = false
                end)
              end

              if data2.current.value == 'hijack_vehicle' then

                local playerPed = GetPlayerPed(-1)
                local coords    = GetEntityCoords(playerPed)

                if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 3.0) then

                  local vehicle = GetClosestVehicle(coords.x,  coords.y,  coords.z,  3.0,  0,  71)

                  if DoesEntityExist(vehicle) then

                    Citizen.CreateThread(function()

                      TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)

                      Wait(2000)

                      ClearPedTasksImmediately(playerPed)

                      SetVehicleDoorsLocked(vehicle, 1)
                      SetVehicleDoorsLockedForAllPlayers(vehicle, false)

                      TriggerEvent('esx:showNotification', 'Vozidlo odemceno')

                    end)

                  end

                end

              end

            else
              ESX.ShowNotification('Zadne vozidlo v okoli')
            end

          end,
          function(data2, menu2)
            menu2.close()
          end
        )

      end

    end,
    function(data, menu)
      menu.close()
    end
  )

end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

-- Key Controls
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)

    if 
      IsControlPressed(0,  Keys['F6']) and PlayerData.job ~= nil and
      PlayerData.job.name == 'admin' and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'admin_actions')
    then
      OpenAdminActionsMenu()
    end
  end
end)
