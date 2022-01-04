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
    name: GM
    permission: BreadVibesMC.Admin
    description: Changes your game mode. Player name is optional. If None, your gamemode will change.
    usage: /GM <&lt>gamemode<&gt> [player]
    tab completions:
        1: s|sp|a|c
        2: <server.online_players.parse[name]>
    script:
        # defines everything
        - define PLAYER <server.match_player[<context.args.get[2]>].if_null[null]>
        - define GM <context.args.get[1]>

        # if the player is not null, then decides what to do with the given parameters
        - if <[player]> != null:
            - choose <[GM]>:
                # - if args is s
                - case s:
                    - adjust <[player]> gamemode:survival
                    - narrate "Your gamemode is now <&color[#006bff]><bold>S<&color[#008fff]><bold>u<&color[#00acff]><bold>r<&color[#00c4ff]><bold>v<&color[#00d7f2]><bold>i<&color[#00e8b7]><bold>v<&color[#00f673]><bold>a<&color[#4dff00]><bold>l<reset> courtesy of <player.proc[p_nameplate]>" targets:<[player]>
                    - narrate "<[PLAYER].proc[p_nameplate_def]><&sq>s gamemode is now <&color[#006bff]><bold>S<&color[#008fff]><bold>u<&color[#00acff]><bold>r<&color[#00c4ff]><bold>v<&color[#00d7f2]><bold>i<&color[#00e8b7]><bold>v<&color[#00f673]><bold>a<&color[#4dff00]><bold>l"
                # - if args is sp
                - case sp:
                    - adjust <[player]> gamemode:spectator
                    - narrate "<[PLAYER].proc[p_nameplate_def]><&sq>s gamemode is now <&color[#006bff]><bold>S<&color[#008bff]><bold>p<&color[#00a5ff]><bold>e<&color[#00bbff]><bold>c<&color[#00ceff]><bold>t<&color[#00dedd]><bold>a<&color[#00eca7]><bold>t<&color[#00f769]><bold>o<&color[#4dff00]><bold>r"
                    - narrate "Your gamemode is now <&color[#006bff]><bold>S<&color[#008bff]><bold>p<&color[#00a5ff]><bold>e<&color[#00bbff]><bold>c<&color[#00ceff]><bold>t<&color[#00dedd]><bold>a<&color[#00eca7]><bold>t<&color[#00f769]><bold>o<&color[#4dff00]><bold>r<reset> courtesy of <player.proc[p_nameplate]>" targets:<[player]>
                # - if args is a
                - case a:
                    - adjust <[player]> gamemode:adventure
                    - narrate "<[PLAYER].proc[p_nameplate_def]><&sq>s gamemode is now <&color[#006bff]><bold>A<&color[#008bff]><bold>d<&color[#00a5ff]><bold>v<&color[#00bbff]><bold>e<&color[#00ceff]><bold>n<&color[#00dedd]><bold>t<&color[#00eca7]><bold>u<&color[#00f769]><bold>r<&color[#4dff00]><bold>e"
                    - narrate "Your gamemode is now <&color[#006bff]><bold>A<&color[#008bff]><bold>d<&color[#00a5ff]><bold>v<&color[#00bbff]><bold>e<&color[#00ceff]><bold>n<&color[#00dedd]><bold>t<&color[#00eca7]><bold>u<&color[#00f769]><bold>r<&color[#4dff00]><bold>e<reset> courtesy of <player.proc[p_nameplate]>" targets:<[player]>
                # - if args is c
                - case c:
                    - adjust <[player]> gamemode:creative
                    - narrate "Your gamemode is now <&color[#006bff]><bold>C<&color[#008fff]><bold>r<&color[#00acff]><bold>e<&color[#00c4ff]><bold>a<&color[#00d7f2]><bold>t<&color[#00e8b7]><bold>i<&color[#00f673]><bold>v<&color[#4dff00]><bold>e<reset> courtesy of <player.proc[p_nameplate]>" targets:<[player]>
                    - narrate "<[PLAYER].proc[p_nameplate_def]><&sq>s gamemode is now <&color[#006bff]><bold>C<&color[#008fff]><bold>r<&color[#00acff]><bold>e<&color[#00c4ff]><bold>a<&color[#00d7f2]><bold>t<&color[#00e8b7]><bold>i<&color[#00f673]><bold>v<&color[#4dff00]><bold>e"
            - playeffect effect:TOTEM at:<[player].location.add[0,3,0]> visibility:25 quantity:75
        # if the player is null, then effect the player who did the command
        - else:
            - choose <[GM]>:
                # - if args is s
                - case s:
                    - adjust <player> gamemode:survival
                    - narrate "Your gamemode is now <&color[#006bff]><bold>S<&color[#008fff]><bold>u<&color[#00acff]><bold>r<&color[#00c4ff]><bold>v<&color[#00d7f2]><bold>i<&color[#00e8b7]><bold>v<&color[#00f673]><bold>a<&color[#4dff00]><bold>l"
                # - if args is sp
                - case sp:
                    - adjust <player> gamemode:spectator
                    - narrate "Your gamemode is now <&color[#006bff]><bold>S<&color[#008bff]><bold>p<&color[#00a5ff]><bold>e<&color[#00bbff]><bold>c<&color[#00ceff]><bold>t<&color[#00dedd]><bold>a<&color[#00eca7]><bold>t<&color[#00f769]><bold>o<&color[#4dff00]><bold>r"
                # - if args is a
                - case a:
                    - adjust <player> gamemode:adventure
                    - narrate "Your gamemode is now <&color[#006bff]><bold>A<&color[#008bff]><bold>d<&color[#00a5ff]><bold>v<&color[#00bbff]><bold>e<&color[#00ceff]><bold>n<&color[#00dedd]><bold>t<&color[#00eca7]><bold>u<&color[#00f769]><bold>r<&color[#4dff00]><bold>e"
                # - if args is c
                - case c:
                    - adjust <player> gamemode:creative
                    - narrate "Your gamemode is now <&color[#006bff]><bold>C<&color[#008fff]><bold>r<&color[#00acff]><bold>e<&color[#00c4ff]><bold>a<&color[#00d7f2]><bold>t<&color[#00e8b7]><bold>i<&color[#00f673]><bold>v<&color[#4dff00]><bold>e"
            - playeffect effect:TOTEM at:<player.location.add[0,3,0]> visibility:25 quantity:75