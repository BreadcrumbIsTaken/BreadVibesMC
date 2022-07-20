# Show the unclaimable chunks.
color_remove_map:
    type: task
    debug: false
    script:
        - define inventory <inventory[remove_claim_map]>

        - define cuboids <list[]>

        - repeat 5 as:y from:-2:
            # Columns 1-5
            - repeat 5 as:x from:-4:
                - define cuboids:->:<player.location.chunk.add[<[x]>,<[y]>].cuboid>
            # Columns 6-9
            - repeat 4 as:x from:1:
                - define cuboids:->:<player.location.chunk.add[<[x]>,<[y]>].cuboid>

        - define claim_slots <map[]>
        - foreach <player.flag[faction].proc[get_claims]> as:claim:
            - foreach <[cuboids]> as:cuboid:
                - if <[claim]> == <[cuboid]>:
                    - define data <map[<[loop_index]>=<[cuboid]>]>
                    - define claim_slots:<[claim_slots].include[<[data]>]>
                - else:
                    - inventory set d:<[inventory]> slot:<[loop_index]> o:<item[chunk_cannot_be_unclaimed_item]>

        - foreach <[claim_slots]> key:slot as:loc:
            - inventory set d:<[inventory]> slot:<[slot]> o:<item[chunk_can_be_unclaimed_item].with_flag[cuboid_location:<[loc]>]>

        - inventory set d:<[inventory]> slot:23 o:<item[player_location_claim_map_item]>

        - inventory set d:<[inventory]> slot:5 o:<item[north_indicator_item]>
        - inventory adjust d:<[inventory]> slot:5 "lore:<white>You are currently facing <yellow><player.location.direction>."
        - inventory set d:<[inventory]> slot:27 o:<item[east_indicator_item]>
        - inventory adjust d:<[inventory]> slot:27 "lore:<white>You are currently facing <yellow><player.location.direction>."
        - inventory set d:<[inventory]> slot:41 o:<item[south_indicator_item]>
        - inventory adjust d:<[inventory]> slot:41 "lore:<white>You are currently facing <yellow><player.location.direction>."
        - inventory set d:<[inventory]> slot:19 o:<item[west_indicator_item]>
        - inventory adjust d:<[inventory]> slot:19 "lore:<white>You are currently facing <yellow><player.location.direction>."

        - inventory open d:<[inventory]>
