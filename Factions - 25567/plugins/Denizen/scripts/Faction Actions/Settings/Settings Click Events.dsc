faction_action_settings_inventory_click_events:
    type: world
    events:
        on player clicks faction_action_settings_item in faction_action_default_inventory:
            - run faction.settings
        on player clicks previous_page_item in faction_action_settings_inventory:
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
