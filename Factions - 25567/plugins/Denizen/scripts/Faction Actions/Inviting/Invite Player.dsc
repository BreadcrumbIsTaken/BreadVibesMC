# Player invitation logic
invite_player_message:
    type: task
    debug: false
    definitions: invited_player
    script:
        - if <[invited_player]> in <player.flag[faction].proc[get_members]>:
            - narrate "<[invited_player].name> is already in your faction!" format:faction_action_error_format
            - stop
        - if <[invited_player].has_flag[invitation_cooldown]>:
            - narrate "Sorry, but you must wait <[invited_player].flag_expiration[invitation_cooldown].from_now.formatted> to invite this player again." format:faction_action_error_format
        - else:
            - if <[invited_player].has_flag[has_invitation_request]>:
                - narrate "Sorry, but <[invited_player].name> already has an invitation request. Please try again later."
            - else:
                - flag <[invited_player]> has_invitation_request expire:2m
                - narrate "Invited <[invited_player].name> to your faction. They have 2 minutes to accept or decline." format:faction_action_format
                - narrate "<player.name> <yellow>has invited you to join their faction! You have 2 minutes to accept or deny the invitation!" targets:<[invited_player]> format:faction_action_format

                - clickable accept_invitation def:<[invited_player]>|<player> for:<[invited_player]> until:2m save:accept_invitation_clickable
                - clickable decline_invitation def:<[invited_player]>|<player> for:<[invited_player]> until:2m save:decline_invitation_clickable

                - flag <[invited_player]> inviting_player_runlater:invite_player_runlater_<[invited_player].uuid>
                - runlater notify_invitation_request_expired delay:2m id:invite_player_runlater_<[invited_player].uuid> def:<[invited_player]>|<player>


                - narrate "Click <green><underline><element[here ✔].on_click[<entry[accept_invitation_clickable].command>].on_hover[Accept invitation]><reset> to accept, or <red><underline><element[here ❌].on_click[<entry[decline_invitation_clickable].command>].on_hover[Decline invitation.]><reset> to decline." targets:<[invited_player]> format:faction_action_format

# Player accepts invitation
accept_invitation:
    type: task
    debug: false
    definitions: invited_player|player_inviting
    script:
        - adjust system cancel_runlater:<[invited_player].flag[inviting_player_runlater]>
        - flag <[invited_player]> inviting_player_runlater:!
        - flag <[invited_player]> has_invitation_request:!

        - if <[invited_player].has_flag[faction]>:
            - flag server factions.<[invited_player].flag[faction]>.members:<-:<[invited_player]>
            - flag <[invited_player]> faction:!

        - flag server factions.<[player_inviting].flag[faction]>.members:->:<[invited_player]>
        - flag <[invited_player]> faction:<[player_inviting].flag[faction]>

        - narrate "You are now apart of <[player_inviting].name>'s faction: <[player_inviting].flag[faction].proc[get_display_name]>!" format:faction_action_format targets:<[invited_player]>
        - narrate "<[invited_player].name> has accepted your invitation request! They are now apart of your faction." format:faction_action_format targets:<[player_inviting]>

# Player declines invitation
decline_invitation:
    type: task
    debug: false
    definitions: invited_player|player_inviting
    script:
        - adjust system cancel_runlater:<[invited_player].flag[inviting_player_runlater]>
        - flag <[invited_player]> inviting_player_runlater:!

        - flag <[invited_player]> has_invitation_request:!
        - flag <[invited_player]> invitation_cooldown expire:3m
        - narrate "You declined the invitation request." targets:<[invited_player]> format:faction_action_format
        - narrate "<[invited_player].name> declined your invitation request." targets:<[player_inviting]> format:faction_action_format

# Notifies players that invitation has expired
notify_invitation_request_expired:
    type: task
    debug: false
    definitions: invited_player|player_inviting
    script:
        - flag <[invited_player]> has_invitation_request:!
        - flag <player> inviting_player_runlater:!
        - narrate "Your invitation request timed out." format:faction_action_error_format targets:<[invited_player]>
        - narrate "Your invitation timed out." format:faction_action_format targets:<[player_inviting]>
