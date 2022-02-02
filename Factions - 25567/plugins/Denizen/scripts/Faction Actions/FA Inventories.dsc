faction_action_default_inventory:
    type: inventory
    inventory: chest
    gui: true
    title: <&color[#1569EA]>Faction Actions
    debug: false
    slots:
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [faction_inventory_item] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [faction_invite_players_item] [] [faction_claim_more_land_item] [] [faction_settings_item] [] []
        - [faction_danger_zone_item] [] [] [] [] [] [] [] []

faction_action_player_not_in_any_faction_inventory:
    type: inventory
    inventory: chest
    gui: true
    title: <&color[#1569EA]>Faction Actions
    debug: false
    slots:
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [not_in_any_faction_item] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [create_new_faction_item] [] [] [] [join_new_faction_item] [] []
        - [] [] [] [] [] [] [] [] []

faction_action_danger_zone_inventory:
    type: inventory
    inventory: chest
    gui: true
    title: <&color[#1569EA]>Faction Actions <reset>(<red>Danger Zone<reset>)
    debug: false
    slots:
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [faction_danger_zone_transfer_ownership_item] [] [] [] [faction_danger_zone_delete_faction_item] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [previous_page_item] [] [] [] [] [] [] [] []

faction_action_danger_zone_delete_confirmation_inventory:
    type: inventory
    inventory: chest
    gui: true
    title: <red>Are you sure?
    debug: false
    slots:
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [faction_danger_zone_faction_deletion_confirmation_item] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []

faction_action_danger_zone_transfer_ownership_player_list_inventory:
    type: inventory
    inventory: chest
    gui: true
    title: Pick a new owner.
    debug: false
    procedural items:
        - define players <server.online_players>
        - define head_list <list[]>
        - foreach <[players]> as:p:
            - define lore "<list[<blue>Pick <[p].name> to be|<blue>the new owner.]>"
            - define player_head_item <item[player_head[skull_skin=<[p].uuid>;display_name=<[p].name>;lore=<[lore]>]].with_flag[player_id:<[p]>]>
            - define head_list:->:<[player_head_item]>
        - determine <[head_list]>
    slots:
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []

faction_action_player_not_owner_inventory:
    type: inventory
    inventory: chest
    gui: true
    title: <&color[#1569EA]>Faction Actions
    slots:
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [faction_inventory_item] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []