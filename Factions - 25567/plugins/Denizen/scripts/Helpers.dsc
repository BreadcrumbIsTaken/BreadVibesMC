# Log Faction Data Task
# Written by Breadcrumb
# Description
#   Logs all the faction data to the chat/console in YAML syntax. Just for testing usage. Should not be used for anything else.
log_faction_data:
    type: task
    script:
        - narrate "<server.flag[factions].to_yaml.if_null[No data.]>"
