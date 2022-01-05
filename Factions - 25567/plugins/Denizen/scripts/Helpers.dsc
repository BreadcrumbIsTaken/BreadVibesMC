# Log Faction Data Task
# Written by Breadcrumb
# Description
#   Logs all the faction data to the chat/console in YAML syntax. Just for testing usage. Should not be used for anything else.
log_faction_data:
    type: task
    script:
        - narrate "<server.flag[factions].to_yaml.if_null[No data.]>"

# Check if Chunk is Claimed Task
# Written by Breadcrumb
# Description
#   Narrates each chunk that is claimed. Just for testing usage. Should not be used for anything else.
check_if_chunk_is_claimed:
    type: task
    script:
        - foreach <proc[get_all_claims]> as:c:
            - narrate <[c]>