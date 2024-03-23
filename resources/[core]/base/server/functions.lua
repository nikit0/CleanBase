-----------------------------------------------------------------------------------------------------------------------------------------
-- BASE:SERVER:GETIDENTIFIERS
-----------------------------------------------------------------------------------------------------------------------------------------
function GetIdentifiers(source)
    local Identifiers = GetPlayerIdentifiers(source)
    for _,Identifier in ipairs(Identifiers) do
        if string.find(Identifier,"license:") then
            return Identifier
        end
    end
    return nil
end