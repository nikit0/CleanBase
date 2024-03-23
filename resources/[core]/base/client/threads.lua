-----------------------------------------------------------------------------------------------------------------------------------------
-- THREAD
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    while true do
        Wait(1)
        if DisplayHud then
            DwText("Welcome to ~b~Clean Base",0.040,0.77,0.5)
            DwText("~g~Online: ~w~"..GetNumberOfPlayers(),0.16,0.80,0.35)
            DwText("~r~Player: ~w~"..GetPlayerName(PlayerId()),0.16,0.82,0.35)
            DwText("~y~Commands:",0.16,0.84,0.35)
            DwText("nc",0.16,0.86,0.35)
            DwText("god",0.16,0.88,0.35)
            DwText("hud",0.16,0.90,0.35)
            DwText("rec",0.16,0.92,0.35)
            DwText("cds",0.16,0.94,0.35)
            DwText("tpcds ~g~[x,y,z]",0.16,0.96,0.35)
        end

        DisplayRadar(DisplayHud)
        SetPedCanRagdoll(PlayerPedId(),false)
        AddTextEntry("FE_THDR_GTAO","Welcome to ~b~Clean Base")
    end
end)