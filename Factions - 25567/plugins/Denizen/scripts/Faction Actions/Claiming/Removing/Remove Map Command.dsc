# You can use the command or the faction action inventory to open the remove claim map.
faction_action_open_remove_claim_map_command:
    type: command
    debug: false
    name: unclaim
    usage: /unclaim
    description: Opens a map of items representing chunks around the player that is claimed by their faction. Lets you visually see what chunks to unclaim from your faction. Works best when facing north, as the chunks are laid out as if the player was facing north.
    aliases:
        - removeclaim
    script:
        - run color_remove_map
