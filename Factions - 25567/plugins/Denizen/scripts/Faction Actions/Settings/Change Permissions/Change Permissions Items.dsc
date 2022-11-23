# Item to apply permission changes
apply_permission_changes:
    type: item
    material: slime_ball
    display name: <dark_green>Apply Changes
    debug: false

# Item to cancel permission changes
cancel_permission_changes:
    type: item
    material: spectral_arrow
    display name: <red>Cancel
    debug: false

# Item to edit permissions for Owners
owner_permission_item:
    type: item
    material: pink_wool
    display name: <dark_aqua>Owners
    debug: false
    lore:
        - <white>Click to edit this permission
        - <white>for owners.
        - <yellow>Current Status<&co>

# Item to edit permissions for Members
member_permission_item:
    type: item
    material: light_blue_wool
    display name: <dark_aqua>Members
    debug: false
    lore:
        - <white>Click to edit this permission
        - <white>for members.
        - <yellow>Current Status<&co>

# Item to edit permissions for Outsiders
outsider_permission_item:
    type: item
    material: yellow_wool
    display name: <dark_aqua>Outsiders
    debug: false
    lore:
        - <white>Click to edit this permission
        - <white>for outsiders.
        - <yellow>Current Status<&co>

# Assign all permissions to Owners
assign_all_to_owners:
    type: item
    material: pink_wool
    display name: <yellow><underline>Assign All to <dark_aqua><underline>Owners
    debug: false
    lore:
        - <aqua>Description<white><&co>
        -     <white>Click to assign all the above
        -     <white>permissions to <dark_aqua>Owners

# Assign all permissions to Members
assign_all_to_members:
    type: item
    material: light_blue_wool
    display name: <yellow><underline>Assign All to <dark_aqua><underline>Members
    debug: false
    lore:
        - <aqua>Description<white><&co>
        -     <white>Click to assign all the above
        -     <white>permissions to <dark_aqua>Members

# Assign all permissions to Outsiders
assign_all_to_outsiders:
    type: item
    material: yellow_wool
    display name: <yellow><underline>Assign All to <dark_aqua><underline>Outsiders
    debug: false
    lore:
        - <aqua>Description<white><&co>
        -     <white>Click to assign all the above
        -     <white>permissions to <dark_aqua>Outsiders

# Unassign all permissions to Owners
unassign_all_to_owners:
    type: item
    material: pink_wool
    display name: <red><underline>Un<yellow><underline>assign All to <dark_aqua><underline>Owners
    debug: false
    lore:
        - <aqua>Description<white><&co>
        -     <white>Click to unassign all the above
        -     <white>permissions from <dark_aqua>Owners

# Unassign all permissions to Members
unassign_all_to_members:
    type: item
    material: light_blue_wool
    display name: <red><underline>Un<yellow><underline>assign All to <dark_aqua><underline>Members
    debug: false
    lore:
        - <aqua>Description<white><&co>
        -     <white>Click to unassign all the above
        -     <white>permissions from <dark_aqua>Members

# Unassign all permissions to Outsiders
unassign_all_to_outsiders:
    type: item
    material: yellow_wool
    display name: <red><underline>Un<yellow><underline>assign All to <dark_aqua><underline>Outsiders
    debug: false
    lore:
        - <aqua>Description<white><&co>
        -     <white>Click to unassign all the above
        -     <white>permissions from <dark_aqua>Outsiders

permissions_reset_to_default_item:
    type: item
    debug: false
    material: gray_wool
    display name: <yellow>Reset to <white>Defaults
    lore:
        - <aqua>Description<white><&co>
        -     <white>Click to reset all the above
        -     <white>permissions to the defaults
