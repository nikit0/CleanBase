-----------------------------------------------------------------------------------------------------------------------------------------
-- THREAD
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    while true do
        Wait(100)

        DisplayRadar(DisplayHud)
        SetPedCanRagdoll(PlayerPedId(),false)
        AddTextEntry("FE_THDR_GTAO","Welcome to ~b~Clean Base")
    end
end)