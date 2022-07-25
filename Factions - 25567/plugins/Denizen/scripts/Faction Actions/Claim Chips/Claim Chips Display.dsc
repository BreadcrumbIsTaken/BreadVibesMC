# Display CC amount with colors.
cc_display:
    type: procedure
    debug: false
    definitions: cc
    script:
        - determine <aqua><[cc]><yellow>CC<reset>
