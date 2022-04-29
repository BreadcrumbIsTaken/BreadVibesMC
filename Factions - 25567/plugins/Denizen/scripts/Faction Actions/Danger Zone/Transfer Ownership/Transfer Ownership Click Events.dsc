# Faction Action tranfer ownership inventory click events.
faction_action_transfer_ownership_click_events:
    type: world
    debug: false
    events:
        on player clicks faction_action_danger_zone_transfer_ownership_item in faction_action_danger_zone_inventory:
            - inventory close
            - run faction.transfer_ownership
        on player clicks previous_page_item in faction_action_danger_zone_transfer_ownership_player_list_inventory:
            - inventory open d:faction_action_danger_zone_inventory
