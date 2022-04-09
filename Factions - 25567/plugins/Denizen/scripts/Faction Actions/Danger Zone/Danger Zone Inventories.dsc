faction_action_danger_zone_inventory:
    type: inventory
    inventory: chest
    gui: true
    title: <&color[#1569EA]>Faction Actions <reset>(<red>Danger Zone<reset>)
    debug: false
    procedural items:
        - determine <item[filler].repeat_as_list[54]>
    slots:
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [faction_action_danger_zone_transfer_ownership_item] [] [faction_action_danger_zone_leave_faction_item] [] [faction_action_danger_zone_delete_faction_item] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [previous_page_item] [] [] [] [] [] [] [] []

faction_action_danger_zone_delete_confirmation_inventory:
    type: inventory
    inventory: chest
    gui: true
    title: <red>Are you sure?
    debug: false
    procedural items:
        - determine <item[filler].repeat_as_list[54]>
    slots:
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [faction_action_danger_zone_faction_deletion_confirmation_item] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [previous_page_item] [] [] [] [] [] [] [] []

faction_action_danger_zone_player_leave_confirm_inventory:
    type: inventory
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
