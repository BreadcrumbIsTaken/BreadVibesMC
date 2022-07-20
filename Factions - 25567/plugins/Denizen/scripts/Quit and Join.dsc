# Displays a welcome message when a player joins the server.
player_joins_the_server:
    type: world
    debug: false
    events:
        on player joins:
            # This boi right here makes sure the default join message does not appear >:)
            - determine passively NONE

            - adjust <player> gamemode:survival

            - announce "<proc[p_nameplate]> has <&gradient[from=#79c2f3;to=#ffb4ef]><bold>just joined <reset>the server!" format:quit_or_join_format
            - actionbar "Welcome back to <&gradient[from=#ff69b8;to=#ffa74a]><bold>BreadVibesMC<reset>!" targets:<player>

# Displays a goodbye message when a player leaves the server.
player_quits_the_server:
    type: world
    debug: false
    events:
        on player quits:
            # This boi right here makes sure the default quit join message does not appear >:)
            - determine passively NONE
            - announce "<proc[p_nameplate]> has just left the server! Bye!" format:quit_or_join_format
