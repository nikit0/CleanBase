-----------------------------------------------------------------------------------------------------------------------------------------
-- BASE:SERVER:ADDPLAYER
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
        TriggerClientEvent("Base:Client:TeleportPlayer",source,Pos)
    else
        TriggerClientEvent("Base:Client:TeleportPlayer",source,{ x = -1648.06, y = -1017.98, z = 13.01 })
    end
end)