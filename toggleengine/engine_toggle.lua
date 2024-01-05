RegisterCommand('engine', function(source, args, rawCommand)
    local playerPed = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if DoesEntityExist(vehicle) and not IsEntityDead(vehicle) then
        local engineState = GetIsVehicleEngineRunning(vehicle)

        if engineState then
            -- Engine is running, turn it off
            SetVehicleEngineOn(vehicle, false, false, true)
            TriggerEvent('chatMessage', '^*^3Vehicle engine turned off.^r')
        else
            -- Engine is off, turn it on
            SetVehicleEngineOn(vehicle, true, false, true)
            TriggerEvent('chatMessage', '^*^3Vehicle engine turned on.^r')
        end
    else
        TriggerEvent('chatMessage', '^1You must be inside a vehicle to use this command.^r')
    end
end, false)
