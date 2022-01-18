# Faction Command
# Written by Breadcrumb
# Description:
#   Opens the Faction Action inventory.
faction_command:
    type: command
    name: faction
    usage: /faction
    aliases:
        - f
    description: Use this command to do things with a faction!
    script:
        - if !<player.has_flag[FACTION]>:
            - inventory open d:faction_action_player_not_in_any_faction_inventory
        - else:
            - if <player.uuid> == <player.flag[faction].proc[get_owner]>:
                - define inv <inventory[faction_action_default_inventory]>
                - inventory d:<[inv]> adjust slot:14 "display_name:<player.name>'s Faction"
                - inventory open d:<[inv]>
            - else:
                - narrate "<yellow>You aren't the owner of the faction!"