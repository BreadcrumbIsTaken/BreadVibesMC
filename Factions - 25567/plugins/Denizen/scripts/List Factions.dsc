list_factions_command:
    type: command
    name: listfactions
    usage: /listfactions
    aliases:
        - logfactions
        - factions
    description: Lists all the current factions in an inventory UI.
    script:
        - inventory open d:list_factions_command_list_inventory