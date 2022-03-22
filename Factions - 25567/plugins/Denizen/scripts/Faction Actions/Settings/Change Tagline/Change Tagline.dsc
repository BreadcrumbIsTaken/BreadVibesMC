change_faction_tagline:
    type: task
    definitions: faction|tagline
    script:
        - run change_faction_setting def.faction:<[faction]> def.setting:tagline def.value:<[tagline].get[1]>
        - run change_faction_setting def.faction:<[faction]> def.setting:tagline_display def.value:<[faction].proc[get_tagline_color]><[tagline].get[1]>
        - run faction_tagline_change_textbox.finish
        - narrate "Your faction's tagline is now: <[faction].proc[get_tagline_display]><reset>!" format:faction_action_format

faction_tagline_change_textbox:
    type: task
    script:
        - flag <player> editing_faction_tagline_sign
        - adjust <player> edit_sign
    finish:
        - flag <player> editing_faction_tagline_sign:!

player_edits_tagline_change_sign:
    type: world
    events:
        after player changes sign flagged:editing_faction_tagline_sign:
            - if <context.new.get[1].length> < 3:
                - narrate "Your faction's tagline must have <yellow>3-15<reset> characters!" format:faction_action_error_format
                - stop
            - run change_faction_tagline def.faction:<player.proc[get_faction]> def.tagline:<context.new>
