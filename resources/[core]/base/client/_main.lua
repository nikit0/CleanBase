-----------------------------------------------------------------------------------------------------------------------------------------
-- BASE:ONCLIENTRESOURCESTART
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("onClientResourceStart",function(ResourceName)
	if (GetCurrentResourceName() ~= ResourceName) then
		return
	end

	local ModelHash = GetHashKey(Config.Model)

	RequestModel(ModelHash)
	while not HasModelLoaded(ModelHash) do
		Wait(1)
	end

	if HasModelLoaded(ModelHash) then
		SetPlayerModel(PlayerId(),ModelHash)
		SetModelAsNoLongerNeeded(ModelHash)
		FreezeEntityPosition(PlayerPedId(),false)
		TriggerServerEvent("Base:Server:Connect")
	end

	ShutdownLoadingScreen()
	ShutdownLoadingScreenNui()
	Wait(500)

	TriggerEvent("Base:Client:UpdateHud")

	print("Spawn Loaded Successfully")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BASE:GAMEEVENTTRIGGERED
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("gameEventTriggered",function(Name)
	if Name == "CEventNetworkEntityDamage" then
		local Ped = PlayerPedId()
		if GetEntityHealth(Ped) <= 0 then
            SetEntityHealth(Ped,200)

            print("Player Health Restored")

			Wait(3000)
			NetworkResurrectLocalPlayer(GetEntityCoords(Ped),GetEntityHeading(Ped),true,false)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BASE:CLIENT:UPDATEHUD
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Base:Client:UpdateHud",function()
    local Online = #GetActivePlayers()
    local Player = GetPlayerName(PlayerId())
    SendNUIMessage({ Hud = "UpdateHud", Online = Online, Player = Player })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BASE:CLIENT:TELEPORT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("Base:Client:Teleport")
AddEventHandler("Base:Client:Teleport",function(Pos)
    SetEntityCoords(PlayerPedId(),Pos["x"],Pos["y"],Pos["z"],false,false,false,false)

    local Coords = string.format("%.2f,%.2f,%.2f",Pos["x"],Pos["y"],Pos["z"])
    print("Teleported To Position:",Coords)
end)