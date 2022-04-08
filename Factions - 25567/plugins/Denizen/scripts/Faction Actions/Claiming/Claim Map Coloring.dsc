color_claim_map_and_open:
    type: task
    script:
        - define inv <inventory[claim_map_inventory]>

        - define player_location_item_slot 23

        - inventory adjust d:<[inv]> slot:<[player_location_item_slot]> lore:<player.location.chunk.cuboid>
        - inventory open d:<[inv]>
