void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
    --From what I understood, the memory leakage happens when the player contains a null pointer does not get deleted
    --Solution: I was able to read up on unique pointers and how they'd automatically delete the object if it goes out of scope
    std::unique_ptr<Player> player;
    Player* rawPlayer = g_game.getPlayerByName(recipient);
    if (!rawPlayer) {
        player = std::make_unique<Player>(nullptr);
        if (!IOLoginData::loadPlayerByName(player.get(), recipient)) {
            return;
        }
    } else {
        player = std::unique_ptr<Player>(rawPlayer);
    }

    Item* item = Item::CreateItem(itemId);
    if (!item) {
        return;
    }

    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline()) {
        IOLoginData::savePlayer(player.get());
    }
}