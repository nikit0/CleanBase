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
-- NC
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("nc",function()
	NoClip()
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPCDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tpcds", function(args)
	local x = tonumber(args[1]) or 0
    local y = tonumber(args[2]) or 0
    local z = tonumber(args[3]) or 0

	TriggerEvent("Base:Client:TeleportPlayer",{ x = x, y = y, z = z })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("cds", function()
	local Ped = GetEntityCoords(PlayerPedId())
    local Coords = string.format("%.2f,%.2f,%.2f",Ped["x"],Ped["y"],Ped["z"])

	print("Current Position:",Coords)
end)