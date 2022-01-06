# Player Chooses Heir
# Written by Breadcrumb (on stream!!!)
# Description:
#   Handle getting the selected player to transfer the ownership to.
player_chooses_heir:
    type: world
    events:
        on player clicks item in faction_action_danger_zone_transfer_ownership_player_list_inventory:
            - define new_owner <context.item.flag[player_id]>

            - if !<player.has_flag[has_ownership_offer]>:
                - if <[new_owner].has_flag[faction]>:
                    - define faction <proc[get_player_faction].context[<[new_owner]>]>

                    - define faction_owner <player[<proc[get_owner].context[<[faction]>]>]>

                    - if <[new_owner].uuid> == <[faction_owner].uuid>:
                        - narrate "<[new_owner].name> is already an owner of a faction."
                        - inventory close
                    - else:
                        - flag player waiting_for_owner_transfer_request_acceptance:<[new_owner]> expire:3m
                        - inventory close
                - else:
                    - flag player waiting_for_owner_transfer_request_acceptance:<[new_owner]> expire:3m
                    - inventory close

                    - flag <[new_owner]> has_ownership_offer:<[faction]> expire:3m
                    - narrate targets:<[new_owner]> "<green><player.name>, want you to become the new owner of their faction<reset>: <proc[get_display_name].context[<player.flag[faction]>]>. <green>To accept, please issue the command<reset>: <yellow>accept<reset>. <green>To deny, please issue the command<reset>: <yellow>deny <green>or, do nothing. This request will expire in 3 minutes."
            - else:
                - narrate "<[new_owner].name> already has a valid offer. Please try again soon."

player_accepts_or_denies_offer_to_be_new_owner:
    type: world
    events:
        on player chats flagged:has_ownership_offer:
            - if <context.message> == accept:
                - determine passively cancelled
                - narrate woo!
            - else if <context.messate> == deny:
                - determine passively cancelled
                - narrate oof
            - else:
                - determine cancelled