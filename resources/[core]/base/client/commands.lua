-----------------------------------------------------------------------------------------------------------------------------------------
-- BASE:NC
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand(Config.Commands.Nc,function()
	-- NoClip()
	exports["base"]:NoClip()
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BASE:GOD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand(Config.Commands.God,function()
	local Ped = PlayerPedId()
	SetEntityHealth(Ped,200)
	ClearPedTasks(Ped)
	ClearPedSecondaryTask(Ped)
	ClearPedBloodDamage(Ped)
	SetEntityInvincible(Ped,false)
	NetworkResurrectLocalPlayer(GetEntityCoords(Ped),GetEntityHeading(Ped),true,false)

	print("God Command Used")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BASE:HUD
-----------------------------------------------------------------------------------------------------------------------------------------
DisplayHud = true
RegisterCommand(Config.Commands.Hud,function()
	DisplayHud = not DisplayHud

    SendNUIMessage({ Hud = DisplayHud })

	local DisplayHudText = DisplayHud and "Enabled" or "Disabled"
	print("Hud "..DisplayHudText)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BASE:REC
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand(Config.Commands.Rec,function()
	if IsRecording() then
        StopRecordingAndSaveClip()

		print("Recording Stopped")
    else
        StartRecording(1)

		print("Recording Started")
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BASE:CDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand(Config.Commands.Cds,function()
	local Pos = GetEntityCoords(PlayerPedId())
    local Coords = string.format("%.2f,%.2f,%.2f",Pos["x"],Pos["y"],Pos["z"])
	print("Position:",Coords)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BASE:TPCDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand(Config.Commands.Tpcds,function(Source,Args)
    if #Args < 1 then
        print("Usage: tpcds x,y,z")
        return
    end

    local Coords = {}
    for Coord in string.gmatch(Args[1],"[^,]+") do
        table.insert(Coords,tonumber(Coord))
    end

    if #Coords == 3 then
        TriggerEvent("Base:Client:TeleportPlayer",{["x"] = Coords[1], ["y"] = Coords[2], ["z"] = Coords[3]})
    else
        print("Invalid coordinates. Please enter in the format tpcds x,y,z.")
    end
end)