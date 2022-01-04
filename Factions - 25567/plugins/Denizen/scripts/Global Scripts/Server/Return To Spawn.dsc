# Return to Spawn Command
# Written by Breadcrumb
# Desc:
#   Teleports the player to the lobby spawn.
return_to_spawn_command:
    type: command
    usage: /spawn
    name: spawn
    description: Will teleport you back to the spawn.
    script:
        - teleport <player> LOBBY_SPAWN