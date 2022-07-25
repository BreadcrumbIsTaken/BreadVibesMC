# Click events for the Faction Action inventory.
player_clicks_in_faction_action_inventory:
    type: world
    debug: false
    events:
        # Creates a new Faction from the Faction Action Inventory.
        on player clicks faction_action_create_new_faction_item in faction_action_player_not_in_any_faction_inventory:
            - inventory close
            - run faction.create
        # Opens the Danger Zone Inventory from the Faction Action Inventory.
        on player clicks faction_action_danger_zone_item in faction_action_default_inventory:
            - inventory open d:faction_action_danger_zone_inventory

        # Player wants to leave their faction.
        on player clicks faction_action_danger_zone_leave_faction_item in faction_action_player_not_owner_inventory:
            - inventory open d:faction_action_danger_zone_player_leave_confirm_inventory
