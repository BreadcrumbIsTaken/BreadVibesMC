enter_claim:
    type: world
    debug: false
    events:
        on player enters faction_*_claim_number_*:
            - define claim <context.area>
            - define faction <[claim].note_name.proc[get_faction_from_claim_name]>
            - title title:<[faction].proc[get_display_name]> stay:2s targets:<player> subtitle:<[faction].proc[get_tagline_display]>
            - playeffect at:<[claim].shell.parse[center]> effect:redstone visibility:20 targets:<player> special_data:1|<[faction].proc[get_settings].get[color]>
        on player exits faction_*_claim_number_*:
            - title "title:<green>- Wilderness -" targets:<player>
