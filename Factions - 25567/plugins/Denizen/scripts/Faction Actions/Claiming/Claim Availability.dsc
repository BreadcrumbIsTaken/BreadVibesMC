is_chunk_cuboid_claimable:
    type: procedure
    definitions: cuboid
    script:
        - define claims <proc[get_all_claims].if_null[none]>
        - if <[claims]> == none:
            - determine true
        - else:
            - if <[cuboid]> in <[claims]>:
                - determine false
            - else:
                - determine true
