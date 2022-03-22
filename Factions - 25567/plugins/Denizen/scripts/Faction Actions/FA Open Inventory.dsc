open_faction_action_inventory:
    type: task
    script:
        - define inv <inventory[faction_action_default_inventory]>
        - inventory d:<[inv]> adjust slot:14 display_name:<player.flag[faction].proc[get_display_name]>
        - inventory d:<[inv]> adjust slot:14 lore:<player.proc[get_faction].proc[get_tagline]>
        - inventory open d:<[inv]>

open_faction_action_member_inventory:
    type: task
    script:
        - define inv <inventory[faction_action_player_not_owner_inventory]>
        - inventory d:<[inv]> adjust slot:14 display_name:<player.flag[faction].proc[get_display_name]>
        - inventory d:<[inv]> adjust slot:14 lore:<player.proc[get_faction].proc[get_tagline]>
        - inventory open d:<[inv]>
