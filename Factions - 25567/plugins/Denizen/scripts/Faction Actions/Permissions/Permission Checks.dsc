# To be injected by events to determine permission checks.
permission_checks:
    type: task
    debug: false
    script:
        - if <player> == <server.flag[factions.<[faction]>.owner]>:
            - if <[permission]> in <server.flag[factions.<[faction]>.settings.permissions.owners]>:
                - stop
        - else if <player> in <server.flag[factions.<[faction]>.members]>:
            - if <[permission]> in <server.flag[factions.<[faction]>.settings.permissions.members]>:
                - stop
        - else if <[permission]> in <server.flag[factions.<[faction]>.settings.permissions.outsiders]>:
                - stop

        - determine passively cancelled
        - ratelimit <player> 5s

# All permission check events and determinations.
claim_permission_checks:
    type: world
    debug: false
    events:
        # Uses claim entering logic to determine whether or not to allow the player to fly.
        after player enters faction_*_claim_*:
            - define claim <context.area>
            - define faction <[claim].note_name.proc[get_faction_name_from_note_name]>
            - define entering_from <context.from.chunk.cuboid>
            - define entering_from_faction <[entering_from].proc[get_faction_name_from_cuboid]||null>

            - if <player.flag[is_in_wilderness]||false> || <[entering_from_faction]> != <player.flag[faction]> || <[faction]> != <player.flag[faction]>:
                - if <player> == <server.flag[factions.<[faction]>.owner]>:
                    - if fly !in <server.flag[factions.<[faction]>.settings.permissions.owners]>:
                        - stop
                - else if <player> in <server.flag[factions.<[faction]>.members]>:
                    - if fly !in <server.flag[factions.<[faction]>.settings.permissions.members]>:
                        - stop
                - else:
                    - if fly !in <server.flag[factions.<[faction]>.settings.permissions.outsiders]>:
                        - stop

                - adjust <player> can_fly:true
            - else:
                - stop
        after player exits faction_*_claim_*:
            # Make sure the player can still fly if in creative or spectator.
            - if <player.gamemode> !in creative|spectator:
                - adjust <player> can_fly:false
        on player breaks block in:faction_*_claim_*:
            - define faction <context.location.chunk.cuboid.proc[get_faction_name_from_cuboid]>
            - define permission break_blocks
            - inject permission_checks

            - narrate "Hey! You aren't allowed to break blocks in this faction!" format:faction_action_error_format
        on player places block in:faction_*_claim_*:
            - define faction <context.location.chunk.cuboid.proc[get_faction_name_from_cuboid]>
            # --- Detect dirt turning into farmland from hoe ---
            - if <context.material> matches farmland && <context.item_in_hand> matches *hoe:
                - define permission till_dirt
                - inject permission_checks

                - narrate "Hey! You aren't allowed to till dirt in this faction!" format:faction_action_error_format
            # --- Every other block ---
            - else:
                - define permission place_blocks
                - inject permission_checks

                - narrate "Hey! You aren't allowed to place blocks in this faction!" format:faction_action_error_format
        on player enters vehicle in:faction_*_claim_*:
            - define faction <context.vehicle.location.chunk.cuboid.proc[get_faction_name_from_cuboid]>
            - define permission enter_vehicles
            - inject permission_checks

            - narrate "Hey! You aren't allowed to enter vehicles in this faction!" format:faction_action_error_format
        on player right clicks block type:*chest in:faction_*_claim_*:
            - ratelimit <player> 1t
            - define faction <context.location.chunk.cuboid.proc[get_faction_name_from_cuboid]>
            - define permission open_chests
            - inject permission_checks

            - narrate "Hey! You aren't allowed to open chests in this faction!" format:faction_action_error_format
        on player clicks item in inventory in:faction_*_claim_* action:PICKUP*:
            - if <context.clicked_inventory> == <player.inventory> || <context.slot_type> == OUTSIDE:
                - stop
            - define faction <context.inventory.id_holder.chunk.cuboid.proc[get_faction_name_from_cuboid]||null>
            - if <[faction]> == null:
                - stop
            - define material <context.inventory.id_holder.material||null>
            - if <[material]> == null:
                - stop
            - if <[material]> matches *chest:
                - define permission remove_chest_items
                - inject permission_checks

                - narrate "Hey! You aren't allowed to remove items from chests in this faction!" format:faction_action_error_format
        on player drags item in inventory in:faction_*_claim_*:
            - define slot_type <context.slot_type||null>
            - if <[slot_type]> == null:
                - stop
            - if <context.clicked_inventory> == <player.inventory> || <context.slot_type> == OUTSIDE:
                - stop
            - define faction <context.inventory.id_holder.chunk.cuboid.proc[get_faction_name_from_cuboid]||null>
            - if <[faction]> == null:
                - stop
            - define material <context.inventory.id_holder.material||null>
            - if <[material]> == null:
                - stop
            - if <[material]> matches *chest:
                - define permission remove_chest_items
                - inject permission_checks

                - narrate "Hey! You aren't allowed to remove items from chests in this faction!" format:faction_action_error_format
        on player clicks item in inventory in:faction_*_claim_* action:PLACE*:
            - if <context.clicked_inventory> == <player.inventory> || <context.slot_type> == OUTSIDE:
                - stop
            - define faction <context.inventory.id_holder.chunk.cuboid.proc[get_faction_name_from_cuboid]||null>
            - if <[faction]> == null:
                - stop
            - define material <context.inventory.id_holder.material||null>
            - if <[material]> == null:
                - stop
            - if <[material]> matches *chest:
                - define permission place_chest_items
                - inject permission_checks

                - narrate "Hey! You aren't allowed to place items into chests in this faction!" format:faction_action_error_format
        on player changes farmland into dirt in:faction_*_claim_*:
            - define faction <context.location.chunk.cuboid.proc[get_faction_name_from_cuboid]>
            - define permission destroy_crops
            - inject permission_checks

            - narrate "Hey! You aren't allowed to destroy crops in this faction!" format:faction_action_error_format
        on entity drops item:
            - if !<context.location.is_in[faction_*_claim_*]>:
                - stop
            - flag <context.entity> dropped_by:<context.dropped_by>
        # --- To flag the dropped item entites when the entity dies. Death is not caught by 'on entity drops item'
        on entity dies in:faction_*_claim_*:
            - define drops <context.drops>
            - define xp <context.xp>
            - determine passively NO_DROPS
            - determine passively NO_XP
            - drop <[drops]> <context.entity.location> save:dropped
            - foreach <entry[dropped].dropped_entities> as:drop:
                - flag <[drop]> dropped_by:<context.entity>
            - drop xp quantity:<[xp]> <context.entity.location>
        on player picks up item:
            - define faction <context.location.chunk.cuboid.proc[get_faction_name_from_cuboid]||null>
            - if <[faction]> == null:
                - stop
            - define item <context.entity>
            - if <[item].flag[dropped_by]> == <player>:
                - stop

            - if <[item].flag[dropped_by].is_player>:
                - define permission pick_up_players_items
                - inject permission_checks

                - narrate "Hey! You aren't allowed to pick up other players' items in this faction!" format:faction_action_error_format
            - else:
                - define permission pick_up_entity_items
                - inject permission_checks

                - narrate "Hey! You aren't allowed to pick up an entity's items in this faction!" format:faction_action_error_format
        on player picks up launched arrow:
            - define faction <context.arrow.location.chunk.cuboid.proc[get_faction_name_from_cuboid]||null>
            - if <[faction]> == null:
                - stop
            - define permission pick_up_launched_arrows
            - inject permission_checks

            - narrate "Hey! You aren't allowed to pick up arrows in this faction!" format:faction_action_error_format
        on entity damaged by player in:faction_*_claim_*:
            - define faction <context.entity.location.chunk.cuboid.proc[get_faction_name_from_cuboid]>
            - define permission hurt_entities
            - inject permission_checks

            - narrate "Hey! You aren't allowed to hurt entities in this faction!" format:faction_action_error_format
        on entity killed by player in:faction_*_claim_*:
            - define faction <context.entity.location.chunk.cuboid.proc[get_faction_name_from_cuboid]>
            - define permission kill_entities
            - inject permission_checks

            - narrate "Hey! You aren't allowed to hurt entities in this faction!" format:faction_action_error_format
        on player crafts item:
            - define faction <context.inventory.id_holder.location.chunk.cuboid.proc[get_faction_name_from_cuboid]||null>
            - if <[faction]> == null:
                - stop
            - define permission craft_items
            - inject permission_checks

            - narrate "Hey! You aren't allowed to craft items in this faction!" format:faction_action_error_format
        on player empties bucket in:faction_*_claim_*:
            - define faction <context.location.chunk.cuboid.proc[get_faction_name_from_cuboid]>
            - define permission empty_buckets
            - inject permission_checks

            - narrate "Hey! You aren't allowed to empty buckets in this faction!" format:faction_action_error_format
        on player fills bucket in:faction_*_claim_*:
            - define faction <context.location.chunk.cuboid.proc[get_faction_name_from_cuboid]>
            - define permission fill_buckets
            - inject permission_checks

            - narrate "Hey! You aren't allowed to fill buckets in this faction!" format:faction_action_error_format
        on player enters bed in:faction_*_claim_*:
            - define faction <context.location.chunk.cuboid.proc[get_faction_name_from_cuboid]>
            - define permission enter_beds
            - inject permission_checks

            - narrate "Hey! You aren't allowed to enter beds in this faction!" format:faction_action_error_format
        on player fishes in:faction_*_claim_*:
            - define faction <player.location.chunk.cuboid.proc[get_faction_name_from_cuboid]>
            - define permission fish
            - inject permission_checks

            - narrate "Hey! You aren't allowed to fish in this faction!" format:faction_action_error_format
        on player leashes entity in:faction_*_claim_*:
            - define faction <context.entity.location.chunk.cuboid.proc[get_faction_name_from_cuboid]>
            - define permission leash_entities
            - inject permission_checks

            - narrate "Hey! You aren't allowed to leash entities in this faction!" format:faction_action_error_format
        on player shears entity in:faction_*_claim_*:
            - define faction <context.entity.location.chunk.cuboid.proc[get_faction_name_from_cuboid]>
            - define permission shear_entities
            - inject permission_checks

            - narrate "Hey! You aren't allowed to shear entities in this faction!" format:faction_action_error_format
        on player smiths item:
            - define faction <context.inventory.viewers.get[1].location.chunk.cuboid.proc[get_faction_name_from_cuboid]||null>
            - if <[faction]> == null:
                - stop
            - define permission smith_items
            - inject permission_checks

            - narrate "Hey! You aren't allowed to smith items in this faction!" format:faction_action_error_format
        on player takes item from furnace in:faction_*_claim_*:
            - define faction <context.location.chunk.cuboid.proc[get_faction_name_from_cuboid]>
            - define permission take_item_from_furnace
            - inject permission_checks

            - narrate "Hey! You aren't allowed to take items from furnaces in this faction!" format:faction_action_error_format
        on player takes item from lectern in:faction_*_claim_*:
            - define faction <context.location.chunk.cuboid.proc[get_faction_name_from_cuboid]>
            - define permission take_item_from_lecturn
            - inject permission_checks

            - narrate "Hey! You aren't allowed to take items from lecturns in this faction!" format:faction_action_error_format
        on player places hanging in:faction_*_claim_*:
            - define faction <context.location.chunk.cuboid.proc[get_faction_name_from_cuboid]>
            - define permission place_hanging
            - inject permission_checks

            - narrate "Hey! You aren't allowed to place hanging items in this faction!" format:faction_action_error_format
        on player throws egg in:faction_*_claim_*:
            - define faction <context.egg.location.chunk.cuboid.proc[get_faction_name_from_cuboid]>
            - define permission throw_eggs
            - inject permission_checks

            - narrate "Hey! You aren't allowed to throw eggs in this faction!" format:faction_action_error_format
        on player teleports cause:ENDER_PEARL|CHORUS_FRUIT|NETHER_PORTAL:
            - define faction <context.destination.chunk.cuboid.proc[get_faction_name_from_cuboid]||null>
            - if <[faction]> == null:
                - stop
            - define permission teleport_into
            - inject permission_checks

            - narrate "Hey! You aren't allowed to teleport in this faction!" format:faction_action_error_format
        on player uses portal in:faction_*_claim_*:
            - define faction <context.from.chunk.cuboid.proc[get_faction_name_from_cuboid]>
            - define permission use_portals
            - inject permission_checks
            - determine CAN_CREATE:false passively

            - narrate "Hey! You aren't allowed to use portals in this faction!" format:faction_action_error_format
        on item enchanted in:faction_*_claim_*:
            - define faction <context.location.chunk.cuboid.proc[get_faction_name_from_cuboid]>
            - define permission enchant_items
            - inject permission_checks

            - narrate "Hey! You aren't allowed to enchant items in this faction!" format:faction_action_error_format
        on player right clicks block type:anvil:
            - ratelimit <player> 1t
            - define faction <context.location.chunk.cuboid.proc[get_faction_name_from_cuboid]>
            - define permission use_anvil
            - inject permission_checks

            - narrate "Hey! You aren't allowed to use anvils in this faction!" format:faction_action_error_format
