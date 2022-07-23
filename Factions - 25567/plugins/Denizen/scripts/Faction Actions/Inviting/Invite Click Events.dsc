# Inventory click events.
invite_players_click_events:
    type: world
    debug: false
    events:
        # Open list of players to invite
        on player clicks faction_action_invite_players_item in faction_action_default_inventory:
            - inventory open d:invite_other_players_to_faction_inventory
        # Send invite to clicked player
        on player clicks player_head in invite_other_players_to_faction_inventory:
            - flag <player> inviting:<context.item.flag[to_invite]>
            - run faction.invite
