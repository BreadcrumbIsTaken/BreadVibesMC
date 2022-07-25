# Faction Action claiming inventory click events.
faction_action_claiming_click_events:
    type: world
    # debug: false
    events:
        on player clicks faction_action_claim_more_land_item in faction_action_default_inventory:
            - run color_claim_map_and_open
        on player clicks location_is_claimable_claim_map_item in claim_map_inventory:
            - inventory close
            - if <player.has_flag[faction]>:
                - define chip_multiplier <proc[claim_chip_multiplier].context[<player.flag[faction]>]>

                - define chips_needed <player.flag[faction].proc[get_claims].size.mul[<[chip_multiplier]>]>

                - if <player.flag[faction].proc[get_claim_chips]> >= <[chips_needed]>:
                    - define location <context.item.flag[cuboid_location]>
                    - run faction.claiming.claim def.1:<[location]> def.2:<player.flag[faction]>
                    - narrate "You have successfully claimed the chunk for your faction!" format:faction_action_format
                    - flag server factions.<player.flag[faction]>.claim_chips:-:<[chips_needed]>
                - else:
                    - narrate "Your faction does not have enough <yellow>Claim Chips<reset> to claim this chunk!" format:faction_action_error_format
            - else:
                - narrate "You cannot claim land as you are not in a faction! Concider creating or joining one." format:faction_action_error_format
        on player clicks chunk_can_be_unclaimed_item in remove_claim_map:
            - if <player.flag[faction].proc[get_claims].size> == 1:
                - inventory open d:faction_action_claiming_remove_claim_last_claim_warning_inventory
            - else:
                - flag <player> removing_chunk_claim:<context.item.flag[cuboid_location]>
                - inventory open d:faction_action_claiming_remove_claim_confirmation_inventory

        # Remove a claim.
        on player clicks claim_removal_confirmation_item in faction_action_claiming_remove_claim_confirmation_inventory:
            - inventory close
            - run faction.claiming.unclaim def.1:<player.flag[faction]> def.2:<player.flag[removing_chunk_claim]>
            - flag <player> removing_chunk_claim:!
            - narrate "Successfully removed claim!" format:faction_action_format
        # Delete a faction if player is removing last claim.
        on player clicks claim_removal_last_claim_warning_item in faction_action_claiming_remove_claim_last_claim_warning_inventory:
            - inventory close
            - run faction.delete
