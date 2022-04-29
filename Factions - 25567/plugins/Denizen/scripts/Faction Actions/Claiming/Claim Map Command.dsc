# Command to open the claim_map_inventory
claim_map_command:
    type: command
    debug: false
    name: claimmap
    usage: /claimmap
    description: Opens a map of all the avaliable claims around you. Note<&co> the map assumes that you are facing North. It gives you the cardinal directions on the compases and which direction you are facing as well.
    aliases:
        - openclaimmap
        - claimingmap
        - openclaimingmap
    script:
        - run color_claim_map_and_open
