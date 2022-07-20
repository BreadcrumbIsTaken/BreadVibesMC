# The main Faction Action Danger Zone Inventory.
faction_action_danger_zone_inventory:
    type: inventory
    debug: false
    inventory: chest
    gui: true
    title: <&color[#1569EA]>Faction Actions <reset>(<red>Danger Zone<reset>)
    procedural items:
        - determine <item[filler].repeat_as_list[54]>
    slots:
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [faction_action_danger_zone_transfer_ownership_item] [] [faction_action_danger_zone_leave_faction_item] [] [faction_action_danger_zone_delete_faction_item] [] [faction_action_danger_zone_remove_claim_from_faction_item] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [previous_page_item] [] [] [] [] [] [] [] []

# The deletion confirmation inventory.
faction_action_danger_zone_delete_confirmation_inventory:
    type: inventory
    debug: false
    inventory: chest
    gui: true
    title: <red>Are you sure?
    procedural items:
        - determine <item[filler].repeat_as_list[54]>
    slots:
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [faction_action_danger_zone_faction_deletion_confirmation_item] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [previous_page_item] [] [] [] [] [] [] [] []

# The leave confirmation inventory.
faction_action_danger_zone_player_leave_confirm_inventory:
    type: inventory
    debug: false
    inventory: chest
    gui: true
    title: <red>Are you sure?
    procedural items:
        - determine <item[filler].repeat_as_list[54]>
    slots:
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [faction_action_danger_zone_leave_faction_confirmation_item] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [previous_page_item] [] [] [] [] [] [] [] []
