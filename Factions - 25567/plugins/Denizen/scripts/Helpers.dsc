log_faction_data:
    type: task
    script:
        - narrate "<server.flag[factions].to_yaml.if_null[No data.]>"

check_if_chunk_is_claimed:
    type: task
    script:
        - foreach <proc[get_all_claims]> as:c:
            - narrate <[c]>