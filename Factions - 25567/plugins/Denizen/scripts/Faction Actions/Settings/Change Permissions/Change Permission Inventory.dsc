change_faction_permissions_inventory:
    type: inventory
    inventory: chest
    gui: true
    title: Change <blue>Permissions
    debug: false
    procedural items:
        - define list <list[]>
        - define perms <script[faction_permissions].data_key[permissions]>
        - foreach <[perms]> as:perm:
            # '.parsed' is there so newlines "<n>" in the description can be parsed as a new line.
            - define lore <list[<aqua>Description<white><bold>:|    <reset><[perm].get[description].parsed>]>

            - define owner_perms <server.flag[factions.<player.flag[faction]>.settings.permissions.owners]>
            - define member_perms <server.flag[factions.<player.flag[faction]>.settings.permissions.members]>
            - define outsider_perms <server.flag[factions.<player.flag[faction]>.settings.permissions.outsiders]>

            - define "lore:->:<dark_red>Assigned to<white><bold><&co>"

            - define name <[perms].keys.get[<[loop_index]>]>

            - if <[owner_perms]> !contains <[name]> && <[member_perms]> !contains <[name]> && <[outsider_perms]> !contains <[name]>:
                - define "lore:->:    <white>- None"

            - if <[owner_perms]> contains <[name]>:
                - define "lore:->:    <white>- <dark_aqua>Owners"
            - if <[member_perms]> contains <[name]>:
                - define "lore:->:    <white>- <dark_aqua>Members"
            - if <[outsider_perms]> contains <[name]>:
                - define "lore:->:    <white>- <dark_aqua>Outsiders"

            - define item <item[name_tag[display_name=<yellow><underline><[perm].get[display]><reset>;lore=<[lore]>]].with_flag[permission:<[name]>]>
            - define list:->:<[item]>
        - define list:|:<item[filler].repeat_as_list[54]>
        - determine <[list]>
    slots:
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [assign_all_to_owners] [assign_all_to_members] [assign_all_to_outsiders] [] [] []
        - [back_page_item] [] [] [unassign_all_to_owners] [unassign_all_to_members] [unassign_all_to_outsiders] [] [] [permissions_reset_to_default_item]

change_permission_options_inventory:
    type: inventory
    inventory: chest
    gui: true
    title: Editing
    debug: false
    procedural items:
        - determine <item[filler].repeat_as_list[18]>
    slots:
        - [] [] [] [owner_permission_item] [member_permission_item] [outsider_permission_item] [] [] []
        - [cancel_permission_changes] [] [] [] [] [] [] [] [apply_permission_changes]
