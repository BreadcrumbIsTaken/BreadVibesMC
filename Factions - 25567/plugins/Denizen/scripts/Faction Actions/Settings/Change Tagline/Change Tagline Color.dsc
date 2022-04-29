# Changes the color of the faction's tagline based on which dye they clicked in the inventory.
change_tagline_color_click_event:
    type: world
    debug: false
    events:
        on player clicks in faction_action_settings_tagline_color_change_inventory:
            - if <context.item.material.name> != air:
                - define color <context.item.proc[match_dye_to_color_code]>
                - define faction <player.proc[get_faction]>
                - inventory close
                - run change_faction_setting def.faction:<[faction]> def.setting:settings.tagline_color def.value:<[color]>
                - run change_faction_setting def.faction:<[faction]> def.setting:tagline_display def.value:<[color]><[faction].proc[get_tagline]>
                - narrate "Your faction's tagline color is now: <[color]><[color].proc[match_color_code_to_name]><reset>." format:faction_action_format
