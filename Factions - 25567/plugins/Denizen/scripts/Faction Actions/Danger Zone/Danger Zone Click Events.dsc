# Faction Action Danger Zone inventory click events.
danger_zone_click_events:
    type: world
    debug: false
    events:
        # Opens the Delete Confirmation Inventory from the Danger Zone Inventory.
        on player clicks faction_action_danger_zone_delete_faction_item in faction_action_danger_zone_inventory:
            - inventory open d:faction_action_danger_zone_delete_confirmation_inventory
        # Opens the Leave Faction Confirmation Inventory from the Danger Zone Inventory.
        on player clicks faction_action_danger_zone_leave_faction_item in faction_action_danger_zone_inventory:
            - inventory open d:faction_action_danger_zone_player_leave_confirm_inventory
        # Open inventory to remove a claim.
        on player clicks faction_action_danger_zone_remove_claim_from_faction_item in faction_action_danger_zone_inventory:
            - inventory close
            - run color_remove_map

        # --- Player changes their mind and want to go back ---
        on player clicks back_page_item in faction_action_danger_zone_delete_confirmation_inventory:
            - inventory open d:faction_action_danger_zone_inventory
        on player clicks back_page_item in faction_action_danger_zone_player_leave_confirm_inventory:
            - inventory open d:faction_action_danger_zone_inventory
        on player clicks back_page_item in faction_action_danger_zone_inventory:
            - run open_faction_action_inventory

        # Deletes the faction from the Danger Zone Confirmation Inventory.
        on player clicks faction_action_danger_zone_faction_deletion_confirmation_item in faction_action_danger_zone_delete_confirmation_inventory:
            - inventory close
            - run faction.delete
        # Leaves the faction.
        on player clicks faction_action_danger_zone_leave_faction_confirmation_item in faction_action_danger_zone_player_leave_confirm_inventory:
            - inventory close
            - run faction.leave
