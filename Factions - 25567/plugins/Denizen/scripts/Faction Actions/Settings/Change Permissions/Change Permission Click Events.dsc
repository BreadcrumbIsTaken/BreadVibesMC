# Change the item lores and assigns item flags
change_permissions_click_events:
    type: world
    debug: false
    events:
        on player clicks back_page_item in change_faction_permissions_inventory:
            - inventory open d:faction_action_settings_inventory
        on player clicks name_tag in change_faction_permissions_inventory:
            - define permission <context.item.flag[permission]>
            - flag <player> editing_permission:<[permission]>
            - define inv <inventory[change_permission_options_inventory]>
            - adjust <[inv]> "title:Editing: <blue><script[faction_permissions].data_key[permissions.<[permission]>.display]>"

            # ----- Owner Permissions -----
            - if <[permission]> in <server.flag[factions.<player.flag[faction]>.settings.permissions.owners]>:
                - define lore <[inv].slot[4].lore>
                - define "lore:->:    <white>- <dark_green>Assigned"
                - define assigned true
            - else:
                - define lore <[inv].slot[4].lore>
                - define "lore:->:    <white>- <red>Unassigned"
                - define assigned false

            - inventory adjust d:<[inv]> slot:4 lore:<[lore]>
            - inventory flag slot:4 perm:<[permission]> d:<[inv]>
            - inventory flag slot:4 assigned:<[assigned]> d:<[inv]>

            # ----- Member Permissions -----
            - if <[permission]> in <server.flag[factions.<player.flag[faction]>.settings.permissions.members]>:
                - define lore <[inv].slot[5].lore>
                - define "lore:->:    <white>- <dark_green>Assigned"
                - define assigned true
            - else:
                - define lore <[inv].slot[5].lore>
                - define "lore:->:    <white>- <red>Unassigned"
                - define assigned false

            - inventory adjust d:<[inv]> slot:5 lore:<[lore]>
            - inventory flag slot:5 perm:<[permission]> d:<[inv]>
            - inventory flag slot:5 assigned:<[assigned]> d:<[inv]>

            # ----- Outsider Permissions -----
            - if <[permission]> in <server.flag[factions.<player.flag[faction]>.settings.permissions.outsiders]>:
                - define lore <[inv].slot[6].lore>
                - define "lore:->:    <white>- <dark_green>Assigned"
                - define assigned true
            - else:
                - define lore <[inv].slot[6].lore>
                - define "lore:->:    <white>- <red>Unassigned"
                - define assigned false

            - inventory adjust d:<[inv]> slot:6 lore:<[lore]>
            - inventory flag slot:6 perm:<[permission]> d:<[inv]>
            - inventory flag slot:6 assigned:<[assigned]> d:<[inv]>

            - inventory open d:<[inv]>

# Click events for editing the permissions.
edit_permission_click_events:
    type: world
    debug: false
    events:
        # Owner Permissions
        on player clicks item in change_permission_options_inventory slot:4:
            - define permission <context.item.flag[perm]>
            - define assigned <context.item.flag[assigned].not>
            - if <[assigned]>:
                - define lore <context.inventory.slot[4].lore>
                - define lore[last]:<-
                - define "lore:->:    <white>- <dark_green>Assigned"
                - inventory flag assigned:<[assigned]> slot:4 d:<context.inventory>
            - else:
                - define lore <context.inventory.slot[4].lore>
                - define lore[last]:<-
                - define "lore:->:    <white>- <red>Unassigned"
                - inventory flag assigned:<[assigned]> slot:4 d:<context.inventory>

            - inventory adjust d:<context.inventory> slot:4 lore:<[lore]>
        # Member Permissions
        on player clicks item in change_permission_options_inventory slot:5:
            - define permission <context.item.flag[perm]>
            - define assigned <context.item.flag[assigned].not>
            - if <[assigned]>:
                - define lore <context.inventory.slot[5].lore>
                - define lore[last]:<-
                - define "lore:->:    <white>- <dark_green>Assigned"
                - inventory flag assigned:<[assigned]> slot:5 d:<context.inventory>
            - else:
                - define lore <context.inventory.slot[5].lore>
                - define lore[last]:<-
                - define "lore:->:    <white>- <red>Unassigned"
                - inventory flag assigned:<[assigned]> slot:5 d:<context.inventory>

            - inventory adjust d:<context.inventory> slot:5 lore:<[lore]>
        # Outsider Permissions
        on player clicks item in change_permission_options_inventory slot:6:
            - define permission <context.item.flag[perm]>
            - define assigned <context.item.flag[assigned].not>
            - if <[assigned]>:
                - define lore <context.inventory.slot[6].lore>
                - define lore[last]:<-
                - define "lore:->:    <white>- <dark_green>Assigned"
                - inventory flag assigned:<[assigned]> slot:6 d:<context.inventory>
            - else:
                - define lore <context.inventory.slot[6].lore>
                - define lore[last]:<-
                - define "lore:->:    <white>- <red>Unassigned"
                - inventory flag assigned:<[assigned]> slot:6 d:<context.inventory>

            - inventory adjust d:<context.inventory> slot:6 lore:<[lore]>
        # Cancel Changes
        on player clicks cancel_permission_changes in change_permission_options_inventory:
            - flag <player> editing_permission:!
            - inventory open d:change_faction_permissions_inventory
        # Apply Changes
        on player clicks apply_permission_changes in change_permission_options_inventory:
            - flag <player> editing_permission:!
            - define owner_item <context.inventory.slot[4]>
            - define member_item <context.inventory.slot[5]>
            - define outsider_item <context.inventory.slot[6]>

            - if <[owner_item].flag[assigned]>:
                - if <[owner_item].flag[perm]> !in <server.flag[factions.<player.flag[faction]>.settings.permissions.owners]>:
                    - flag server factions.<player.flag[faction]>.settings.permissions.owners:->:<[owner_item].flag[perm]>
            - else:
                - if <[owner_item].flag[perm]> in <server.flag[factions.<player.flag[faction]>.settings.permissions.owners]>:
                    - flag server factions.<player.flag[faction]>.settings.permissions.owners:<-:<[owner_item].flag[perm]>

            - if <[member_item].flag[assigned]>:
                - if <[member_item].flag[perm]> !in <server.flag[factions.<player.flag[faction]>.settings.permissions.members]>:
                    - flag server factions.<player.flag[faction]>.settings.permissions.members:->:<[member_item].flag[perm]>
            - else:
                - if <[member_item].flag[perm]> in <server.flag[factions.<player.flag[faction]>.settings.permissions.members]>:
                    - flag server factions.<player.flag[faction]>.settings.permissions.members:<-:<[member_item].flag[perm]>

            - if <[outsider_item].flag[assigned]>:
                - if <[outsider_item].flag[perm]> !in <server.flag[factions.<player.flag[faction]>.settings.permissions.outsiders]>:
                    - flag server factions.<player.flag[faction]>.settings.permissions.outsiders:->:<[outsider_item].flag[perm]>
            - else:
                - if <[outsider_item].flag[perm]> in <server.flag[factions.<player.flag[faction]>.settings.permissions.outsiders]>:
                    - flag server factions.<player.flag[faction]>.settings.permissions.outsiders:<-:<[outsider_item].flag[perm]>

            - inventory open d:change_faction_permissions_inventory
            - narrate "Changes Applied!" format:faction_action_format

