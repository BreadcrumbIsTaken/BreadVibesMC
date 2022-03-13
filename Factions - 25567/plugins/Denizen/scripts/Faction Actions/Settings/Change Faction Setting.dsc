change_faction_setting:
    type: task
    definitions: faction|setting|value
    script:
        - flag server factions.<[faction]>.<[setting]>:<[value]>
