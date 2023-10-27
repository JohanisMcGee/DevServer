QBCore.Functions.CreateCallback('qb-redzone:server:IsInZone', function(source, cb, zone)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local isInZone = false

    if zone == "Kortz" then
        local distance = #(Player.PlayerData.position - Config.RedZone[zone].Coords)
        if distance <= Config.RedZone[zone].Size then
            isInZone = true
        end
    end

    cb(isInZone)
end)

RegisterServerEvent('qb-redzone:server:EnterZone')
AddEventHandler('qb-redzone:server:EnterZone', function(zone)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if zone == "Kortz" then
        TriggerClientEvent('qb-redzone:client:EnteredZone', src, zone)
    end
end)

RegisterServerEvent('qb-redzone:server:LeaveZone')
AddEventHandler('qb-redzone:server:LeaveZone', function(zone)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if zone == "Kortz" then
        TriggerClientEvent('qb-redzone:client:LeftZone', src, zone)
    end
end)

QBCore.Commands.Add("enterzone", "Enter the redzone", {}, false, function(source, args)
    TriggerClientEvent('qb-redzone:client:EnterZone', source)
end)
