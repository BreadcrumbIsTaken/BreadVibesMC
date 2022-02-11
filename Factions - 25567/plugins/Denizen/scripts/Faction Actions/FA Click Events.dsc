player_clicks_in_faction_action_inventory:
    type: world
    events:
        # Creates a new Faction from the Faction Action Inventory.
        on player clicks faction_action_create_new_faction_item in faction_action_player_not_in_any_faction_inventory:
            - inventory close
            - run faction.create
        # Deletes the faction from the Danger Zone Confirmation Inventory.
        on player clicks faction_action_danger_zone_faction_deletion_confirmation_item in faction_action_danger_zone_delete_confirmation_inventory:
            - inventory close
            - run faction.delete
        # Opens the Transfer Ownership Inventory from the Danger Zone Inventory
        on player clicks faction_action_danger_zone_transfer_ownership_item in faction_action_danger_zone_inventory:
            - inventory close
            - run faction.transfer_ownership
        # Leaves the faction.
        on player clicks faction_action_danger_zone_leave_faction_confirmation_item in faction_action_danger_zone_player_leave_confirm_inventory:
            - inventory close
            - run faction.leave

        # Opens the Danger Zone Inventory from the Faction Action Inventory.
        on player clicks faction_action_danger_zone_item in faction_action_default_inventory:
            - inventory open d:faction_action_danger_zone_inventory
        # Opens the Delete Confirmation Inventory from the Danger Zone Inventory.
        on player clicks faction_action_danger_zone_delete_faction_item in faction_action_danger_zone_inventory:
            - inventory open d:faction_action_danger_zone_delete_confirmation_inventory
        # Opens the Leave Faction Confirmation Inventory from the Danger Zone Inventory.
        on player clicks faction_action_danger_zone_leave_faction_item in faction_action_danger_zone_inventory:
            - inventory open d:faction_action_danger_zone_player_leave_confirm_inventory

        # --- Player changes their mind and want to go back ---
        on player clicks previous_page_item in faction_action_danger_zone_delete_confirmation_inventory:
            - inventory open d:faction_action_danger_zone_inventory
        on player clicks previous_page_item in faction_action_danger_zone_player_leave_confirm_inventory:
            - inventory open d:faction_action_danger_zone_inventory
        on player clicks previous_page_item in faction_action_danger_zone_inventory:
            - inventory open d:faction_action_default_inventory

        # Settings
        on player clicks faction_action_settings_item in faction_action_default_inventory:
            - define inv <inventory[faction_action_settings_inventory]>
            - inventory d:<[inv]> adjust slot:14 material:<proc[ColorEngine].context[<proc[get_settings].context[<player.flag[faction]>].get[color]>|DYE]>_dye
            - inventory open d:<[inv]>
        on player clicks previous_page_item in faction_action_settings_inventory:
            - inventory open d:faction_action_default_inventory