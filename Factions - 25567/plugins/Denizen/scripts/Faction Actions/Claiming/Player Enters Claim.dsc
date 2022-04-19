# Display faction name and tagline when they enter the faction, and display the wilderness warning when they leave.
# If the player is in their faction's claimed chunk and is walking into another claimed chunk also owned by them, it will not reshow the particles and title text.
enter_claim:
    type: world
    debug: false
    events:
        on player enters faction_*_claim_number_*:
            - define claim <context.area>
            - define faction <[claim].note_name.proc[get_faction_name_from_note_name]>
            - define entering_from <proc[get_faction_name_from_cuboid].context[<context.from.chunk.cuboid>]>
            - if <[faction]> == <[entering_from]>:
                - stop

            - title title:<[faction].proc[get_display_name]> stay:2s targets:<player> subtitle:<[faction].proc[get_tagline_display]>
            - repeat 2:
                - playeffect at:<[claim].outline_2d[<player.location.y.add[<[value]>]>]> effect:redstone visibility:20 targets:<player> special_data:1|<[faction].proc[get_settings].get[color]>
        on player exits faction_*_claim_number_*:
            - define faction_entering_from <proc[get_faction_name_from_cuboid].context[<context.from.chunk.cuboid>]>
            - define faction_entering_to <context.to.chunk.cuboid.proc[get_faction_name_from_cuboid].if_null[unclaimed_chunk]>
            - if <[faction_entering_to]> == unclaimed_chunk:
                - title "title:<green>- Wilderness -" targets:<player>
            - else if <[faction_entering_from]> == <[faction_entering_to]>:
                - stop
