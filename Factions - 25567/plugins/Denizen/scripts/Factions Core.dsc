# Main faction task.
faction:
    type: task
    script:
        - if !<player.has_flag[FACTION]>:
            - inventory open d:faction_action_player_not_in_any_faction_inventory
        - else:
            - if <player> == <player.flag[faction].proc[get_owner]>:
                - run open_faction_action_inventory
            - else:
                - run open_faction_action_member_inventory
    invite:
        - narrate Invite! format:faction_action_format
    settings:
        - define inv <inventory[faction_action_settings_inventory]>
        # Dynamic dye item based off of faction's color.
        - inventory d:<[inv]> adjust slot:13 material:<proc[match_color_code_to_dye].context[<player.proc[get_faction].proc[get_settings].get[color]>]>_dye
        - inventory open d:<[inv]>
    transfer_ownership:
        - if !<player.has_flag[waiting_for_owner_transfer_request_acceptance]>:
            - inventory open d:faction_action_danger_zone_transfer_ownership_player_list_inventory
        - else:
            - narrate "You are still waiting for <player.flag[waiting_for_owner_transfer_request_acceptance].name> to accept the ownership!" format:faction_action_format
    create:
        - if !<server.has_flag[factions]>:
            - flag server factions:<map[]>
            - flag server factions.all_claims:<list[]>

        - flag server FACTION_IDS:++

        - define FACTION_UUID faction_<server.flag[FACTION_IDS]>

        - flag player FACTION:<[FACTION_UUID]>

        - definemap default_faction_data:
            owner: <player>
            members: <list[<player>]>
            name: <player.name>'s Faction
            settings:
                permissions:
                    # This is just place holder stuff ;0
                    - OwnersGetAllPerms
                    - MembersGetBasicPerms
                    - OutsidersDoNotGetPerms
                color: <white>
                tagline_color: <white>
            display_name: <white><player.name>'s Faction
            tagline: Cool Faction
            tagline_display: <white>Cool Faction
            rivalries: <list[]>
            allies: <list[]>
            power: 100
            claims: <list[]>

        - flag server factions.all_claims:->:<player.location.chunk.cuboid>
        - flag server factions.<[FACTION_UUID]>:<[default_faction_data]>
        - run faction.claim.claim_chunk def:<player.location.chunk.cuboid>|<[FACTION_UUID]>

        - narrate "<green>Faction created! Check it out by using '/faction'!" format:faction_action_format
    delete:
        - define faction <player.proc[get_faction]>

        - define members <[faction].proc[get_members]>
        - foreach <[members]> as i:
            - flag <[i]> faction:!

        - foreach <[faction].proc[get_claims]> as:i:
            - flag server factions.all_claims:<-:<[i]>
            - run faction.claim.unclaim_chunk def:<[faction]>|<[i]>

        - flag server factions:<-:<[faction]>
        - narrate "<green>Successfully deleted faction!" format:faction_action_format
    leave:
        - define faction <player.flag[faction]>
        - if <player> == <[faction].proc[get_owner]>:
            - narrate "Sorry, but you are going to have to tranfer ownership of your faction before you can leave it. You can do so in the <red>Danger Zone<reset> section of the Faction Action Inventory. (<bold>/f<reset>)" format:faction_action_format
            - stop
        - if <[faction].proc[get_members]> == <list[<player>]>:
            - narrate "You have successfully left the faction." format:faction_action_format
            - inject faction.delete
    wipe:
        - foreach <server.offline_players.include[<server.online_players>]> as:p:
            - if <[p].has_flag[FACTION]>:
                - flag <[p]> FACTION:!
        - define factions <proc[get_factions]>
        - if <[factions]> != null:
            - foreach <proc[get_factions]> as:i:
                - flag server factions:<-:<[i]>
            - flag server factions:<-:all_claims
            - flag server factions:!
            - foreach <server.notes[cuboids]> as:n:
                - if <[n].note_name.advanced_matches_text[faction_*_chunk_claim_*]>:
                    - note remove as:<[n].note_name>
            - flag server FACTION_IDS:-1
        - narrate Wiped. format:faction_action_format
    claim:
        claim_chunk:
            # Chunk
            - define loc <[1]>
            # Faction
            - define faction <[2]>

            # If there are no claims, set to 0.
            - define claimed_chunks <[faction].proc[get_claims].if_null[0]>

            #| If claimed_chunks == 0 (meaning there are no claims already), return 0 again.
            #| If claimed_chunks != 0 (meaning there are already claims), return the amount of claims.
            - define claim_number <element[<[claimed_chunks].equals[0]>].if_true[0].if_false[<[claimed_chunks].size>]>

            # Now, time for a little rant:
            # WHY IS IT ".size" AND NOT ".length" TO GET THE NUMBER OF ITEMS IN A LIST????????????

            - if <[claim_number]> == 0:
                # Sets it to 1
                - define claim_number:++
            - else:
                - foreach <[claimed_chunks]>:
                    - define claimed_chunks:++

            - note <[loc]> as:<[faction]>_chunk_claim_<[claim_number]>

            - flag server factions.<[faction]>.claims:->:<[faction]>_chunk_claim_<[claim_number]>
        unclaim_chunk:
            - define faction <[1]>
            - define chunk <[2]>

            - note remove as:<[faction]>_chunk_claim_<[chunk]>
