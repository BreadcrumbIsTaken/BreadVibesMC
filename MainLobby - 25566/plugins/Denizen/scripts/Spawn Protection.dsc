# Prevent Players From Breaking Blocks in Spawn Event
# Written by Breadcrumb
# Desc:
#   Stops the player from breaking blocks in spawn.
prevent_players_from_breaking_blocks_in_spawn:
    type: world
    events:
        on player breaks block:
            - if !<player.is_op>:
                - determine passively cancelled
                - ratelimit <player> 5s
                - narrate "<red>Hey <white><bold><proc[p_nameplate]><red>, you can't break blocks here!"
        on player places block:
            - if !<player.is_op>:
                - determine passively cancelled
                - ratelimit <player> 5s
                - narrate "<red>Hey <white><bold><proc[p_nameplate]><red>, you can't place blocks here!"
        after player interacts with lever:
            - determine cancelled