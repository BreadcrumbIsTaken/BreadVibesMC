# Logs all the faction data as YAML into the chat.
log_faction_data:
    type: task
    debug: false
    script:
        - narrate "<server.flag[factions].to_yaml.if_null[No data.]>"

#| This script is ONLY for testing purposes. I will only use this to see if things are working
#| as they should. It is easier for me to look at a highlighted file than text in Minecraft's chatbox.
# Saves all the faction data as a YAML file.
faction_data_to_yaml:
    type: task
    debug: false
    script:
        - yaml create id:faction_data_yaml
        - yaml id:faction_data_yaml set "factions:<server.flag[factions].if_null[No data.]>"
        - ~yaml savefile:faction_data.yml id:faction_data_yaml
        - yaml unload id:faction_data_yaml
