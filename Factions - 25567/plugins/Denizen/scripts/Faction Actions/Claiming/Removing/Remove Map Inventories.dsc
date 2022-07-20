# A map of the chunks around the player and what chunks are claimed. Similar to the claim map.
remove_claim_map:
    type: inventory
    debug: false
    inventory: chest
    gui: true
    title: <red>Remove Claim
    slots:
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []

# An inventory to make sure the player wants to remove the claim.
faction_action_claiming_remove_claim_confirmation_inventory:
    type: inventory
    debug: false
    inventory: chest
    gui: true
    title: <red>Claim Removal Confirmation
    procedural items:
        - determine <item[filler].repeat_as_list[45]>
    slots:
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [claim_removal_confirmation_item] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []

# An inventory to make sure the player wants to remove the claim.
faction_action_claiming_remove_claim_last_claim_warning_inventory:
    type: inventory
    debug: false
    inventory: chest
    gui: true
    title: <red>HEY!
    procedural items:
        - determine <item[filler].repeat_as_list[45]>
    slots:
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [claim_removal_last_claim_warning_item] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
