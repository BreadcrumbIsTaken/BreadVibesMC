# Ban Player Command
# Desc:
#   Bans/Unbans a player for an optional duration.
ban_player:
    type: command
    debug: false
    name: ban
    description: Ban a player. Default duration is 5d. When typing the reason, put it in quotation marks.
    usage: /ban [player] [reason] (duration:# + s, m, h, d, y)
    tab completions:
        1: <server.online_players.parse[name]>
        2: reason
        3: duration<&co> # + s, m, h, d, y
    permission: breadvibesmc.admin.ban
    script:
        - if <context.args.size> <= 3 && <context.args.size> > 1:
            - if <context.args.size> == 2:
                - ban <proc[match_player].context[<context.args.get[1]>]> reason:<context.args.get[2]> duration:5d source:<player.name>
                - announce '<context.args.get[1]> was banned for "<context.args.get[2]>" by <player.name> for 5d' format:ops_format to_ops
            - else:
                - ban <proc[match_player].context[<context.args.get[1]>]> reason:<context.args.get[2]> source:<player.name> duration:<context.args.get[3]>
                - announce '<context.args.get[1]> was banned for "<context.args.get[2]>" by <player.name> for <context.args.get[3]>' format:ops_format to_ops
        - else:
            - narrate "<&[error]>Woah! Not enough arguments provided. Expected 2 or 3, but got <context.args.size>!"

unban_player:
    type: command
    debug: false
    description: Unbans a player.
    name: unban
    usage: /unban [player]
    tab completions:
        1: <server.banned_players.parse[name]>
    permission: breadvibesmc.admin.unban
    script:
        - if <context.args.size> == 0:
            - narrate "<&[error]>Woah! No arguments provided! Please provide arguments."
            - stop

        - if <context.args.size> == 1:
            - ban remove <proc[match_player].context[<context.args.get[1]>]>
            - announce "<context.args.get[1]> was unbanned by <player.name>!" format:ops_format to_ops
        - else:
            - narrate "<&[error]>You did not provide the player to unban."
