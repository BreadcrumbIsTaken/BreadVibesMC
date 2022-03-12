change_faction_name:
    type: task
    definitions: faction|name
    script:
        - flag server factions.<[faction]>.name:<[name].get[1]>
        - flag server factions.<[faction]>.display_name:<[faction].proc[get_settings].get[color]><[name].get[1]>
        - run faction_name_change_textbox.finish
        - narrate "Your faction is now named: <[faction].proc[get_display_name]>!" format:faction_action_format

faction_name_change_textbox:
    type: task
    script:
        - flag <player> editing_faction_name_sign
        - adjust <player> edit_sign
    finish:
        - flag <player> editing_faction_name_sign:!

player_editing_name_change_sign:
    type: world
    events:
        after player changes sign flagged:editing_faction_name_sign:
            - if <context.new.get[1].length> < 3:
                - narrate "Your faction's name must have <yellow>3-15<reset> characters!" format:faction_action_error_format
                - stop
            - run change_faction_name def.faction:<player.proc[get_faction]> def.name:<context.new>