bulk_permission_assignments:
    type: world
    debug: false
    events:
        on player clicks assign_all_to_owners in change_faction_permissions_inventory:
            - define permissions <script[faction_permissions].data_key[permissions]>
            - foreach <[permissions].keys> as:perm:
                - if <[perm]> !in <server.flag[factions.<player.flag[faction]>.settings.permissions.owners]>:
                    - flag server factions.<player.flag[faction]>.settings.permissions.owners:->:<[perm]>
            - narrate "Assigned all permissions to <dark_aqua>Owners!" format:faction_action_format
            - inventory open d:change_faction_permissions_inventory
        on player clicks assign_all_to_members in change_faction_permissions_inventory:
            - define permissions <script[faction_permissions].data_key[permissions]>
            - foreach <[permissions].keys> as:perm:
                - if <[perm]> !in <server.flag[factions.<player.flag[faction]>.settings.permissions.members]>:
                    - flag server factions.<player.flag[faction]>.settings.permissions.members:->:<[perm]>
            - narrate "Assigned all permissions to <dark_aqua>Members!" format:faction_action_format
            - inventory open d:change_faction_permissions_inventory
        on player clicks assign_all_to_outsiders in change_faction_permissions_inventory:
            - define permissions <script[faction_permissions].data_key[permissions]>
            - foreach <[permissions].keys> as:perm:
                - if <[perm]> !in <server.flag[factions.<player.flag[faction]>.settings.permissions.outsiders]>:
                    - flag server factions.<player.flag[faction]>.settings.permissions.Outsiders:->:<[perm]>
            - narrate "Assigned all permissions to <dark_aqua>Outsiders!" format:faction_action_format
            - inventory open d:change_faction_permissions_inventory
        on player clicks unassign_all_to_owners in change_faction_permissions_inventory:
            - define permissions <script[faction_permissions].data_key[permissions]>
            - flag server factions.<player.flag[faction]>.settings.permissions.owners:<list[]>
            - narrate "Unassigned all permissions to <dark_aqua>Owners!" format:faction_action_format
            - inventory open d:change_faction_permissions_inventory
        on player clicks unassign_all_to_members in change_faction_permissions_inventory:
            - define permissions <script[faction_permissions].data_key[permissions]>
            - flag server factions.<player.flag[faction]>.settings.permissions.members:<list[]>
            - narrate "Unassigned all permissions to <dark_aqua>Members!" format:faction_action_format
            - inventory open d:change_faction_permissions_inventory
        on player clicks unassign_all_to_outsiders in change_faction_permissions_inventory:
            - define permissions <script[faction_permissions].data_key[permissions]>
            - flag server factions.<player.flag[faction]>.settings.permissions.outsiders:<list[]>
            - narrate "Unassigned all permissions to <dark_aqua>Outsiders!" format:faction_action_format
            - inventory open d:change_faction_permissions_inventory
