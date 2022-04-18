# Faction Action claiming inventory click events.
faction_action_claiming_click_events:
    type: world
    events:
        on player clicks faction_action_claim_more_land_item in faction_action_default_inventory:
            - run color_claim_map_and_open
        # TODO: Actual land claiming.

        ## Testing
        # on player clicks location_is_* in claim_map_inventory:
        #     - teleport <context.item.lore.get[1]>
