# TODO: Fix removal of more than one claim using `/ex run faction.wipe` bugging out and not removing notes.

# Main faction script. Holds all the important faction details and code to be run.
faction:
    type: task
    debug: false
    script:
        # Creates a faction or opens the Faction Action Inventory.
        - if !<player.has_flag[faction]>:
            - inventory open d:faction_action_player_not_in_any_faction_inventory
        - else:
            - if <player> == <player.flag[faction].proc[get_owner]>:
                - run open_faction_action_inventory
            - else:
                - run open_faction_action_member_inventory
    invite:
        - inventory close
        - run invite_player_message def:<player.flag[inviting]>
        - flag <player> inviting:!
    # Opens the settings inventory.
    settings:
        - define inv <inventory[faction_action_settings_inventory]>
        # Dynamic dye item based off of faction's color.
        - inventory d:<[inv]> adjust slot:12 material:<proc[match_color_code_to_dye].context[<player.proc[get_faction].proc[get_settings].get[color]>]>_dye
        - inventory open d:<[inv]>
    # Opens the transfer ownership inventory.
    transfer_ownership:
        - if !<player.has_flag[waiting_for_owner_transfer_request_acceptance]>:
            - inventory open d:faction_action_danger_zone_transfer_ownership_player_list_inventory
        - else:
            - narrate "You are still waiting for <player.flag[waiting_for_owner_transfer_request_acceptance].name> to accept the ownership!" format:faction_action_format
    # Creates a new faction.
    create:
        - if <player.location.chunk.cuboid> in <proc[get_all_claims].values||<list[]>>:
            - narrate "You cannot create a faction inside someone else's claim!" format:faction_action_error_format
            - stop
        - if !<server.has_flag[factions]>:
            - flag server factions:<map[]>
            # Map:
            # claim_name = claim_location
            # ex:
            # faction_1_claim_1 = cu@...
            - flag server factions.all_claims:<map[]>

        - if !<server.has_flag[faction_ids]>:
            - flag server faction_ids:-1

        - flag server faction_ids:++

        - define faction_uuid faction_<server.flag[faction_ids]>

        - flag <player> faction:<[faction_uuid]>

        - definemap default_faction_data:
            owner: <player>
            members: <list[<player>]>
            name: <player.name>'s Faction
            settings:
                permissions:
                    # This is just placeholder stuff ;0
                    - OwnersGetAllPerms
                    - MembersGetBasicPerms
                    - OutsidersDoNotGetPerms
                color: <white>
                tagline_color: <white>
                teleport_coords: null
            display_name: <white><player.name>'s Faction
            tagline: Wow!
            tagline_display: <white>Wow!
            rivalries: <list[]>
            allies: <list[]>
            claim_chips: 1
            claims: <map[]>

        - flag server factions.<[faction_uuid]>:<[default_faction_data]>
        - run faction.claiming.claim def:<player.location.chunk.cuboid>|<[faction_uuid]>
        - flag server factions.<[faction_uuid]>.settings.teleport_coords:<player.location.chunk.cuboid.center.highest.add[0,1,0].with_pose[<player>]>
        - flag <player> is_in_wilderness:!

        - narrate "<green>Faction created! Check it out by using '/faction'!" format:faction_action_format
    # Deletes a faction.
    delete:
        - define faction <player.proc[get_faction]>
        - run faction.claiming.unclaim_all def.1:<[faction]>

        - define members <[faction].proc[get_members]>
        - if <[members]> != null:
            - foreach <[members]> as:i:
                - flag <[i]> faction:!

        - flag server factions:<server.flag[factions].exclude[<[faction]>]>
        - narrate "<green>Successfully deleted faction!" format:faction_action_format
        - flag <player> is_in_wilderness
    # Lets the player leave their faction.
    leave:
        - define faction <player.flag[faction]>
        - if <player> == <[faction].proc[get_owner]>:
            - if <[faction].proc[get_members].size> == 1:
                - narrate "Sorry, but you are going to have to tranfer ownership of your faction before you can leave it. You can do so in the <red>Danger Zone<reset> section of the Faction Action Inventory. (<underline><element[/f].on_click[/help f].on_hover[Click to display help message for this command.]><reset>)" format:faction_action_error_format
                - stop
            - else:
                - narrate "You have successfully left the faction." format:faction_action_format
                - run faction.delete
        - else:
            - flag server factions.<player.flag[faction]>.members:<-:<player>
            - flag <player> faction:!
            - narrate "You have successfully left the faction." format:faction_action_format
    # Wipe ALL existing factions. Only used for testing, debugging, restarting, and publishing purposes.
    wipe:
        - foreach <server.players> as:__player:
            - define faction <player.proc[get_faction]||null>
            - if <[faction]> != null:
                - define members <[faction].proc[get_members]>
                - foreach <[members]> as:i:
                    - flag <[i]> faction:!

                - run faction.claiming.unclaim_all def.1:<[faction]>

                - flag server factions:<server.flag[factions].exclude[<[faction]>]>
                - flag <player> is_in_wilderness
        - flag server faction_ids:-1
        - flag server factions:!
        - narrate Wiped. format:faction_action_format
    # All the claiming scripts.
    claiming:
        # Claims a chunk.
        claim:
            - define loc <[1]>
            - define faction <[2]>

            - define claim_number <[faction].proc[get_claims].equals[0].if_true[1].if_false[<[faction].proc[get_claims].size.add[1]>]>

            - define claim_name <[faction]>_claim_<[claim_number]>
            - define name_loc_map <map[<[claim_name]>=<[loc]>]>
            - if <proc[get_all_claims]> == null:
                - define claims <map[]>
            - else:
                - define claims <proc[get_all_claims]>

            - if <[faction].proc[get_claims]> == null:
                - define faction_claims <map[]>
            - else:
                - define faction_claims <[faction].proc[get_claims]>

            - flag server factions.all_claims:<[claims].include[<[name_loc_map]>]>
            - flag server factions.<[faction]>.claims:<[faction_claims].include[<[name_loc_map]>]>
            - note <[loc]> as:<[claim_name]>
        # Unclaims a chunk.
        unclaim:
            - define faction <[1]>
            - define loc <[2]>

            - define claims <[faction].proc[get_claims]>

            - foreach <[claims]> key:claim_name as:claim:
                - if <[loc]> == <[claim]>:
                    - flag server factions.<[faction]>.claims:<[claims].exclude[<[claim_name]>]>
                    - flag server factions.all_claims:<proc[get_all_claims].exclude[<[claim_name]>]>
                    - note remove as:<[claim_name]>

        # Unclaims all the chunks in a faction. Used for debugging, testing, and deletion of a faction.
        unclaim_all:
            - define faction <[1]>

            - if <[faction].proc[get_claims]> != null:
                - foreach <[faction].proc[get_claims]> key:claim:
                    - flag server factions.all_claims:<proc[get_all_claims].exclude[<[claim]>]>
                    - note remove as:<[claim]>

                - flag server factions.<[faction]>.claims:<map[]>
