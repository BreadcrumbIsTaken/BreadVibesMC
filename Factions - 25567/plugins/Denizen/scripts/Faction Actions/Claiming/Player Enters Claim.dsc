# Display faction name and tagline when they enter the faction, and display the wilderness warning when they leave.
# If the player is in their faction's claimed chunk and is walking into another claimed chunk also owned by them, it will not reshow the particles and title text.
enter_claim:
    type: world
    debug: false
    events:
        after player enters faction_*_claim_*:
            - define claim <context.area>
            - define faction <[claim].note_name.proc[get_faction_name_from_note_name]>
            - define entering_from <context.from.chunk.cuboid>
            - define entering_from_faction <[entering_from].proc[get_faction_name_from_cuboid]||null>

            - if <player.flag[is_in_wilderness]||false> || <[entering_from_faction]> != <player.flag[faction]> || <[faction]> != <player.flag[faction]>:
                - inject display_claim_enter_text
            - else:
                - stop
        after player exits faction_*_claim_*:
            - define faction_entering_from <proc[get_faction_name_from_cuboid].context[<context.from.chunk.cuboid>]||null>
            # Player teleports into faction but is blocked by permissions
            - if <[faction_entering_from]> == null:
                - stop
            - define faction_entering_to <context.to.chunk.cuboid.proc[get_faction_name_from_cuboid].if_null[unclaimed_chunk]>
            - if <[faction_entering_to]> == unclaimed_chunk:
                - title "title:<green>- Wilderness -" targets:<player> fade_in:.5s fade_out:.5s stay:1s
                - flag <player> is_in_wilderness
            - else if <[faction_entering_from]> == <[faction_entering_to]>:
                - stop

# Display the text on screen that the player has entered a new faction.
display_claim_enter_text:
    type: task
    debug: false
    definitions: faction|claim
    script:
        - flag <player> is_in_wilderness:!
        - title title:<[faction].proc[get_display_name]> stay:2s targets:<player> subtitle:<[faction].proc[get_tagline_display]> fade_in:.5s fade_out:.5s stay:1s
        - repeat 2:
            - playeffect at:<[claim].outline_2d[<player.location.y.add[<[value]>]>]> effect:dust_color_transition visibility:20 targets:<player> special_data:1.4|<[faction].proc[get_settings].get[color]>|<[faction].proc[get_settings].get[tagline_color]>
