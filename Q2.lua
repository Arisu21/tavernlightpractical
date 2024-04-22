function printSmallGuildNames(memberCount)
    -- this method is supposed to print names of all guilds that have less than memberCount max members
    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
    -- db.storequery only returns the ID of said guild. db.query used to execute proper query
    local result = db.query(string.format(selectGuildQuery, memberCount))
    -- for loop added to go through each guild 
    for row in result:nrows() do
        -- getString changed to use result object passed together with row and guild name
        local guildName = result:getString(row, "name")
        print(guildName)
    end
end