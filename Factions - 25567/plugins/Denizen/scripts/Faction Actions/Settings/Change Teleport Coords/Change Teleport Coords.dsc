# TODO: Protect the teleport area after player sets the coordinates. Maybe save the cuboid and listen for place events?
# TODO: Let non-faction members teleport to other factions.

# Get teleport coordinate selection setup
select_teleport_coords:
    type: task
    debug: false
    script:
        - if !<player.has_flag[selecting_teleport_coords]>:
            - define id player_select_teleport_coords_<player.uuid>

            - flag <player> teleport_coords_runlater:<[id]>
            - runlater notify_teleport_coords_experation delay:3m id:<[id]>
            - flag <player> selecting_teleport_coords expire:3m

            - narrate "Go to the place you want to set the coordinates. Must have no solid blocks within a 3 block radius. Type in chat: 'set' within 3 minutes to set new teleport coordinates, or 'cancel' to cancel the selection." format:faction_action_format
        - else:
            - narrate "You are already setting the teleport coordinates!" format:faction_action_error_format

# Check the teleport coordinates
select_teleport_coords_chat:
    type: world
    debug: false
    events:
        on player chats flagged:selecting_teleport_coords:
            - determine passively cancelled

            - if <context.message.to_lowercase> == set:
                - foreach <player.flag[faction].proc[get_claims]> as:claim:
                    - if !<player.location.is_within[<[claim]>]>:
                        - narrate "The teleport coordinates MUST be within your own claim(s)." format:faction_action_error_format
                        - adjust system cancel_runlater:<player.flag[teleport_coords_runlater]>
                        - flag <player> teleport_coords_runlater:!
                        - flag <player> selecting_teleport_coords:!
                        - stop

                - define x1 <player.location.x.add[3]>
                - define y1 <player.location.y.add[3]>
                - define z1 <player.location.z.add[3]>
                - define x2 <player.location.x.sub[3]>
                - define y2 <player.location.y>
                - define z2 <player.location.z.sub[3]>

                - define radius <cuboid[world,<[x1]>,<[y1]>,<[z1]>,<[x2]>,<[y2]>,<[z2]>]>

                - foreach <[radius].blocks> as:block:
                    - if <[block].material.is_solid>:
                        - narrate "Error! Teleport coordinates must have no solid blocks within a 3 block radius!" format:faction_action_error_format
                        - flag <player> selecting_teleport_coords:!
                        - stop

                - define coords <player.location.with_pose[<player>]>
                - run change_faction_setting def.faction:<player.flag[faction]> def.setting:settings.teleport_coords def.value:<[coords]>

                - adjust system cancel_runlater:<player.flag[teleport_coords_runlater]>
                - flag <player> teleport_coords_runlater:!
                - flag <player> selecting_teleport_coords:!
                - narrate "Changed teleport coordinates!" format:faction_action_format
            - else if <context.message.to_lowercase> == cancel:
                - adjust system cancel_runlater:<player.flag[teleport_coords_runlater]>
                - flag <player> teleport_coords_runlater:!
                - flag <player> selecting_teleport_coords:!
                - narrate Canceled! format:faction_action_format
            - else:
                - narrate "You cannot chat now. You are currently selecting teleport coordinates for your faction. To cancel, type 'cancel' in the chat."

# When the flag expires, notify the player.
notify_teleport_coords_experation:
    type: task
    debug: false
    script:
        - narrate "Oops! Looks like you took too long to select your faction's teleport coordinates! Setting time has expired." format:faction_action_error_format
        - flag <player> teleport_coords_runlater:!
