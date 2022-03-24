# Log Faction Data Task
# Written by Breadcrumb
# Description
#   Logs all the faction data to the chat/console in YAML syntax. Just for testing usage. Should not be used for anything else.
log_faction_data:
    type: task
    script:
        - narrate "<server.flag[factions].to_yaml.if_null[No data.]>"

#| This script is ONLY for testing purposes. I will only use this to see if things are working
#| as they should. It is easier for me to look at a highlighted file than text in Minecraft's chatbox.
faction_data_to_yaml:
    type: task
    script:
        - yaml create id:faction_data_yaml
        - yaml id:faction_data_yaml set "factions:<server.flag[factions].if_null[No data.]>"
        - ~yaml savefile:faction_data.yml id:faction_data_yaml
        - yaml unload id:faction_data_yaml
