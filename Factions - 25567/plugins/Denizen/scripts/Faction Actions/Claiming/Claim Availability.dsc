is_chunk_cuboid_claimable:
    type: procedure
    definitions: cuboid
    script:
        - define claims <proc[get_all_claims]||none>
        - if <[claims]> == none:
            - determine true
        - else:
            - foreach <[claims]> key:claim_name as:location:
                - if <[claims].get[<[claim_name]>]> == <[cuboid]>:
                    - determine true
                - determine false
