# Changes a faction's settings based on the given faction, setting, and it's value.
change_faction_setting:
    type: task
    debug: false
    definitions: faction|setting|value
    script:
        - flag server factions.<[faction]>.<[setting]>:<[value]>
