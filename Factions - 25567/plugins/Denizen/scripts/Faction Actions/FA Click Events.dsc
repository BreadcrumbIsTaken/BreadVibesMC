player_clicks_in_faction_action_inventory:
    type: world
    events:
        # Creates a new Faction from the Faction Action Inventory.
        on player clicks create_new_faction_item in faction_action_player_not_in_any_faction_inventory:
            - inventory close
            - run faction.create
        # Deletes the faction from the Danger Zone Confirmation Inventory.
        on player clicks faction_danger_zone_faction_deletion_confirmation_item in faction_action_danger_zone_delete_confirmation_inventory:
            - inventory close
            - run faction.delete

        # Opens the Danger Zone Inventory from the Faction Action Inventory.
        on player clicks faction_danger_zone_item in faction_action_default_inventory:
            - inventory open d:faction_action_danger_zone_inventory
        # Opens the Faction Action Inventory from the Danger Zone Inventory.
        on player clicks previous_page_item in faction_action_danger_zone_inventory:
            - inventory open d:faction_action_default_inventory
        # Opens the Delete Confirmation Inventory from the Danger Zone Inventory.
        on player clicks faction_danger_zone_delete_faction_item in faction_action_danger_zone_inventory:
            - inventory open d:faction_action_danger_zone_delete_confirmation_inventory