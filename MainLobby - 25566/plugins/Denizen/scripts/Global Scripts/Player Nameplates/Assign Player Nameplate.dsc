# Chose Player's Nameplate and Set Script
# Desc:
#   Chooses a random color, and sets the player to the group chosen, letting the chat and nameplates have color in them.
choose_players_nameplate_and_set:
    type: task
    debug: false
    script:
        - random:
            - define colored_nameplate dark_red
            - define colored_nameplate red
            - define colored_nameplate gold
            - define colored_nameplate yellow
            - define colored_nameplate dark_green
            - define colored_nameplate green
            - define colored_nameplate aqua
            - define colored_nameplate dark_aqua
            - define colored_nameplate dark_blue
            - define colored_nameplate blue
            - define colored_nameplate light_purple
            - define colored_nameplate dark_purple
            - define colored_nameplate gray

        - group set <[colored_nameplate]>
        - team name:<[colored_nameplate]> add:<player.name>

# Assign Player Colored Nameplate Script
# Desc:
#   Assigns the player to a random nameplate color. If the group is a special group like owner, than don't assign the player a random nameplate.
assign_player_colored_nameplate:
    type: task
    debug: false
    script:
        - if !<player.in_group[owner]> || !<player.in_group[admin]> || !<player.in_group[dev]>:
            - run choose_players_nameplate_and_set
