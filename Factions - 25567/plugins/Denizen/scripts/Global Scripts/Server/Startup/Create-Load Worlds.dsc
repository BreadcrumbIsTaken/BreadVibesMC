# Create/Load Worlds Event
# Written by Breadcrumb
# Desc:
#   Loads the worlds for the server.
create_slash_load_worlds:
    type: world
    events:
        on server prestart:
            - createworld world