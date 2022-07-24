# Gets the display name of a faction.
get_display_name:
    type: procedure
    debug: false
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.display_name]||null>

# Gets the name of a faction.
get_name:
    type: procedure
    debug: false
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.name]||null>

# Gets the settings of a faction.
get_settings:
    type: procedure
    debug: false
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.settings]||null>

# Gets the owner of the faction.
get_owner:
    type: procedure
    debug: false
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.owner]||null>

# Gets the factions rivals.
get_members:
    type: procedure
    debug: false
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.members]||null>

# Gets the faction's rivals.
get_rivalries:
    type: procedure
    debug: false
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.rivalries]||null>

# Gets the faction's allies.
get_allies:
    type: procedure
    debug: false
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.allies]||null>

# Gets the faction's power level.
get_power:
    type: procedure
    debug: false
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.power]||null>

# Gets the faction's claims.
get_claims:
    type: procedure
    debug: false
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.claims]||null>

# Gets the faction's color
get_color:
    type: procedure
    debug: false
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.settings.color]||null>

# Gets a faction's tagline.
get_tagline:
    type: procedure
    debug: false
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.tagline]||null>

# Gets the display name of a faction's tagline.
get_tagline_display:
    type: procedure
    debug: false
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.tagline_display]||null>

# Gets the color of a faction's tagline.
get_tagline_color:
    type: procedure
    debug: false
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.settings.tagline_color]||null>

get_teleport_coords:
    type: procedure
    debug: false
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.settings.teleport_coords]||null>

# Get a list of all the factions registered on the server.
get_factions:
    type: procedure
    debug: false
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions].exclude[all_claims]||null>

# Gets all the claims registered on the server.
get_all_claims:
    type: procedure
    debug: false
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.all_claims]||null>

# Gets the faction that a player is in.
get_faction:
    type: procedure
    debug: false
    definitions: player
    script:
        - if <[player].has_flag[faction]>:
            - determine <[player].flag[faction]||null>

# Get a faction's name from a claim (cuboid).
get_faction_name_from_note_name:
    type: procedure
    debug: false
    definitions: note_name
    script:
        - foreach <proc[get_all_claims]>:
            - foreach <proc[get_factions]> key:faction as:faction_data:
                - foreach <[faction_data].get[claims]> key:faction_note_name:
                    - if <[note_name]> == <[faction_note_name]>:
                        - determine <[faction]||null>

# Get a faction's data from a claim (cuboid).
get_faction_data_from_note_name:
    type: procedure
    debug: false
    definitions: note_name
    script:
        - foreach <proc[get_all_claims]>:
            - foreach <proc[get_factions]> as:faction_data:
                - foreach <[faction_data].get[claims]> key:faction_note_name:
                    - if <[note_name]> == <[faction_note_name]>:
                        - determine <[faction_data]||null>

# Get a faction's name from a claim's note name. (cuboid).
get_faction_name_from_cuboid:
    type: procedure
    debug: false
    definitions: cuboid
    script:
        - foreach <proc[get_all_claims]>:
            - foreach <proc[get_factions]> key:faction:
                - foreach <[faction].proc[get_claims]> as:loc:
                    - if <[cuboid]> == <[loc]>:
                        - determine <[faction]||null>

# Get a faction's data from a claim's note name (cuboid).
get_faction_data_from_cuboid:
    type: procedure
    debug: false
    definitions: cuboid
    script:
        - foreach <proc[get_all_claims]>:
            - foreach <proc[get_factions]> key:faction as:faction_data:
                - foreach <[faction].proc[get_claims]> as:loc:
                    - if <[cuboid]> == <[loc]>:
                        - determine <[faction_data]||null>
