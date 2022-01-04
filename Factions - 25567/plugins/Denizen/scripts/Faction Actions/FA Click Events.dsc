player_clicks_in_faction_action_inventory:
    type: world
    events:
        on player clicks create_new_faction_item in faction_action_player_not_in_any_faction_inventory:
            - inventory close
            - run faction.create
        on player clicks faction_danger_zone_item in faction_action_default_inventory:
            - inventory open d:faction_action_danger_zone_inventory
        on player clicks previous_page_item in faction_action_danger_zone_inventory:
            - inventory open d:faction_action_default_inventory
        on player clicks faction_danger_zone_delete_faction_item in faction_action_danger_zone_inventory:
            - inventory open d:faction_action_danger_zone_delete_confirmation_inventory
        on player clicks faction_danger_zone_faction_deletion_confirmation_item in faction_action_danger_zone_delete_confirmation_inventory:
            - inventory close
            - run faction.delete