# Give a player's faction Claim Chips (CC)
give_claim_chips:
    type: task
    debug: false
    definitions: player|cc
    script:
        - define faction <[player].flag[faction]||null>
        - if <[faction]> == null:
            - stop

        - flag server factions.<[faction]>.claim_chips:+:<[cc]>

        - narrate "<green>You just earned <[cc].proc[cc_display]><green> for your faction!" format:faction_announcement_format targets:<[player]>
        - narrate "<[player].name><green> just earned <aqua><[cc]><yellow>CC<green> for your faction!" format:faction_announcement_format targets:<[faction].proc[get_members].exclude[<[player]>]>

# Lets admins give a player's faction claim chips.
give_claim_chips_command:
    type: command
    name: givecc
    debug: false
    usage: /givecc [amount] [player] (announce)
    description: Give Claim Chips to a player's faction.
    permission: breadvibesmc.admin.givecc
    tab completions:
        1: amount
        2: <server.online_players.parse[name]>
        3: announce
    script:
        - define amount <context.args.get[1]||null>
        - define player <server.match_player[<context.args.get[2]>]||null>
        - define announce <context.args.get[3]||null>

        - if <[amount]> == null || <[player]> == null:
            - narrate "Missing argument! See <element[<underline>/help].on_click[/help <context.alias>].on_hover[Click to display help message for this command.]> for usage information." format:command_error_format
            - stop

        - define faction <[player].flag[faction]||null>
        - if <[faction]> == null:
            - narrate "This player is not in a faction!" format:command_error_format
            - stop

        - flag server factions.<[faction]>.claim_chips:+:<[amount]>
        - narrate "You gave <[player].name>'s faction <[amount].proc[cc_display]>." format:command_success_format

        - if <[announce]> != null:
            - narrate "Your faction was given <[amount].proc[cc_display]>!" format:faction_announcement_format targets:<[faction].proc[get_members]>
