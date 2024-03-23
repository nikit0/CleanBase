-----------------------------------------------------------------------------------------------------------------------------------------
-- BASE:CLIENT:TELEPORTPLAYER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("Base:Client:TeleportPlayer")
AddEventHandler("Base:Client:TeleportPlayer",function(Pos)
    print("Teleported to position:",Pos["x"],Pos["y"],Pos["z"])
    SetEntityCoords(PlayerPedId(),Pos["x"],Pos["y"],Pos["z"],false,false,false,false)
end)