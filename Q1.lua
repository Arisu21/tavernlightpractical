local function releaseStorage(player)
    player:setStorageValue(1000, -1)
end

function onLogout(player)
    if player:getStorageValue(1000) == 1 then
        addEvent(releaseStorage, 1000, player)
        return true
    else
        -- False is return during the event that the value matched does not equal 1
        return false
    end
end