-----------------------------------------------------------------------------------------------------------------------------------------
-- THREAD
-----------------------------------------------------------------------------------------------------------------------------------------
local texts = {
    { "Welcome to ~b~Clean Base",0.040,0.77,0.5 },
    { "~g~Online: ~w~" .. GetNumberOfPlayers(),0.16,0.80,0.35 },
    { "~r~Player: ~w~" .. GetPlayerName(PlayerId()),0.16,0.82,0.35 },
    { "~y~Commands:",0.16,0.84,0.35 },
    { "nc",0.16,0.86,0.35 },
    { "god",0.16,0.88,0.35 },
    { "hud",0.16,0.90,0.35 },
    { "rec",0.16,0.92,0.35 },
    { "cds",0.16,0.94,0.35 },
    { "tpcds ~g~[x,y,z]",0.16,0.96,0.35 }
}

CreateThread(function()
    while true do
        Wait(1)
        if DisplayHud then
            for _,v in pairs(texts) do
                DwText(v[1],v[2],v[3],v[4])
            end
        end

        DisplayRadar(DisplayHud)
        SetPedCanRagdoll(PlayerPedId(),false)
        AddTextEntry("FE_THDR_GTAO","Welcome to ~b~Clean Base")
    end
end)