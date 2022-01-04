get_display_name:
    type: procedure
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine "<server.flag[factions.<[id]>.display name]>"
        - else:
            - determine null

get_name:
    type: procedure
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.name]>
        - else:
            - determine null

get_settings:
    type: procedure
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.settings]>
        - else:
            - determine null

get_owner:
    type: procedure
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.owner]>
        - else:
            - determine null

get_members:
    type: procedure
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.members]>
        - else:
            - determine null

get_rivalries:
    type: procedure
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.rivalries]>
        - else:
            - determine null

get_allies:
    type: procedure
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.allies]>
        - else:
            - determine null

get_power:
    type: procedure
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.power]>
        - else:
            - determine null

get_claims:
    type: procedure
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.claims]>
        - else:
            - determine null

# get_teleport_coords:
#     type: procedure
#     definitions: id
#     script:
#         - determine "<server.flag[factions.<[id]>.teleport coords]>"

get_factions:
    type: procedure
    script:
        - if <server.flag[factions].exists>:
            - determine "<server.flag[factions].exclude[all claims]>"
        - else:
            - determine null

get_all_claims:
    type: procedure
    script:
        - if <server.flag[factions].exists>:
            - determine "<server.flag[factions.all claims]>"
        - else:
            - determine null

get_player_faction:
    type: procedure
    definitions: player
    script:
        - determine <[player].flag[faction]>