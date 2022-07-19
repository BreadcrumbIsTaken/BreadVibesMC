# The item that shows the location of the player.
player_location_claim_map_item:
    type: item
    material: yellow_stained_glass_pane
    display name: <yellow>You are here!
    lore:
        - <white>Left click on an avaliable chunk
        - <white>on the map to claim the chunk
        - <white>for your faction.

# The item that shows that a chunk is unclaimed.
location_is_claimable_claim_map_item:
    type: item
    material: lime_stained_glass_pane
    display name: <yellow>Unclaimed land.
    lore:
        - LOCATION

# The item that shows that a chunk is claimed.
location_is_not_claimable_claim_map_item:
    type: item
    material: red_stained_glass_pane
    display name: <yellow>Claimed land.
    lore:
        - CLAIMED_BY
        - LOCATION

# Shows where north is on the claim map.
north_indicator_item:
    type: item
    material: compass
    display name: <yellow>North
    lore:
        - FACING

# Shows where east is on the claim map.
east_indicator_item:
    type: item
    material: compass
    display name: <yellow>East
    lore:
        - FACING

# Shows where south is on the claim map.
south_indicator_item:
    type: item
    material: compass
    display name: <yellow>South
    lore:
        - FACING

# Shows where west is on the claim map.
west_indicator_item:
    type: item
    material: compass
    display name: <yellow>West
    lore:
        - FACING
