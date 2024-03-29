# Announce Notice to Operators Script
# Desc:
#   Announces something to operators.
# Args(1):
#   MESSAGE: ElementTag(String) - The message to announce
announce_notice_to_ops:
    type: task
    debug: false
    definitions: MESSAGE
    script:
        - announce <[MESSAGE]> to_ops format:server_chat_format

ops_format:
    type: format
    debug: false
    format: <&color[#E3831C]>[Operators]<&co> <[text]>
