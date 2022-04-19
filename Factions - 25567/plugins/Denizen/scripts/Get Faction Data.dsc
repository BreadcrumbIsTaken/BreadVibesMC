# Gets the display name of a faction.
get_display_name:
    type: procedure
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.display_name]>

# Gets the name of a faction.
get_name:
    type: procedure
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.name]>

# Gets the settings of a faction.
get_settings:
    type: procedure
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.settings]>

# Gets the owner of the faction.
get_owner:
    type: procedure
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.owner]>

# Gets the factions rivals.
get_members:
    type: procedure
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.members]>

# Gets the faction's rivals.
get_rivalries:
    type: procedure
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.rivalries]>

# Gets the faction's allies.
get_allies:
    type: procedure
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.allies]>

# Gets the faction's power level.
get_power:
    type: procedure
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.power]>

# Gets the faction's claims.
get_claims:
    type: procedure
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.claims]>

# Gets a faction's tagline.
get_tagline:
    type: procedure
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.tagline]>

# Gets the display name of a faction's tagline.
get_tagline_display:
    type: procedure
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.tagline_display]>

# Gets the color of a faction's tagline.
get_tagline_color:
    type: procedure
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.settings.tagline_color]>

# TODO: Implement a teleport coordinate system for factions, giving the player the ability to specify where to be taken when they want to teleport to their faction.
# get_teleport_coords:
#     type: procedure
#     definitions: id
#     script:
#         - determine "<server.flag[factions.<[id]>.teleport coords]>"

# Get a list of all the factions registered on the server.
get_factions:
    type: procedure
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions].exclude[all_claims]>

# Gets all the claims registered on the server.
get_all_claims:
    type: procedure
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.all_claims]>

# Gets the faction that a player is in.
get_faction:
    type: procedure
    definitions: player
    script:
        - if <[player].has_flag[faction]>:
            - determine <[player].flag[faction]>

# Get a faction's name from a claim (cuboid).
get_faction_name_from_note_name:
    type: procedure
    definitions: note_name
    script:
        - foreach <proc[get_all_claims]> key:claim_name as:location:
            - foreach <proc[get_factions]> key:faction as:faction_data:
                - foreach <[faction_data].get[claims]> as:faction_claim:
                    - if <[note_name]> == <[faction_claim]>:
                        - determine <[faction]>

# Get a faction's data from a claim (cuboid).
get_faction_data_from_note_name:
    type: procedure
    definitions: note_name
    script:
        - foreach <proc[get_all_claims]> key:claim_name as:location:
            - foreach <proc[get_factions]> as:faction:
                - foreach <[faction].get[claims]> as:faction_claim:
                    - if <[note_name]> == <[faction_claim]>:
                        - determine <[faction]>

# Get a faction's name from a claim's note name. (cuboid).
get_faction_name_from_cuboid:
    type: procedure
    definitions: cuboid
    script:
        - foreach <proc[get_all_claims]> key:claim_name as:location:
            - foreach <proc[get_factions]> key:faction as:faction_data:
                - if <[cuboid]> == <[location]>:
                    - determine <[faction]>

# Get a faction's data from a claim's note name (cuboid).
get_faction_data_name_from_cuboid:
    type: procedure
    definitions: cuboid
    script:
        - foreach <proc[get_all_claims]> key:claim_name as:location:
            - foreach <proc[get_factions]> key:faction as:faction_data:
                - if <[cuboid]> == <[location]>:
                    - determine <[faction_data]>
