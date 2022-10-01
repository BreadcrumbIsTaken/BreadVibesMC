# Inventory GUI to change the environment of the faction.
change_environment_settings_inventory:
    type: inventory
    debug: false
    inventory: chest
    title: <&color[#1569EA]>Change Faction Environment
    gui: true
    procedural items:
        - determine <item[filler].repeat_as_list[9]>
    slots:
        - [] [] [] [change_weather_item] [change_biome_item] [change_time_item] [] [] []

# Inventory GUI to change the weather of the faction.
change_environment_weather_inventory:
    type: inventory
    debug: false
    inventory: chest
    title: <&color[#1569EA]>Change Faction <aqua><underline>Weather
    gui: true
    procedural items:
        - determine <item[filler].repeat_as_list[18]>
    slots:
        - [] [] [] [sunny_weather_item] [thunder_weather_item] [storm_weather_item] [] [] []
        - [] [] [] [] [auto_weather_item] [] [] [] []

# Inventory GUI to change the biome of the faction.
change_environment_biome_inventory:
    type: inventory
    debug: false
    inventory: chest
    title: <&color[#1569EA]>Change Faction <dark_green><underline>Biome
    gui: true
    procedural items:
        - determine <item[filler].repeat_as_list[18]>
    slots:
        # Lots of biomes to choose from, so just putting down common ones.
        - [plains_biome_item] [savanna_biome_item] [desert_biome_item] [taiga_biome_item] [jungle_biome_item] [beach_biome_item] [mushroom_fields_biome_item] [snowy_slopes_biome_item] [badlands_biome_item]
        - [] [] [] [] [auto_biome_item] [] [] [] []

# Inventory GUI to change the time of the faction.
change_environment_time_inventory:
    type: inventory
    debug: false
    inventory: chest
    title: <&color[#1569EA]>Change Faction <dark_red><underline>Time
    gui: true
    procedural items:
        - determine <item[filler].repeat_as_list[18]>
    slots:
        - [] [dawn_time_item] [sunrise_time_item] [noon_time_item] [sunset_time_item] [dusk_time_item] [midnight_time_item] [custom_time_item] []
        - [] [] [] [] [auto_time_item] [] [] [] []
