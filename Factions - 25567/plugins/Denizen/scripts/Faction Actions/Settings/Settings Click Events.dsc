# Inventory click events for the Faction Action settings.
faction_action_settings_inventory_click_events:
    type: world
    debug: false
    events:
        on player clicks faction_action_settings_item in faction_action_default_inventory:
            - run faction.settings
        on player clicks back_page_item in faction_action_settings_inventory:
            - run open_faction_action_inventory
        on player clicks faction_action_settings_faction_name_item in faction_action_settings_inventory:
            - inventory close
            - run faction_name_change_textbox
        on player clicks faction_action_settings_color_item in faction_action_settings_inventory:
            - inventory open d:faction_action_settings_color_change_inventory
        on player clicks faction_action_settings_tagline_item in faction_action_settings_inventory:
            - inventory close
            - run faction_tagline_change_textbox
        on player clicks faction_action_settings_tagline_color_item in faction_action_settings_inventory:
            - inventory open d:faction_action_settings_tagline_color_change_inventory
        on player clicks faction_action_settings_teleport_coordinates_item in faction_action_settings_inventory:
            - inventory close
            - run select_teleport_coords
        on player clicks change_environment_item in faction_action_settings_inventory:
            - inventory open d:change_environment_settings_inventory
        on player clicks faction_action_settings_permissions_item in faction_action_settings_inventory:
            - inventory open d:change_faction_permissions_inventory
