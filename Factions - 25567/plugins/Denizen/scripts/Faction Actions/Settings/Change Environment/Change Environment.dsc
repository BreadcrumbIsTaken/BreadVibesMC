# Lets the player change the weather inside the chunks claimed by the faction.
change_faction_weather:
    type: task
    debug: false
    script:
        - define choice <server.flag[factions.<player.flag[faction]>.settings.environment.weather]||null>
        - if <[choice]> != null:
            - if <[choice]> == auto:
                - weather player reset
            - else:
                - weather player <[choice]>
        - narrate "Successfully changed weather to: <[choice].to_titlecase>!" format:faction_action_format

# Automatically update environment when a player enters or leaves the claim.
change_faction_environment_events:
    type: world
    debug: false
    events:
        on player enters faction_*_claim_*:
            - define claim <context.area>
            - define faction <[claim].note_name.proc[get_faction_name_from_note_name]>

            - run change_faction_weather
            - run change_faction_time
        on player exits faction_*_claim_*:
            # Reset weather if player enters chunk not claimed by faction.
            - define faction_entering_from <proc[get_faction_name_from_cuboid].context[<context.from.chunk.cuboid>]>
            - define faction_entering_to <context.to.chunk.cuboid.proc[get_faction_name_from_cuboid].if_null[unclaimed_chunk]>
            - if <[faction_entering_to]> == unclaimed_chunk:
                - weather player reset
                - time player reset
            - else if <[faction_entering_from]> == <[faction_entering_to]>:
                - stop

# Change the faction's biome.
change_faction_biome:
    type: task
    debug: false
    script:
        - define choice <server.flag[factions.<player.flag[faction]>.settings.environment.biome.type]||null>
        - if <[choice]> != null:
            - foreach <server.flag[factions.<player.flag[faction]>.claims].values> as:claim:
                - if <[choice]> == auto:
                    - adjust <[claim].blocks> biome:<server.flag[factions.<player.flag[faction]>.settings.environment.biome.original]>
                - else:
                    - adjust <[claim].blocks> biome:<[choice]>
        - adjust <player.location.chunk> refresh_chunk
        - narrate "Successfully changed biome to: <[choice].split[_].space_separated.to_titlecase>!" format:faction_action_format

# Lets the player change the time inside the chunks claimed by the faction.
change_faction_time:
    type: task
    debug: false
    script:
        - define choice <server.flag[factions.<player.flag[faction]>.settings.environment.time]||null>
        - if <[choice]> != null:
            - if <[choice]> == auto:
                - time player reset
                - narrate "Successfully changed time to: Auto!" format:faction_action_format
            - else:
                - time player <[choice].as[duration]> freeze
                - narrate "Successfully changed time to: <[choice]>!" format:faction_action_format

# Sign textbox to let player choose custom time.
set_custom_faction_time_textbox:
    type: task
    debug: false
    script:
        - flag <player> editing_sign_custom_faction_time
        - adjust <player> edit_sign

# Listen for when the player is finished choosing custom sign, and then change the time.
set_custom_faction_time_event:
    type: world
    debug: false
    events:
        after player changes sign flagged:editing_sign_custom_faction_time:
            - define time <context.new.get[1]||null>
            - if <[time]> == null:
                - narrate "Missing time." format:faction_action_error_format
                - flag <player> editing_sign_custom_faction_time:!
                - stop
            - if <[time].ends_with[t]>:
                - flag <player> editing_sign_custom_faction_time:!
                - flag server factions.<player.flag[faction]>.settings.environment.time:<[time]>
                - run change_faction_time
            - else:
                - narrate "Formatting error! Format must be as following: INTEGERt. Example: 13000t" format:faction_action_error_format
