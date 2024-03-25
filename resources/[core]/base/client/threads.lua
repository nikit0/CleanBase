-----------------------------------------------------------------------------------------------------------------------------------------
-- BASE:THREAD:GENERAL
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    AddTextEntry("FE_THDR_GTAO","Welcome to ~b~Clean Base")
    while true do
        Wait(1000)

        if IsPauseMenuActive() then
            SendNUIMessage({ Hud = false })
        else
            SendNUIMessage({ Hud = DisplayHud })
        end
    
        SetPedCanRagdoll(PlayerPedId(),false)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BASE:THREAD:UPDATEHUD
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    while true do
        Wait(10000)

        TriggerEvent("Base:Client:UpdateHud")
    end
end)