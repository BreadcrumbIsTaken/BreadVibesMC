# Player Joins Server Event.
# Written by Breadcrumb
# Desc:
#   Displays a welcome message when the player joins the server.
# Determines: passively NONE
player_joins_the_server:
    type: world
    events:
        on player joins:
            # This boi right here makes sure the default join message does not appear >:)
            - determine passively NONE

            - teleport <player> LOBBY_SPAWN

            - adjust <player> gamemode:adventure

            - inventory clear
            - give game_selector_item slot:5

            # If the player has joined before, say hello!
            - if <player.has_flag[HAS_JOINED_THE_SERVER_BEFORE]>:
                - announce "<proc[p_nameplate]> has <proc[text_gradient_format].context[just joined|#79c2f3|#ffb4ef|<bold>]> the server<reset>!" format:quit_or_join_format
                - actionbar "Welcome back to <proc[text_gradient_format].context[BreadVibesMC|#ff69b8|#ffa74a|<bold>]>!" targets:<player>
            # If not, flag them, and then welcome them! ☜(ﾟヮﾟ☜)
            - else:
                - flag <player> HAS_JOINED_THE_SERVER_BEFORE

                - run assign_player_colored_nameplate

                - announce "<proc[p_nameplate]> has just joined the server for the <proc[text_gradient_format].context[VERY FIRST TIME|#79c2f3|#ffb4ef|<bold>]><reset>! Say hello!" format:quit_or_join_format
                - actionbar "Welcome to <proc[text_gradient_format].context[BreadVibesMC|#ff69b8|#ffa74a|<bold>]>!" targets:<player>
                - playeffect effect:TOTEM at:<player.location.add[0,2,0]> visibility:25 quantity:75

# Player Quits Server Event.
# Written by Breadcrumb
# Desc:
#   Displays a goodbye message when the player quits the server.
# Determines: passively NONE
player_quits_the_server:
    type: world
    events:
        on player quits:
            # This boi right here makes sure the default quit join message does not appear >:)
            - determine passively NONE
            - announce "<proc[p_nameplate]> has just left the server! Bye!" format:quit_or_join_format