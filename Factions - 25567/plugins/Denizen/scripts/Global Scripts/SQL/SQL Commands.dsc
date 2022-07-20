# Load MySQL Credentials Script
# Desc:
#   Loads the credentials needed from a YAML file in the Sensitive Data directory.
load_mysql_creds:
    type: task
    debug: false
    script:
        - ~yaml "load:../../../SENSITIVE DATA/mysql_credentials.yml" id:mysql_creds

# Unload MySQL Credentials Script
# Desc:
# Unloads MySQL credentials.
unload_mysql_creds:
    type: task
    debug: false
    script:
        - ~yaml unload id:mysql_creds

# Connect to Database Script
# Desc:
#   Connects to the MySQL database using the credentials loaded at server startup.
connect_to_db:
    type: task
    debug: false
    script:
        - if !<util.sql_connections.contains[breadvibesmc_db]>:
            - define ip <yaml[mysql_creds].read[creds.ip]>
            - define port <yaml[mysql_creds].read[creds.port]>
            - define db <yaml[mysql_creds].read[creds.db]>
            - define username <yaml[mysql_creds].read[creds.username]>

            - ~sql id:breadvibesmc_db connect:<[ip]>:<[port]>/<[db]>?characterEncoding=utf8 username:<[username]> password:<secret[db_password]> ssl:true

# Disconnect from Database Script
# Desc:
#   Disconnects from the MySQL database.
disconnect_from_db:
    type: task
    debug: false
    script:
        - if <util.sql_connections.contains[breadvibesmc_db]>:
            - ~sql disconnect id:breadvibesmc_db

# Execute SQL Update Script
# Desc:
#   Executes a SQL update.
# Args(2):
#   QUERY: ElementTag(String) - The query to update.
#   PRINT_RESULT: ElementTag(Boolean) - Print the result or not.
execute_sql_update:
    type: task
    definitions: QUERY|PRINT_RESULT
    debug: false
    script:
        - inject connect_to_db

        - ~sql id:breadvibesmc_db update:<[QUERY]> save:MYSQL_UPDATE_RESULT

        - if <[PRINT_RESULT]>:
            - narrate <entry[MYSQL_UPDATE_RESULT].result> targets:<player>

        - inject disconnect_from_db

# Execute SQL Query Script
# Desc:
#   Executes a SQL query.
# Args(2):
#   QUERY: ElementTag(String) - The query to execute.
#   PRINT_RESULT: ElementTag(Boolean) - Print the result or not.
execute_sql_query:
    type: task
    definitions: QUERY|PRINT_RESULT
    debug: false
    script:
        # NOTE:
            # The 'inject' function puts a task in the same queue, unlike "run" where it makes a new queue along side it.
        - inject connect_to_db

        - ~sql id:breadvibesmc_db query:<[QUERY]> save:MYSQL_QUERY_RESULT

        - if <[PRINT_RESULT]>:
            - narrate <entry[MYSQL_QUERY_RESULT].result> targets:<player>

        - inject disconnect_from_db
