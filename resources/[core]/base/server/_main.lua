-----------------------------------------------------------------------------------------------------------------------------------------
-- BASE:SERVER:CONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("Base:Server:Connect")
AddEventHandler("Base:Server:Connect",function()
    local source = source
    local License = GetPlayerIdentifiers(source)[1]

    if License == nil then
        DropPlayer(source,"You do not have a valid Rockstar license.")
        return
    end

    local LastPos = GetResourceKvpString("LastPos:"..License)
    if LastPos ~= nil then
        local Pos = json.decode(LastPos)
        TriggerClientEvent("Base:Client:Teleport",source,Pos)
    else
        TriggerClientEvent("Base:Client:Teleport",source,{ x = -1648.06, y = -1017.98, z = 13.01 })
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BASE:SERVER:PLAYERDROPPED
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("playerDropped",function(Reason)
    local License = GetIdentifiers(source)
    if License ~= nil then
        local Pos = GetEntityCoords(GetPlayerPed(source))
        SetResourceKvp("LastPos:"..License,json.encode(Pos))
    end
end)