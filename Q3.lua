--name changed to suit function
function kickFromParty(playerId, membername)
    local player = Player(playerId)
    --added handler if player cannot be found
    if not player then
        error("Player not found: ".. playerId)
    end

    local party = player:getParty()
    --check to see if player is in a party
    if not party then
        error("Player is not in a party: ".. playerId)
    end

    local member = Player(membername)
    --loop changed to just check and see if player can be found in said party
    if not member then
        error("Member not found: ".. membername)
    end

    party:removeMember(member)
end