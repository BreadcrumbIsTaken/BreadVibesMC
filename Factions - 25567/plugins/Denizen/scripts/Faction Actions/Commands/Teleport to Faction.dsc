# Teleports the player to their faction.
teleport_to_faction_command:
    type: command
    debug: false
    name: ftp
    usage: /ftp (faction)
    tab completions:
        1: <server.flag[faction_names].keys>
    description: Teleport to a faction! If none is provided then it will teleport you to your own faction.
    script:
        - define faction <context.args.get[1]||null>
        - if <[faction]> == null:
            - narrate "Teleporting to your faction. . ." format:faction_action_format
            - teleport <player.flag[faction].proc[get_teleport_coords]>
            - playsound <player.location> sound:entity_puffer_fish_blow_up pitch:0.9
            - playeffect at:<player.location> effect:dust_color_transition special_data:1.6|<player.flag[faction].proc[get_color]>|<player.flag[faction].proc[get_tagline_color]> quantity:30
        - else:
            - narrate "Teleporting to <[faction]>. . ." format:faction_action_format
            - define f <server.flag[faction_names].get[<[faction]>]>
            - teleport <[f].proc[get_teleport_coords]>
            - playsound <player.location> sound:entity_puffer_fish_blow_up pitch:0.9
            - playeffect at:<player.location> effect:dust_color_transition special_data:1.6|<[f].proc[get_color]>|<[f].proc[get_tagline_color]> quantity:30
