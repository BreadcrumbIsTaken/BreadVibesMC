# Change Player Gamemode Command.
# Written by Breadcrumb
# Desc:
#   Changes the players gamemode.
# Args:
#   Gamemode: ElementTag - The gamemode to change to.
#   Player: ElementTag OPTIONAL - The player to change the gamemode. Defaults to the player issuing the command.
# Determines: passively NONE
gamemode_changer:
    type: command
    name: gm
    permission: breadvibesmc.admin.gamemode_changer
    description: Changes your game mode. Player name is optional. If None, your gamemode will change.
    usage: /gm [gamemode] (player)
    debug: false
    tab completions:
        1: s|sp|a|c
        2: <server.online_players.parse[name]>
    script:
        # defines everything
        - define player <server.match_player[<context.args.get[2].if_null[null]>].if_null[null]>
        - define gm <context.args.get[1]>

        # if the player is not null, then decides what to do with the given parameters
        - if <[player]> != null:
            - choose <[gm]>:
                # - if args is s
                - case s:
                    - adjust <[player]> gamemode:survival
                    - narrate "Your gamemode is now <&gradient[from=#006bff;to=#4dff00]><bold>Survivial<reset>courtesy of <player.proc[p_nameplate]>" targets:<[player]>
                    - narrate "<[player].proc[p_nameplate_def]>'s gamemode is now <&gradient[from=#006bff;to=#4dff00]>Surivial"
                # - if args is sp
                - case sp:
                    - adjust <[player]> gamemode:spectator
                    - narrate "Your gamemode is now <&gradient[from=#006bff;to=#4dff00]><bold>Spectator<reset>courtesy of <player.proc[p_nameplate]>" targets:<[player]>
                    - narrate "<[player].proc[p_nameplate_def]>'s gamemode is now <&gradient[from=#006bff;to=#4dff00]>Spectator"
                # - if args is a
                - case a:
                    - adjust <[player]> gamemode:adventure
                    - narrate "Your gamemode is now <&gradient[from=#006bff;to=#4dff00]><bold>Adventure<reset>courtesy of <player.proc[p_nameplate]>" targets:<[player]>
                    - narrate "<[player].proc[p_nameplate_def]>'s gamemode is now <&gradient[from=#006bff;to=#4dff00]>Adventure"
                # - if args is c
                - case c:
                    - adjust <[player]> gamemode:creative
                    - narrate "Your gamemode is now <&gradient[from=#006bff;to=#4dff00]><bold>Creative<reset>courtesy of <player.proc[p_nameplate]>" targets:<[player]>
                    - narrate "<[player].proc[p_nameplate_def]>'s gamemode is now <&gradient[from=#006bff;to=#4dff00]>Creative"
            - playeffect effect:TOTEM at:<[player].location.add[0,3,0]> visibility:25 quantity:75
        # if the player is null, then effect the player who did the command
        - else:
            - choose <[gm]>:
                # - if args is s
                - case s:
                    - adjust <player> gamemode:survival
                    - narrate "Your gamemode is now <&gradient[from=#006bff;to=#4dff00]><bold>Survival"
                # - if args is sp
                - case sp:
                    - adjust <player> gamemode:spectator
                    - narrate "Your gamemode is now <&gradient[from=#006bff;to=#4dff00]><bold>Spectator"
                # - if args is a
                - case a:
                    - adjust <player> gamemode:adventure
                    - narrate "Your gamemode is now <&gradient[from=#006bff;to=#4dff00]><bold>Adventure"
                # - if args is c
                - case c:
                    - adjust <player> gamemode:creative
                    - narrate "Your gamemode is now <&gradient[from=#006bff;to=#4dff00]><bold>Creative"
            - playeffect effect:TOTEM at:<player.location.add[0,3,0]> visibility:25 quantity:75
