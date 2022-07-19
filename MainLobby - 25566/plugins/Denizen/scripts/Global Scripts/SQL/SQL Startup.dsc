# SQL Server Startup Event
# Desc:
#   Loads credentials for MySQL when the server is starting up.
#   It also unloads it when the server is shutting down.
sql_server_startup:
    type: world
    events:
        on server prestart:
            - run load_mysql_creds
        on shutdown:
            - run unload_mysql_creds
