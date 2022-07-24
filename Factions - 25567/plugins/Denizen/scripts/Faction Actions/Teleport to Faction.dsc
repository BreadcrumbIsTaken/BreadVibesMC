# Teleports the player to their faction.
teleport_to_faction_command:
    type: command
    debug: false
    name: ftp
    usage: /ftp
    description: Teleport to your faction!
    script:
        - narrate "Teleporting. . ." format:faction_action_format
        - teleport <player.flag[faction].proc[get_teleport_coords]>
        - playsound <player.location> sound:entity_puffer_fish_blow_up pitch:0.9
        - playeffect at:<player.location> effect:dust_color_transition special_data:1.6|<player.flag[faction].proc[get_color]>|<player.flag[faction].proc[get_tagline_color]> quantity:30
