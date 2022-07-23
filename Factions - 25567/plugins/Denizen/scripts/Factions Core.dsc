# Main faction script. Holds all the important faction details and code to be run.
faction:
    type: task
    debug: false
    script:
        # Creates a faction or opens the Faction Action Inventory.
        - if !<player.has_flag[FACTION]>:
            - inventory open d:faction_action_player_not_in_any_faction_inventory
        - else:
            - if <player> == <player.flag[faction].proc[get_owner]>:
                - run open_faction_action_inventory
            - else:
                - run open_faction_action_member_inventory
    # TODO: Inviting other players to the faction.
    invite:
        - narrate Invite! format:faction_action_format
    # Opens the settings inventory.
    settings:
        - define inv <inventory[faction_action_settings_inventory]>
        # Dynamic dye item based off of faction's color.
        - inventory d:<[inv]> adjust slot:13 material:<proc[match_color_code_to_dye].context[<player.proc[get_faction].proc[get_settings].get[color]>]>_dye
        - inventory open d:<[inv]>
    # Opens the transfer ownership inventory.
    transfer_ownership:
        - if !<player.has_flag[waiting_for_owner_transfer_request_acceptance]>:
            - inventory open d:faction_action_danger_zone_transfer_ownership_player_list_inventory
        - else:
            - narrate "You are still waiting for <player.flag[waiting_for_owner_transfer_request_acceptance].name> to accept the ownership!" format:faction_action_format
    # Creates a new faction.
    create:
        - if !<server.has_flag[factions]>:
            - flag server factions:<map[]>
            # Map:
            # claim_name = claim_location
            # ex:
            # faction_1_claim_1 = cu@...
            - flag server factions.all_claims:<map[]>

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
            display_name: <white><player.name>'s Faction
            tagline: Wow!
            tagline_display: <white>Wow!
            rivalries: <list[]>
            allies: <list[]>
            power: 100
            claims: <map[]>

        - flag server factions.<[faction_uuid]>:<[default_faction_data]>
        - run faction.claiming.claim def:<player.location.chunk.cuboid>|<[faction_uuid]>
        - flag <player> is_in_wilderness:false

        - narrate "<green>Faction created! Check it out by using '/faction'!" format:faction_action_format
    # Deletes a faction.
    delete:
        - define faction <player.proc[get_faction]>
        - run faction.claiming.unclaim_all def.1:<[faction]>

        - define members <[faction].proc[get_members]>
        - foreach <[members]> as:i:
            - flag <[i]> faction:!

        - flag server factions:<-:<[faction]>
        - narrate "<green>Successfully deleted faction!" format:faction_action_format
        - flag <player> is_in_wilderness:true
    # Lets the player leave their faction.
    leave:
        - define faction <player.flag[faction]>
        - if <player> == <[faction].proc[get_owner]>:
            - narrate "Sorry, but you are going to have to tranfer ownership of your faction before you can leave it. You can do so in the <red>Danger Zone<reset> section of the Faction Action Inventory. (<bold>/f<reset>)" format:faction_action_format
            - stop
        - if <[faction].proc[get_members]> == <list[<player>]>:
            - narrate "You have successfully left the faction." format:faction_action_format
            - inject faction.delete
    # Wipe ALL existing factions. Only used for testing, debugging, restarting, and publishing purposes.
    wipe:
        - foreach <server.online_players> as:__player:
            - define faction <player.proc[get_faction]||null>
            - if <[faction]> != null:
                - run faction.claiming.unclaim_all def.1:<[faction]>

                - define members <[faction].proc[get_members]>
                - foreach <[members]> as:i:
                    - flag <[i]> faction:!

                - flag server factions:<-:<[faction]>
        - flag server faction_ids:-1
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

            - flag server factions.all_claims:<[claims].include[<[name_loc_map]>]>
            - flag server factions.<[faction]>.claims:<[claims].include[<[name_loc_map]>]>
            - note <[loc]> as:<[claim_name]>
        # Unclaims a chunk.
        unclaim:
            - define faction <[1]>
            - define loc <[2]>

            - foreach <proc[get_all_claims]> key:claim_name as:location:
                - if <[location]> == <[loc]>:
                    - flag server factions.<[faction]>.claims:<proc[get_all_claims].exclude[<[claim_name]>]>
                    - flag server factions.all_claims:<proc[get_all_claims].exclude[<[claim_name]>]>
                    - note remove as:<[claim_name]>
        # Unclaims all the chunks in a faction. Used for debugging, testing, and deletion of a faction.
        unclaim_all:
            - define faction <[1]>

            - foreach <proc[get_all_claims]> key:claim_name:
                - foreach <[faction].proc[get_claims]> key:claim:
                    - if <[claim]> == <[claim_name]>:
                        - flag server factions.<[faction]>.claims:<proc[get_all_claims].exclude[<[claim_name]>]>
                        - flag server factions.all_claims:<proc[get_all_claims].exclude[<[claim_name]>]>
                        - note remove as:<[claim_name]>
