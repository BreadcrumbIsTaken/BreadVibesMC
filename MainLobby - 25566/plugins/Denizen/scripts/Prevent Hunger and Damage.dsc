# Prevent Players from Getting Hurt Event
# Written by Breadcrumb
# Desc:
#   Prevents the player from getting hurt in the Lobby.
# Determines: cancelled
prevent_players_from_getting_hurt:
    type: world
    debug: false
    events:
        on player damaged:
            - determine cancelled

# Prevent Players from Getting Hungry Event
# Written by Breadcrumb
# Desc:
#   Prevents the player from getting hungry in the Lobby.
# Determines: cancelled
prevent_players_from_getting_hungry:
    type: world
    debug: false
    events:
        on player changes food level:
            - determine cancelled