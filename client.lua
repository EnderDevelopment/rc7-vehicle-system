local ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local distance = #(playerCoords - Config.RC7Spawn)

        if distance < 10.0 then
            DrawMarker(1, Config.RC7Spawn.x, Config.RC7Spawn.y, Config.RC7Spawn.z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 255, 0, 0, 100, false, true, 2, false, nil, nil, false)

            if distance < 1.5 then
                ESX.ShowHelpNotification('Press ~INPUT_CONTEXT~ to buy RC7')

                if IsControlJustReleased(0, 38) then
                    TriggerServerEvent('rc7system:buyRC7')
                end
            end
        end
    end
end)

RegisterNetEvent('rc7system:spawnRC7')
AddEventHandler('rc7system:spawnRC7', function()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local rc7 = CreateVehicle(Config.RC7Model, Config.RC7Spawn.x, Config.RC7Spawn.y, Config.RC7Spawn.z, Config.RC7SpawnHeading, true, false)
    SetVehicleHasBeenOwnedByPlayer(rc7, true)
    SetEntityAsMissionEntity(rc7, true, true)
    SetVehicleNumberPlateText(rc7, 'RC7')
end)