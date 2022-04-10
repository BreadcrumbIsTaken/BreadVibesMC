# Displays a welcome message when a player joins the server.
player_joins_the_server:
    type: world
    events:
        on player joins:
            # This boi right here makes sure the default join message does not appear >:)
            - determine passively NONE

            - adjust <player> gamemode:survival

            - announce "<proc[p_nameplate]> has <proc[text_gradient_format].context[just joined|#79c2f3|#ffb4ef|<bold>]> the server<reset>!" format:quit_or_join_format
            - actionbar "Welcome back to <proc[text_gradient_format].context[BreadVibesMC|#ff69b8|#ffa74a|<bold>]>!" targets:<player>

# Displays a goodbye message when a player leaves the server.
player_quits_the_server:
    type: world
    events:
        on player quits:
            # This boi right here makes sure the default quit join message does not appear >:)
            - determine passively NONE
            - announce "<proc[p_nameplate]> has just left the server! Bye!" format:quit_or_join_format
