# The task that changes the faction's name.
change_faction_name:
    type: task
    debug: false
    definitions: faction|name
    script:
        - run change_faction_setting def.faction:<[faction]> def.setting:name def.value:<[name].get[1]>
        - run change_faction_setting def.faction:<[faction]> def.setting:display_name def.value:<[faction].proc[get_settings].get[color]><[name].get[1]>

        - run faction_name_change_textbox.finish
        - narrate "Your faction is now named: <[faction].proc[get_display_name]>!" format:faction_action_format

# The textbox (sign) that appears for the player to enter in their faction's name.
faction_name_change_textbox:
    type: task
    debug: false
    script:
        - flag <player> editing_faction_name_sign
        - adjust <player> edit_sign
    finish:
        - flag <player> editing_faction_name_sign:!

# Event that fires when the player has edided the sign, finalizing the new name of the faction.
player_editing_name_change_sign:
    type: world
    debug: false
    events:
        after player changes sign flagged:editing_faction_name_sign:
            - if <context.new.get[1].length> < 3:
                - narrate "Your faction's name must have <yellow>3-15<reset> characters!" format:faction_action_error_format
                - stop
            - run change_faction_name def.faction:<player.proc[get_faction]> def.name:<context.new>
