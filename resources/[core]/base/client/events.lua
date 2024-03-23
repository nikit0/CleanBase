-----------------------------------------------------------------------------------------------------------------------------------------
-- BASE:CLIENT:TELEPORTPLAYER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("Base:Client:TeleportPlayer")
AddEventHandler("Base:Client:TeleportPlayer",function(Pos)
    SetEntityCoords(PlayerPedId(),Pos["x"],Pos["y"],Pos["z"],false,false,false,false)

    local Coords = string.format("%.2f,%.2f,%.2f",Pos["x"],Pos["y"],Pos["z"])
    print("Teleported To Position:",Coords)
end)