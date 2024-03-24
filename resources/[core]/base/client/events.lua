-----------------------------------------------------------------------------------------------------------------------------------------
-- BASE:CLIENT:UPDATEHUD
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Base:Client:UpdateHud",function()
    local Online = #GetActivePlayers()
    local Player = GetPlayerName(PlayerId())
    SendNUIMessage({ Action = "UpdateHud", Player = Player, Online = Online })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BASE:CLIENT:TELEPORTPLAYER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("Base:Client:TeleportPlayer")
AddEventHandler("Base:Client:TeleportPlayer",function(Pos)
    SetEntityCoords(PlayerPedId(),Pos["x"],Pos["y"],Pos["z"],false,false,false,false)

    local Coords = string.format("%.2f,%.2f,%.2f",Pos["x"],Pos["y"],Pos["z"])
    print("Teleported To Position:",Coords)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GAMEEVENTTRIGGERED
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("gameEventTriggered",function(Name,Args)
	if Name == "CEventNetworkEntityDamage" then
		local Ped = PlayerPedId()
		if GetEntityHealth(Ped) <= 0 then
            SetEntityHealth(Ped,200)

            print("Player Health Restored")
		end
	end
end)