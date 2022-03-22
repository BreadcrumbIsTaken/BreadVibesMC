enter_claim:
    type: world
    events:
        on player enters faction_*_chunk_claim_*:
            # Regex:
            #  Negative lookahead:
            #   Matches "faction_"
            #   Matches any character "."
            #   Matches previous token between zero and unlimited times as possible "*"
            #  Matches "_chunk"
            #  Matches any character "."
            #  Matches previous token between zero and unlimited times as possible "*"
            # Example:
            #  faction_32_chunk_claim_5
            # will only match:
            #  faction_32
            - define faction <context.area.note_name.proc[get_faction_from_claim_name]>
            - title title:<[faction].proc[get_display_name]> stay:2s targets:<player> subtitle:<gold>Faction
        on player exits faction_*_chunk_claim_*:
            - title "title:<green>- Wilderness -" targets:<player>
