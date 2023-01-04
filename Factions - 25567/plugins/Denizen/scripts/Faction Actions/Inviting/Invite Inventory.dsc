invite_other_players_to_faction_inventory:
    type: inventory
    inventory: chest
    gui: true
    title: Invite Players
    debug: false
    procedural items:
        - define players <server.online_players>
        - define head_list <list[]>
        - foreach <[players]> as:p:
            - if <[p]> != <player>:
                - define lore "<list[<blue>Left click to invite|<white><[p].name><blue> to your faction.]>"
                - define player_head_item <item[player_head[skull_skin=<[p].uuid>;display=<[p].name>;lore=<[lore]>]].with_flag[to_invite:<[p]>]>
                - define head_list:->:<[player_head_item]>
        - determine <[head_list]>
    slots:
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [back_page_item] [filler] [filler] [filler] [filler] [filler] [filler] [filler] [filler]
