# Game Selector Item
# Written by Breadcrumb
# Desc:
#   Creates the Game Selector Item
game_selector_item:
    type: item
    material: honeycomb
    enchantments:
        - luck_of_the_sea:1
    mechanisms:
        unbreakable: true
        hides: ENCHANTS
    display name: <&[pink]>Game Selector!<reset>
    lore:
        - <aqua><italic>Right click this<reset>
        - <aqua><italic>item to open a GUI<reset>
        - <aqua><italic>to pick a game!<reset>

# Prevent Player From Removing Inventory Items Event
# Written by Breadcrumb
# Desc:
#   Stops the player from removing or destroying the items in the inventory.
prevent_getting_rid_of_server_item:
    type: world
    events:
        on entity drops game_selector_item:
            - determine cancelled
        on player clicks game_selector_item in inventory:
            - determine cancelled
        on player drags game_selector_item in inventory:
            - determine cancelled

# Open Game Selector GUI
# Written by Breadcrumb
# Desc:
#   Opens the game selector GUI
open_game_selector_gui:
    type: world
    events:
        on player right clicks block with:game_selector_item:
            # This below will make sure the player does not eat the game selector.
            - determine passively cancelled
            # The "d" means destination. (Which is strange when you are opening an inventory, but oh well.)
            - inventory open d:game_selector_inventory

# Skyblock Game Item
# Written by Breadcrumb
# Desc:
#   The item used in the Game Selector for the game Skyblock.
skyblock_game_item:
    type: item
    material: player_head
    mechanisms:
        skull_skin: 15bec315-811e-433e-a685-bd1c622604f4|eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNDUyOGVkNDU4MDI0MDBmNDY1YjVjNGUzYTZiN2E5ZjJiNmE1YjNkNDc4YjZmZDg0OTI1Y2M1ZDk4ODM5MWM3ZCJ9fX0=
    display name: <&color[#00D65F]><underline>Skyblock!
    lore:
        - <aqua>You open your eyes,
        - <aqua>and you are on a small
        - <aqua>floating island. . .
        - <aqua>What adventures will
        - <aqua>come your way?

# Factions Game Item
# Written by Breadcrumb
# Desc:
#   The item used in the Game Selector for the game Factions.
factions_game_item:
    type: item
    material: player_head
    mechanisms:
        skull_skin: 1745bdf3-3d3a-4118-afeb-f6a20db18323|eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNThhYzgxNjhhZmMxMjM1YzNkOTliMzg1YzkwOTE2YjczZTEyOTAwNzQyZDU3M2Y2YWQ0ZDcxYWNkZGJmNDM2MyJ9fX0=
    display name: <&color[#8E35CA]><underline>Factions!
    lore:
        - <aqua>Build, fight and forage
        - <aqua>for items against other
        - <aqua>factions. Leave nothing
        - <aqua>unturned. . .

# To Be Determined Game Item
# Written by Breadcrumb
# Desc:
#   The item used in the Game Selector for the game that will be decided soon.
TBD_game_item:
    type: item
    material: player_head
    mechanisms:
        skull_skin: 4631cec3-bbef-485b-9ee6-7a16a7a76859|eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvODA2NDc3N2EwOWMwMGE0YTkyZWVlNzRhYmE3YzY3MmJmZWE3ZjAzODRiMjU2ODk0ZWEyNjFkNWE5MTVhZjhlZSJ9fX0=
    display name: <underline><proc[text_gradient_format].context[To Be Decided. . .|#4d87c7|#6df907|<underline>]>
    lore:
        - <aqua>This game will be
        - <aqua>decided upon soon!

# Game Selector Glass Pane Item
# Written by Breadcrumb
# Desc:
#   The placeholder glass frames on the GUI filling up the empty slots.
game_selector_glass_pane:
    type: item
    material: yellow_stained_glass_pane
    display name: ☺

# Game Selector GUI
# Written by Breadcrumb
# Desc:
#   The Game Selector GUI
game_selector_inventory:
    type: inventory
    inventory: CHEST
    title: <&[pink]>Game Selector!<reset>
    gui: true
    procedural items:
        # This will add the game_selector_glass_pane in all empty slots
        - define itms <list[]>
        - repeat 25:
            - define itms:->:game_selector_glass_pane
        - determine <[itms]>
    slots:
        - [] [] [] [] [] [] [] [] []
        - [] [] [factions_game_item] [] [skyblock_game_item] [] [TBD_game_item] [] []
        - [] [] [] [] [] [] [] [] []

# Teleport to Factions Event
# Written by Breadcrumb
# Desc:
#   Teleports the player to the factions bugee server.
teleport_to_factions:
    type: world
    events:
        on player clicks factions_game_item in game_selector_inventory:
            - adjust <player> send_to:factions