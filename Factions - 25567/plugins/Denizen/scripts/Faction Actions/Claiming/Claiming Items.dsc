# The item that shows the location of the player.
player_location_claim_map_item:
    type: item
    material: yellow_stained_glass_pane
    display name: <yellow>You are here!
    lore:
        - <white>LOCATION

# The item that shows that a chunk is unclaimed.
location_is_claimable_claim_map_item:
    type: item
    material: lime_stained_glass_pane
    display name: <yellow>Unclaimed land.
    lore:
        - <white>LOCATION

# The item that shows that a chunk is claimed.
location_is_not_claimable_claim_map_item:
    type: item
    material: red_stained_glass_pane
    display name: <yellow>Claimed land.
    lore:
        - <white>CLAIMED_BY
        - <white>LOCATION
