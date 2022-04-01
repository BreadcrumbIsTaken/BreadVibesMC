enter_claim:
    type: world
    events:
        on player enters faction_*_chunk_claim_*:
            - define faction <context.area.note_name.proc[get_faction_from_claim_name]>
            - title title:<[faction].proc[get_display_name]> stay:2s targets:<player> subtitle:<[faction].proc[get_tagline_display]>
        on player exits faction_*_chunk_claim_*:
            - title "title:<green>- Wilderness -" targets:<player>
