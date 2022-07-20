# Format Player Chat
# Desc:
#   Formats the player's chat name. Example:
#   Steve: yo
format_player_chat:
    type: format
    debug: false
    format: <proc[p_nameplate]><&co> <[text]>

# Display Chat Prefix in Tab List Event
# Desc:
#   Used apademide's dTab script as reference
#   Updates the tab list whenever a player joins, quits, or every 5 seconds delta time.
display_chat_prefix_in_tab_list:
    type: world
    debug: false
    events:
        after player joins:
            - run update_tab_list
        after player quits:
            - run update_tab_list
        after delta time secondly every:5:
            - run update_tab_list

# Update Tab List Script
# Desc:
#   Updates the tab list if the server is not empty.
update_tab_list:
    type: task
    debug: false
    script:
        - if !<server.online_players.is_empty>:
            - foreach <server.online_players> as:player:
                - adjust <[player]> player_list_name:<[player].proc[p_nameplate_def]>

# Player Chats Format Prefix Event
# Desc:
#   When the player chats, format it with the prefix.
# Determines: The formated chat.
player_chats_format_prefix:
    type: world
    debug: false
    events:
        on player chats:
            - determine FORMAT:format_player_chat

# Player Nameplate Procedure
# Desc:
#   Returns the player's nameplate with the prefix.
# Determines: Player's nameplate.
p_nameplate:
    type: procedure
    debug: false
    script:
        - determine <player.chat_prefix><player.name><reset>

# Player Nameplate Definiton Procedure
# Desc:
#   Same as p_nameplate, but you can pass a player as a defintion.
# Args(1):
#   PLAYER: PlayerTag - The player whose nameplate you want to grab.
# Determines: Player's nameplate.
p_nameplate_def:
    type: procedure
    debug: false
    definitions: PLAYER
    script:
        - determine <[PLAYER].chat_prefix><[PLAYER].name><reset>
