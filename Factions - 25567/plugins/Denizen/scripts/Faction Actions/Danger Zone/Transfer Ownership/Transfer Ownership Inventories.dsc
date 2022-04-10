# TODO: Add pagination support.
# List of all the players that you can transfer ownership to.
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
        - [previous_page_item] [air] [air] [air] [air] [air] [air] [air] [air]
