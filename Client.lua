ESX = exports["es_extended"]:getSharedObject()


RegisterNetEvent('myadditem:addItem')

RegisterCommand('additem', function(source)
    local itemName, label, weight, canRemove

    AddTextEntry('FMMC_KEY_TIP1', 'Enter item name:')
    DisplayOnscreenKeyboard(1, 'FMMC_KEY_TIP1', '', '', '', '', '', 128)

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        itemName = GetOnscreenKeyboardResult()
        AddTextEntry('FMMC_KEY_TIP1', 'Enter item label:')
        DisplayOnscreenKeyboard(1, 'FMMC_KEY_TIP1', '', '', '', '', '', 128)

        while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
            Wait(0)
        end

        if UpdateOnscreenKeyboard() ~= 2 then
            label = GetOnscreenKeyboardResult()
            AddTextEntry('FMMC_KEY_TIP1', 'Enter item weight:')
            DisplayOnscreenKeyboard(1, 'FMMC_KEY_TIP1', '', '', '', '', '', 128)

            while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
                Wait(0)
            end

            if UpdateOnscreenKeyboard() ~= 2 then
                weight = tonumber(GetOnscreenKeyboardResult())
                AddTextEntry('FMMC_KEY_TIP1', 'Enter if item can be removed (0 or 1):')
                DisplayOnscreenKeyboard(1, 'FMMC_KEY_TIP1', '', '', '', '', '', 128)

                while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
                    Wait(0)
                end

                if UpdateOnscreenKeyboard() ~= 2 then
                    canRemove = tonumber(GetOnscreenKeyboardResult())

                    TriggerServerEvent('myadditem:addItem', itemName, label, weight, canRemove, GetPlayerServerId(PlayerId()))

                end
            end
        end
    end
end)
