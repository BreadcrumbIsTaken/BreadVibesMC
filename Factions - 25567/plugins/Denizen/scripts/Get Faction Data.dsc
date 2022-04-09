# Get Display Name Procedure
# Written by Breadcrumb
# Description:
#   Gets the display name of a faction provided by the ID. If the faction does not exist it will return null.
get_display_name:
    type: procedure
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.display_name]>

# Get Name Procedure
# Written by Breadcrumb
# Description:
#   Gets the name of a faction provided by the ID. If the faction does not exist it will return null.
get_name:
    type: procedure
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.name]>

# Get Settings Procedure
# Written by Breadcrumb
# Description:
#   Gets the settings for a faction provided by the ID. If the faction does not exist it will return null.
get_settings:
    type: procedure
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.settings]>

# Get Owner Procedure
# Written by Breadcrumb
# Description:
#   Gets the onwer of a faction provided by the ID. If the faction does not exist it will return null.
get_owner:
    type: procedure
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.owner]>

# Get Members Procedure
# Written by Breadcrumb
# Description:
#   Gets the members of a faction provided by the ID. If the faction does not exist it will return null.
get_members:
    type: procedure
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.members]>

# Get Rivalries Procedure
# Written by Breadcrumb
# Description:
#   Gets the rivalries of a faction provided by the ID. If the faction does not exist it will return null.
get_rivalries:
    type: procedure
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.rivalries]>

# Get Allies Procedure
# Written by Breadcrumb
# Description:
#   Gets the allies of a faction provided by the ID. If the faction does not exist it will return null.
get_allies:
    type: procedure
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.allies]>

# Get Power Procedure
# Written by Breadcrumb
# Description:
#   Gets the power of a faction provided by the ID. If the faction does not exist it will return null.
get_power:
    type: procedure
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.power]>

# Get Claims Procedure
# Written by Breadcrumb
# Description:
#   Gets the claims of a faction provided by the ID. If the faction does not exist it will return null.
get_claims:
    type: procedure
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.claims]>

get_tagline:
    type: procedure
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.tagline]>

get_tagline_display:
    type: procedure
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.tagline_display]>

get_tagline_color:
    type: procedure
    definitions: id
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.<[id]>.settings.tagline_color]>

# get_teleport_coords:
#     type: procedure
#     definitions: id
#     script:
#         - determine "<server.flag[factions.<[id]>.teleport coords]>"

# Get Factions Procedure
# Written by Breadcrumb
# Description:
#   Gets all of the factions. Will return null if no factions exist.
get_factions:
    type: procedure
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions].exclude[all_claims]>

# Get All Claims Procedure
# Written by Breadcrumb
# Description:
#   Gets all claimed chunks known to the server. Will return null if no chunks are claimed.
get_all_claims:
    type: procedure
    script:
        - if <server.flag[factions].exists>:
            - determine <server.flag[factions.all_claims]>

# Get Player Faction Procedure
# Written by Breadcrumb
# Description:
#   Get's the player's faction.
get_faction:
    type: procedure
    definitions: player
    script:
        - if <[player].has_flag[faction]>:
            - determine <[player].flag[faction]>

get_faction_from_claim_name:
    type: procedure
    definitions: claim
    script:
        # Regex:
        #  Negative lookahead:
        #   Matches "faction_"
        #   Matches any character "."
        #   Matches previous token between zero and unlimited times as possible "*"
        #  Matches "_chunk"
        #  Matches any character "."
        #  Matches previous token between zero and unlimited times as possible "*"
        # Example:
        #  faction_32_claim_number_5
        # will only match:
        #  faction_32
        - determine <[claim].replace_text[regex:(?!faction_.*)_claim.*]>

get_faction_from_claim:
    type: procedure
    definitions: claim
    script:
        - foreach <proc[get_factions]> as:faction:
            - if <[claim]> in <[faction].proc[get_claims]>:
                - determine <[faction]>
