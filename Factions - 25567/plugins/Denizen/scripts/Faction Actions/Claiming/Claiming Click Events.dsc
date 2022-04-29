# Faction Action claiming inventory click events.
faction_action_claiming_click_events:
    type: world
    debug: false
    events:
        on player clicks faction_action_claim_more_land_item in faction_action_default_inventory:
            - run color_claim_map_and_open
        on player clicks location_is_claimable_claim_map_item in claim_map_inventory:
            # TODO: Power/Mana/Whateveritscalled check. The more claims you have the more power you need to claim more land. You can earn more power by doing various things.
            - inventory close
            - define location <context.item.flag[cuboid_location]>
            - run faction.claiming.claim def.1:<[location]> def.2:<player.flag[faction]>
            - narrate "You have successfully claimed the chunk for your faction!" format:faction_action_format
