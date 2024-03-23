-----------------------------------------------------------------------------------------------------------------------------------------
-- DWTEXTTHREAD
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    while true do
        Wait(0)
        DwText("Welcome to the ~b~Clean Base",0.032,0.77,0.5)
        DwText("~g~Online: ~w~"..GetNumberOfPlayers(),0.16,0.80,0.35)
        DwText("~r~Player: ~w~"..GetPlayerName(PlayerId()),0.16,0.82,0.35)
        DwText("~y~Commands F8: ~w~nc | god | tpcds | cds",0.16,0.84,0.35)
    end
end)