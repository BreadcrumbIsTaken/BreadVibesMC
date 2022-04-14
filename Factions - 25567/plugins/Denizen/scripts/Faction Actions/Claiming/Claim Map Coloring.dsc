# Color the claim map then open it.
color_claim_map_and_open:
    type: task
    debug: false
    script:
        - define inv <inventory[claim_map_inventory]>

        # Diagram of claim map reach where "1" represents x1, y1, and z1 coords; "2" represents x2, y2, and z2 coords; and "x" represents the player's location
        #|                    N
        #|   [1] [ ] [ ] [ ] [ ] [ ] [ ] [ ] [ ]
        #|   [ ] [ ] [ ] [ ] [ ] [ ] [ ] [ ] [ ]
        #| W [ ] [ ] [ ] [ ] [x] [ ] [ ] [ ] [ ] E
        #|   [ ] [ ] [ ] [ ] [ ] [ ] [ ] [ ] [ ]
        #|   [ ] [ ] [ ] [ ] [ ] [ ] [ ] [ ] [2]
        #|                    S
        - define cuboids <list[]>

        # Row 1
        # Columns 1-5
        - repeat 5 as:x from:-4:
            - define cuboids:->:<player.location.chunk.add[<[x]>,-2].cuboid>
        # Row 1
        # Columns 6-9
        - repeat 4 as:x from:1:
            - define cuboids:->:<player.location.chunk.add[<[x]>,-2].cuboid>
        # Row 2
        # Columns 1-5
        - repeat 5 as:x from:-4:
            - define cuboids:->:<player.location.chunk.add[<[x]>,-1].cuboid>
        # Row 2
        # Columns 6-9
        - repeat 4 as:x from:1:
            - define cuboids:->:<player.location.chunk.add[<[x]>,-1].cuboid>
        # Row 3
        # Columns 1-5
        - repeat 5 as:x from:-4:
            - define cuboids:->:<player.location.chunk.add[<[x]>,0].cuboid>
        # Row 3
        # Columns 6-9
        - repeat 4 as:x from:1:
            - define cuboids:->:<player.location.chunk.add[<[x]>,0].cuboid>
        # Row 4
        # Columns 1-5
        - repeat 5 as:x from:-4:
            - define cuboids:->:<player.location.chunk.add[<[x]>,1].cuboid>
        # Row 4
        # Columns 6-9
        - repeat 4 as:x from:1:
            - define cuboids:->:<player.location.chunk.add[<[x]>,1].cuboid>
        # Row 5
        # Columns 1-5
        - repeat 5 as:x from:-4:
            - define cuboids:->:<player.location.chunk.add[<[x]>,2].cuboid>
        # Row 5
        # Columns 6-9
        - repeat 4 as:x from:1:
            - define cuboids:->:<player.location.chunk.add[<[x]>,2].cuboid>

        - foreach <[cuboids]> as:cuboid:
            - if <[cuboid].proc[is_claimable]>:
                - inventory set d:<[inv]> slot:<[loop_index]> o:<item[location_is_claimable_claim_map_item]>
                - inventory adjust d:<[inv]> slot:<[loop_index]> "lore:<white>Left click to claim!"
            - else:
                - inventory set d:<[inv]> slot:<[loop_index]> o:<item[location_is_not_claimable_claim_map_item]>
                - inventory adjust d:<[inv]> slot:<[loop_index]> "lore:<red>Unclaimable!|<white>Aready claimed by <[cuboid].proc[get_faction_name_from_claim_note_name].proc[get_display_name]>."

        # x
        - inventory set d:<[inv]> slot:23 o:<item[player_location_claim_map_item]>
        - inventory adjust d:<[inv]> slot:23 lore:<white><player.location.simple>

        - inventory set d:<[inv]> slot:5 o:<item[north_indicator_item]>
        - inventory adjust d:<[inv]> slot:5 "lore:<white>You are currently facing <yellow><player.location.direction>."
        - inventory set d:<[inv]> slot:27 o:<item[east_indicator_item]>
        - inventory adjust d:<[inv]> slot:27 "lore:<white>You are currently facing <yellow><player.location.direction>."
        - inventory set d:<[inv]> slot:41 o:<item[south_indicator_item]>
        - inventory adjust d:<[inv]> slot:41 "lore:<white>You are currently facing <yellow><player.location.direction>."
        - inventory set d:<[inv]> slot:19 o:<item[west_indicator_item]>
        - inventory adjust d:<[inv]> slot:19 "lore:<white>You are currently facing <yellow><player.location.direction>."

        - inventory open d:<[inv]>
