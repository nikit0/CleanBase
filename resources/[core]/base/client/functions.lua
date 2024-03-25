-----------------------------------------------------------------------------------------------------------------------------------------
-- BASE:NOCLIP
-----------------------------------------------------------------------------------------------------------------------------------------
local NoClip = false
local NcSettings = {
	IDLE_MOVE = 1.0,
	FAST_MOVE = 5.0,
	SLOW_MOVE = 0.1,
}

function NoClip()
	NoClip = not NoClip
	local Ped = PlayerPedId()

	if NoClip then
		SetEntityInvincible(Ped,true)
		SetEntityVisible(Ped,false,false)
		SetEntityCollision(Ped,false,false)

		print("NC Command Enabled")
	else
		SetEntityInvincible(Ped,false)
		SetEntityVisible(Ped,true,false)
		SetEntityCollision(Ped,true,true)

		print("NC Command Disabled")
	end

	while NoClip do
		local Speed = NcSettings.IDLE_MOVE
		local Ped = PlayerPedId()
		local cX,cY,cZ = GetCamDirections()
		local Coords = GetEntityCoords(Ped)
		local X,Y,Z = table.unpack(Coords)

		if IsControlPressed(1,19) then
			Speed = NcSettings.SLOW_MOVE
		end

		if IsControlPressed(1,21) then
			Speed = NcSettings.FAST_MOVE
		end

		if IsControlPressed(1,32) then
			X = X + Speed * cX
			Y = Y + Speed * cY
			Z = Z + Speed * cZ
		end

		if IsControlPressed(1,33) then
			X = X - Speed * cX
			Y = Y - Speed * cY
			Z = Z - Speed * cZ
		end

		if IsControlPressed(1,10) then
			Z = Z + 0.25
		end

		if IsControlPressed(1,11) then
			Z = Z - 0.25
		end

		SetEntityCoordsNoOffset(Ped,X,Y,Z,false,false,false)
		Wait(1)
	end
end

exports("NoClip",NoClip)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BASE:GETCAMDIRECTION
-----------------------------------------------------------------------------------------------------------------------------------------
function GetCamDirections()
	local Ped = PlayerPedId()
	local Pitch = GetGameplayCamRelativePitch()
	local Heading = GetGameplayCamRelativeHeading() + GetEntityHeading(Ped)
	local x = -math.sin(Heading * math.pi / 180.0)
	local y = math.cos(Heading * math.pi / 180.0)
	local z = math.sin(Pitch * math.pi / 180.0)
	local Len = math.sqrt(x * x + y * y + z * z)
	if Len ~= 0 then
		x = x / Len
		y = y / Len
		z = z / Len
	end

	return x,y,z
end