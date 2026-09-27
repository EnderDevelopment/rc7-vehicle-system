local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('rc7system:checkRC7Ownership', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.identifier

    MySQL.Async.fetchScalar('SELECT has_rc7 FROM rc7_owners WHERE identifier = @identifier', {
        ['@identifier'] = identifier
    }, function(result)
        if result then
            cb(result == 1)
        else
            MySQL.Async.execute('INSERT INTO rc7_owners (identifier, has_rc7) VALUES (@identifier, 0)', {
                ['@identifier'] = identifier
            }, function()
                cb(false)
            end)
        end
    end)
end)

RegisterNetEvent('rc7system:buyRC7')
AddEventHandler('rc7system:buyRC7', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.identifier

    ESX.TriggerServerCallback('rc7system:checkRC7Ownership', source, function(hasRC7)
        if not hasRC7 then
            if xPlayer.getMoney() >= Config.RC7Price then
                xPlayer.removeMoney(Config.RC7Price)
                MySQL.Async.execute('UPDATE rc7_owners SET has_rc7 = 1 WHERE identifier = @identifier', {
                    ['@identifier'] = identifier
                }, function()
                    TriggerClientEvent('rc7system:spawnRC7', source)
                end)
            else
                TriggerClientEvent('esx:showNotification', source, 'You do not have enough money to buy RC7')
            end
        else
            TriggerClientEvent('esx:showNotification', source, 'You already own RC7')
        end
    end)
end)