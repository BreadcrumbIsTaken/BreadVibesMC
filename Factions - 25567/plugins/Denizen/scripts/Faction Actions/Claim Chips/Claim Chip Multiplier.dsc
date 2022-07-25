# Calculates how much to multiply the Claim Chips by when claiming new land for a faction.
claim_chip_multiplier:
    type: procedure
    debug: false
    definitions: faction
    script:
        - define claim_amount <[faction].proc[get_claims].size>

        - if <[claim_amount]> <= 2:
            - determine 2
        - else if <[claim_amount]> <= 4:
            - determine 4
        - else if <[claim_amount]> <= 6:
            - determine 6
        - else if <[claim_amount]> <= 8:
            - determine 8
        - else:
            - determine 10
