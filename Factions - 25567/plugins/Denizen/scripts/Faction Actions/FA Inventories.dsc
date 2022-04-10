# Main Faction Action Inventory.
faction_action_default_inventory:
    type: inventory
    inventory: chest
    gui: true
    title: <&color[#1569EA]>Faction Actions
    debug: false
    procedural items:
        - determine <item[filler].repeat_as_list[54]>
    slots:
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [faction_action_faction_name_item] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [faction_action_invite_players_item] [] [faction_action_claim_more_land_item] [] [faction_action_settings_item] [] []
        - [faction_action_danger_zone_item] [] [] [] [] [] [] [] []

# Inventory that appears when the player is not in a faction.
faction_action_player_not_in_any_faction_inventory:
    type: inventory
    inventory: chest
    gui: true
    title: <&color[#1569EA]>Faction Actions
    debug: false
    procedural items:
        - determine <item[filler].repeat_as_list[54]>
    slots:
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [faction_action_not_in_any_faction_item] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [faction_action_create_new_faction_item] [] [] [] [faction_action_join_new_faction_item] [] []
        - [] [] [] [] [] [] [] [] []

# Inventory that appears when the player is not an owner of a faction.
faction_action_player_not_owner_inventory:
    type: inventory
    inventory: chest
    gui: true
    title: <&color[#1569EA]>Faction Actions
    procedural items:
        - determine <item[filler].repeat_as_list[54]>
    slots:
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [faction_action_faction_name_item] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
        - [] [] [] [] [] [] [] [] []
