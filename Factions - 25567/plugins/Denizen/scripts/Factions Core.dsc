# TODO: Make a seperate inventory for members of the faction who aren't owners that don't have the ability to delete, transfer ownership, or change anything else. Just teleport to home (coming soon), see it's members and so forth.

# Main faction task.
faction:
    type: task
    script:
        - narrate Claim!
    edit:
        - narrate Edit!
    invite:
        - narrate Invite!
    settings:
        - narrate Settings!
    transfer_ownership:
        - if !<player.has_flag[waiting_for_owner_transfer_request_acceptance]>:
            - inventory open d:faction_action_danger_zone_transfer_ownership_player_list_inventory
        - else:
            - narrate "You are still waiting for <player.flag[waiting_for_owner_transfer_request_acceptance].name> to accept the ownership!"
    create:
        - if !<server.has_flag[factions]>:
            - flag server factions:<map[]>
            - flag server "factions.all claims:<list[]>"

        - flag server FACTION_IDS:++

        - define FACTION_UUID faction_<server.flag[FACTION_IDS]>

        - flag player FACTION:<[FACTION_UUID]>

        - definemap default_faction_data:
            owner: <player.uuid>
            members: <list[<player.uuid>]>
            name: <player.name>'s Faction
            settings:
                permissions:
                    # This is just place holder stuff ;0
                    - OwnersGetAllPerms
                    - MembersGetBasicPerms
                    - OutsidersDoNotGetPerms
                color: <white>
            display name: <white><player.name>'s Faction
            rivalries: <list[]>
            allies: <list[]>
            power: 100
            claims: <list[<player.location.chunk.cuboid>]>

        - note <player.location.chunk.cuboid> as:faction_cuboid_<[FACTION_UUID]>
        - flag server "factions.all claims:->:<player.location.chunk.cuboid>"
        - flag server factions.<[FACTION_UUID]>:<[default_faction_data]>

        - narrate "<green>Faction created! Check it out by using '/faction'!"
    delete:
        # TODO: Loop through all members of the faction and remove their FACTION flag
        - define FACTION_UUID <player.flag[FACTION]>

        - foreach <proc[get_all_claims]> as:cl:
            - flag server "factions.all claims:<-:<[cl]>"

        - flag server factions:<-:<[FACTION_UUID]>
        - flag player FACTION:!

        - narrate "<&[success]>Successfully deleted the faction!"
    wipe:
        - foreach <server.offline_players.include[<server.online_players>]> as:p:
            - if <[p].has_flag[FACTION]>:
                - flag <[p]> FACTION:!
        - foreach <proc[get_factions]> as:i:
            - flag server factions:<-:<[i]>
        - flag server "factions:<-:all claims"
        - flag server factions:!
        - foreach <server.notes[cuboids]> as:n:
            - if <[n].advanced_matches_text[*faction_cuboid_*]>:
                - note remove as:<[n].note_name>
        # - flag server "factions.all claims:!"
        - flag server FACTION_IDS:-1
        - narrate Wiped.