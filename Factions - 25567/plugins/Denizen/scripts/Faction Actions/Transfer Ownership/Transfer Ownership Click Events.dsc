faction_action_transfer_ownership_click_events:
    type: world
    events:
        on player clicks faction_action_danger_zone_transfer_ownership_item in faction_action_danger_zone_inventory:
            - inventory close
            - run faction.transfer_ownership
