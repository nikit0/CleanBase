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