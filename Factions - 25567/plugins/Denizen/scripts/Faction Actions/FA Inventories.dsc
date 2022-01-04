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
    title: <red>Deletion Confirmation
    debug: false
    slots:
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [faction_danger_zone_faction_deletion_confirmation_item] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []

list_factions_command_list_inventory:
    type: inventory
    inventory: chest
    gui: true
    title: List of All Factions
    procedural items:
        - define list <list[]>
        - if <proc[get_factions]> != null:
            - foreach <proc[get_factions].keys> as:f:
                - if <[f].proc[get_allies].is_empty>:
                    - define allies "No allies <element[<&ns>crying.].hex_rainbow>"
                - else:
                    - define allies <[f].proc[get_allies].separated_by[,]>
                - if <[f].proc[get_rivalries].is_empty>:
                    - define rivals "No rivals! :)"
                - else:
                    - define rivals <[f].proc[get_rivalries].separated_by[,]>
                - define lore "<list[<yellow>Owner: <player[<[f].proc[get_owner]>].name>|<yellow>Power: <[f].proc[get_power]>|<yellow>Allies: <[allies]>|<yellow>Rivals: <[rivals]>|<blue>Click to send a join request!]>"
                - define skull_skin <[f].proc[get_owner]>
                - define display <[f].proc[get_display_name]>

                - define item <item[player_head[display=<[display]>;lore=<[lore]>;skull_skin=<[skull_skin]>]]>
                - define list:->:<[item]>
        - else:
            - define list:->:<item[air]>
        - determine <[list]>
    slots:
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [previous_page_item] [air] [air] [air] [air] [air] [air] [air] [next_page_item]