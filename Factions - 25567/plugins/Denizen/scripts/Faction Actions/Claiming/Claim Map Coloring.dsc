color_claim_map_and_open:
    type: task
    definitions: inventory
    script:
        - define inv <inventory[<[inventory]>]>
        
        # TODO: coloring logic
        
        - inventory open d:<[inv]>