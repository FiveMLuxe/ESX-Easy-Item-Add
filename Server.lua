ESX = exports["es_extended"]:getSharedObject()
RegisterServerEvent('myadditem:addItem')
AddEventHandler('myadditem:addItem', function(name, label, weight, canRemove, playerId)
    local player = ESX.GetPlayerFromId(playerId)
    if canRemove == nil then
        canRemove = 1
    end

    if IsPlayerAceAllowed(playerId, "PM-Items") then
        MySQL.Async.execute('INSERT INTO items (name, label, weight, can_remove) VALUES (@name, @label, @weight, @canRemove)', {
            ['@name'] = name,
            ['@label'] = label,
            ['@weight'] = weight,
            ['@canRemove'] = canRemove
        }, function(rowsChanged)
            if rowsChanged > 0 then
                TriggerClientEvent('okokNotify:Alert', playerId, "Success", 'Added item '..name..' to database.', 15, 'info')
            end
        end)
    else
        TriggerClientEvent('okokNotify:Alert', playerId, "Error", 'You do not have permission to use this.', 15, 'error')
    end
end)
