# Item to represent that a chunk can be unclaimed.
chunk_can_be_unclaimed_item:
    type: item
    display name: <green>Unclaimable
    material: purple_stained_glass_pane
    lore:
        - <yellow>Left click to unclaim this chunk.

# Item to represent that a chunk cannot be unclaimed.
chunk_cannot_be_unclaimed_item:
    type: item
    display name: <yellow>Not Unclaimable
    material: gray_stained_glass_pane
    lore:
        - <white>This chunk is
        - <white>not claimed by your
        - <white>faction.

# Item to confirm removal of claim
claim_removal_confirmation_item:
    type: item
    material: player_head
    display name: <red>Yes, I want to remove this claim.
    lore:
        - <white>You can always
        - <white>reclaim this chunk
        - <white>as long as it is
        - <white>still avaliable.
    mechanisms:
        skull_skin: b4e096c1-65b2-4abd-bedc-e67842bb42b1|eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvY2UyYTUzMGY0MjcyNmZhN2EzMWVmYWI4ZTQzZGFkZWUxODg5MzdjZjgyNGFmODhlYThlNGM5M2E0OWM1NzI5NCJ9fX0=

# Item to warn the player that they are removing their faction's last claim.
claim_removal_last_claim_warning_item:
    type: item
    material: player_head
    display name: <red>This is the last claim in your faction!!
    lore:
        - <red>Removing this claim
        - <red>will delete your faction.
        - <red>Left click to continue.
    mechanisms:
        skull_skin: b4e096c1-65b2-4abd-bedc-e67842bb42b1|eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvY2UyYTUzMGY0MjcyNmZhN2EzMWVmYWI4ZTQzZGFkZWUxODg5MzdjZjgyNGFmODhlYThlNGM5M2E0OWM1NzI5NCJ9fX0=
