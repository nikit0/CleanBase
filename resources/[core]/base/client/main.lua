-----------------------------------------------------------------------------------------------------------------------------------------
-- ONCLIENTRESOURCESTART
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("onClientResourceStart",function(ResourceName)
	if (GetCurrentResourceName() ~= ResourceName) then
		return
	end

	local ModelHash = GetHashKey("ig_sol")

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

	print("Spawn Loaded Successfully")
end)