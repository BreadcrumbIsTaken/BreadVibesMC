# Click events for changing faction environment.
change_environment_click_events:
    type: world
    debug: false
    events:
        on player clicks change_weather_item in change_environment_settings_inventory:
            - inventory open d:change_environment_weather_inventory
        on player clicks change_biome_item in change_environment_settings_inventory:
            - inventory open d:change_environment_biome_inventory
        on player clicks change_time_item in change_environment_settings_inventory:
            - inventory open d:change_environment_time_inventory
        # Change weather
        on player clicks sunny_weather_item in change_environment_weather_inventory:
            - inventory close
            - flag server factions.<player.flag[faction]>.settings.environment.weather:sunny
            - run change_faction_weather def.faction:<player.flag[faction]>
        on player clicks thunder_weather_item in change_environment_weather_inventory:
            - inventory close
            - flag server factions.<player.flag[faction]>.settings.environment.weather:thunder
            - run change_faction_weather def.faction:<player.flag[faction]>
        on player clicks storm_weather_item in change_environment_weather_inventory:
            - inventory close
            - flag server factions.<player.flag[faction]>.settings.environment.weather:storm
            - run change_faction_weather def.faction:<player.flag[faction]>
        on player clicks auto_weather_item in change_environment_weather_inventory:
            - inventory close
            - flag server factions.<player.flag[faction]>.settings.environment.weather:auto
            - run change_faction_weather def.faction:<player.flag[faction]>
        # Change biome
        on player clicks plains_biome_item in change_environment_biome_inventory:
            - inventory close
            - flag server factions.<player.flag[faction]>.settings.environment.biome.type:plains
            - run change_faction_biome
        on player clicks savanna_biome_item in change_environment_biome_inventory:
            - inventory close
            - flag server factions.<player.flag[faction]>.settings.environment.biome.type:savanna
            - run change_faction_biome
        on player clicks desert_biome_item in change_environment_biome_inventory:
            - inventory close
            - flag server factions.<player.flag[faction]>.settings.environment.biome.type:desert
            - run change_faction_biome
        on player clicks taiga_biome_item in change_environment_biome_inventory:
            - inventory close
            - flag server factions.<player.flag[faction]>.settings.environment.biome.type:taiga
            - run change_faction_biome
        on player clicks jungle_biome_item in change_environment_biome_inventory:
            - inventory close
            - flag server factions.<player.flag[faction]>.settings.environment.biome.type:jungle
            - run change_faction_biome
        on player clicks beach_biome_item in change_environment_biome_inventory:
            - inventory close
            - flag server factions.<player.flag[faction]>.settings.environment.biome.type:beach
            - run change_faction_biome
        on player clicks mushroom_fields_biome_item in change_environment_biome_inventory:
            - inventory close
            - flag server factions.<player.flag[faction]>.settings.environment.biome.type:mushroom_fields
            - run change_faction_biome
        on player clicks snowy_slopes_biome_item in change_environment_biome_inventory:
            - inventory close
            - flag server factions.<player.flag[faction]>.settings.environment.biome.type:snowy_slopes
            - run change_faction_biome
        on player clicks badlands_biome_item in change_environment_biome_inventory:
            - inventory close
            - flag server factions.<player.flag[faction]>.settings.environment.biome.type:badlands
            - run change_faction_biome
        on player clicks auto_biome_item in change_environment_biome_inventory:
            - inventory close
            - flag server factions.<player.flag[faction]>.settings.environment.biome.type:auto
            - run change_faction_biome
        # Change time
        on player clicks dawn_time_item in change_environment_time_inventory:
            - inventory close
            - flag server factions.<player.flag[faction]>.settings.environment.time:23000t
            - run change_faction_time
        on player clicks sunrise_time_item in change_environment_time_inventory:
            - inventory close
            - flag server factions.<player.flag[faction]>.settings.environment.time:0t
            - run change_faction_time
        on player clicks noon_time_item in change_environment_time_inventory:
            - inventory close
            - flag server factions.<player.flag[faction]>.settings.environment.time:6000t
            - run change_faction_time
        on player clicks sunset_time_item in change_environment_time_inventory:
            - inventory close
            - flag server factions.<player.flag[faction]>.settings.environment.time:12000t
            - run change_faction_time
        on player clicks dusk_time_item in change_environment_time_inventory:
            - inventory close
            - flag server factions.<player.flag[faction]>.settings.environment.time:13000t
            - run change_faction_time
        on player clicks midnight_time_item in change_environment_time_inventory:
            - inventory close
            - flag server factions.<player.flag[faction]>.settings.environment.time:18000t
            - run change_faction_time
        on player clicks custom_time_item in change_environment_time_inventory:
            - inventory close
            - run set_custom_faction_time_textbox
        on player clicks auto_time_item in change_environment_time_inventory:
            - inventory close
            - flag server factions.<player.flag[faction]>.settings.environment.time:auto
            - run change_faction_time
