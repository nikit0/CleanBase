-----------------------------------------------------------------------------------------------------------------------------------------
-- BASE:THREAD:GENERAL
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    while true do
        Wait(1000)

        DisplayRadar(DisplayHud)
        SetPedCanRagdoll(PlayerPedId(),false)
        AddTextEntry("FE_THDR_GTAO","Welcome to ~b~Clean Base")
        
        if IsPauseMenuActive() then
            SendNUIMessage({ Hud = false })
        else
            SendNUIMessage({ Hud = true })
        end
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