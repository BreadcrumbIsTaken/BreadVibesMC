# Opens the faction action inventory.
open_faction_action_inventory:
    type: task
    debug: false
    script:
        - define inv <inventory[faction_action_default_inventory]>
        - inventory d:<[inv]> adjust slot:14 display_name:<player.flag[faction].proc[get_display_name]>
        - inventory d:<[inv]> adjust slot:14 "lore:<list[<player.flag[faction].proc[get_tagline_display]>|<yellow>---|<white>Members: <yellow><player.flag[faction].proc[get_members].size>|<white>Claims: <yellow><player.flag[faction].proc[get_claims].size>|<white>Claim Chips: <player.flag[faction].proc[get_claim_chips].proc[cc_display]>]>"
        - inventory open d:<[inv]>

# Opens the faction action member inventory. (The one that shows up if the player is not the owner of the faction)
open_faction_action_member_inventory:
    type: task
    debug: false
    script:
        - define inv <inventory[faction_action_player_not_owner_inventory]>
        - inventory d:<[inv]> adjust slot:14 display_name:<player.flag[faction].proc[get_display_name]>
        - inventory d:<[inv]> adjust slot:14 "lore:<list[<player.flag[faction].proc[get_tagline_display]>|<yellow>---|<white>Members: <yellow><player.flag[faction].proc[get_members].size>|<white>Claims: <yellow><player.flag[faction].proc[get_claims].size>|<white>Claim Chips: <player.flag[faction].proc[get_claim_chips].proc[cc_display]>]>"
        - inventory open d:<[inv]>
