faction_action_settings_inventory_click_events:
    type: world
    events:
        on player clicks faction_action_settings_item in faction_action_default_inventory:
            - run faction.settings
        on player clicks previous_page_item in faction_action_settings_inventory:
            - inventory open d:faction_action_default_inventory
        on player clicks faction_action_settings_faction_name_item in faction_action_settings_inventory:
            - inventory close
            - run faction_name_change_textbox
