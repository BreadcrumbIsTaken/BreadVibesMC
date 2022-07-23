# Command to remember the player's gamemode
remember_gamemode_command:
    type: command
    name: remgm
    debug: false
    description: Remember the gamemode that you are in and have it be applied when you rejoin the game. Works for this server only. The 'persist' flag will remember your choice/changes throughout servers, i.e. lobby, factions, etc.
    usage: /remgm [toggle|true|false] (persist)
    permission: breadvibesmc.admin.remember_gamemode
    aliases:
        - remembergamemode
    tab completions:
        1: toggle|true|false
        2: persist
    script:
        - define action <context.args.get[1]||null>
        - if <[action]> == null:
            - narrate "Missing argument! See <element[<underline>/help].on_click[/help <context.alias>].on_hover[Click to display help message for this command.]> for usage information." format:command_error_format

        - define persist <context.args.get[2]||null>

        - choose <[action]>:
            - case true:
                - flag <player> remember_gamemode:<player.gamemode>
                - if <[persist]> != null:
                    - bungeerun <bungee.list_servers> remember_gamemode_bungeerun_task def:<[persist]>
                - narrate "Gamemode, <&gradient[from=#006bff;to=#4dff00]><bold><player.gamemode><reset>, will <underline>now<reset> be remembered for this server." format:command_success_format
            - case false:
                - flag <player> remember_gamemode:!
                - bungeerun <bungee.list_servers> remember_gamemode_bungeerun_task def:<[persist]>
                - narrate "Gamemode, <&gradient[from=#006bff;to=#4dff00]><bold><player.gamemode><reset>, will <underline>no longer<reset> be remembered for this server." format:command_success_format
            - case toggle:
                - if <player.has_flag[remember_gamemode]>:
                    - flag <player> remember_gamemode:!
                    - bungeerun <bungee.list_servers> remember_gamemode_bungeerun_task def:<[persist]>
                    - narrate "Gamemode, <&gradient[from=#006bff;to=#4dff00]><bold><player.gamemode><reset>, will <underline>no longer<reset> be remembered for this server." format:command_success_format
                - else:
                    - flag <player> remember_gamemode:<player.gamemode>
                    - if <[persist]> != null:
                        - bungeerun <bungee.list_servers> remember_gamemode_bungeerun_task def:<[persist]>
                    - narrate "Gamemode, <&gradient[from=#006bff;to=#4dff00]><bold><player.gamemode><reset>, will <underline>now<reset> be remembered for this server." format:command_success_format

        - if <[persist]> != null:
            - bungeerun <bungee.list_servers> remember_gamemode_bungeerun_task def:<[persist]>

# Apply the remembered gamemode
apply_remembered_gamemode:
    type: world
    debug: false
    events:
        after player joins flagged:remember_gamemode:
            - adjust <player> gamemode:<player.flag[remember_gamemode]>

# Bungeerun task
remember_gamemode_bungeerun_task:
    type: task
    definitions: persist
    debug: false
    script:
        - define player_data <player.flag_map[remember_gamemode]>
        - flag <player> __raw:<[player_data]>
