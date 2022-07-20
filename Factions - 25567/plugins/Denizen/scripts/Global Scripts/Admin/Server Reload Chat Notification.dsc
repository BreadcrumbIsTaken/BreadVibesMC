# Server Reload Chat Notification Event
# Written by Breadcrumb
# Desc:
#   Sends a chat notification to any operators on the server.
server_reload_chat_notification:
    type: world
    debug: false
    events:
        after reload scripts:
            - run announce_notice_to_ops "def:<bold>Server has just been reloaded!"
