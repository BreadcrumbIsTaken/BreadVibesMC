# Checks if a given claim (chunk.cuboid) is claimable or not.
is_claimable:
    type: procedure
    debug: false
    definitions: cuboid
    script:
        - define claims <proc[get_all_claims]>
        - if <[claims]> == null:
            - determine true
        - else:
            - if <[claims].values.contains[<[cuboid]>]>:
                - determine false
            - else:
                - determine true
