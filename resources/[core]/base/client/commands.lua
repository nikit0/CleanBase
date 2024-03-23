-----------------------------------------------------------------------------------------------------------------------------------------
-- NC
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("nc",function()
	-- NoClip()
	exports["base"]:NoClip()
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GOD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("god",function()
	local Ped = PlayerPedId()
	NetworkResurrectLocalPlayer(GetEntityCoords(Ped),GetEntityHeading(Ped),true,false)
	ClearPedBloodDamage(Ped)
	SetEntityInvincible(Ped,false)
	SetEntityHealth(Ped,200)
	ClearPedTasks(Ped)
	ClearPedSecondaryTask(Ped)

	print("God Command Used")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPCDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tpcds",function(Source,Args)
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
-----------------------------------------------------------------------------------------------------------------------------------------
-- CDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("cds",function()
	local Pos = GetEntityCoords(PlayerPedId())
    local Coords = string.format("%.2f,%.2f,%.2f",Pos["x"],Pos["y"],Pos["z"])
	print("Position:",Coords)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD
-----------------------------------------------------------------------------------------------------------------------------------------
DisplayHud = true
RegisterCommand("hud",function()
	DisplayHud = not DisplayHud

	local DisplayHudText = DisplayHud and "Enabled" or "Disabled"
	print("Hud "..DisplayHudText)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REC
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("rec",function()
	if IsRecording() then
        StopRecordingAndSaveClip()

		print("Recording Stopped")
    else
        StartRecording(1)

		print("Recording Started")
    end
end)