change_faction_color_click_event:
    type: world
    events:
        on player clicks in faction_action_settings_color_change_inventory:
            - if <context.item.material.name> != air:
                - define color <context.item.proc[match_dye_to_color_code]>
                - define faction <player.proc[get_faction]>
                - inventory close
                - run change_faction_setting def.faction:<[faction]> def.setting:settings.color def.value:<[color]>
                - run change_faction_setting def.faction:<[faction]> def.setting:display_name def.value:<[color]><[faction].proc[get_display_name]>
                - narrate "Your faction's color is now: <[color]><[color].proc[match_color_code_to_name]><reset>." format:faction_action_format
                - narrate "<player.proc[get_faction].proc[get_settings].get[color]>Wow test"
