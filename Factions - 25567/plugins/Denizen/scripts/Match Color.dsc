match_dye_to_color_code:
    type: procedure
    definitions: item
    script:
        - if <[item].material.name.contains[dye]>:
            - define color <[item].material.name.replace_text[_dye].with[]>

            - choose <[color]>:
                - case red:
                    - determine <red>
                - case orange:
                    - determine <gold>
                - case yellow:
                    - determine <yellow>
                - case green:
                    - determine <dark_green>
                - case lime:
                    - determine <green>
                - case light_blue:
                    - determine <aqua>
                - case blue:
                    - determine <blue>
                - case cyan:
                    - determine <dark_blue>
                - case magenta:
                    - determine <light_purple>
                - case purple:
                    - determine <dark_purple>
                - case light_gray:
                    - determine <gray>
                - case white:
                    - determine <white>
                - default:
                    - determine <white>

match_color_code_to_dye:
    type: procedure
    definitions: color
    script:
        - if <[color]> == <red>:
            - determine red
        - else if <[color]> == <gold>:
            - determine orange
        - else if <[color]> == <yellow>:
            - determine yellow
        - else if <[color]> == <dark_green>:
            - determine green
        - else if <[color]> == <green>:
            - determine lime
        - else if <[color]> == <aqua>:
            - determine light_blue
        - else if <[color]> == <blue>:
            - determine blue
        - else if <[color]> == <dark_blue>:
            - determine dark_blue
        - else if <[color]> == <light_purple>:
            - determine magenta
        - else if <[color]> == <dark_purple>:
            - determine purple
        - else if <[color]> == <gray>:
            - determine gray
        - else if <[color]> == <white>:
            - determine white
        - else:
            - determine white

match_color_code_to_name:
    type: procedure
    definitions: color
    script:
        - if <[color]> == <red>:
            - determine red
        - else if <[color]> == <gold>:
            - determine orange
        - else if <[color]> == <yellow>:
            - determine yellow
        - else if <[color]> == <dark_green>:
            - determine green
        - else if <[color]> == <green>:
            - determine "light green"
        - else if <[color]> == <aqua>:
            - determine "light blue"
        - else if <[color]> == <blue>:
            - determine blue
        - else if <[color]> == <dark_blue>:
            - determine "dark blue"
        - else if <[color]> == <light_purple>:
            - determine "light purple"
        - else if <[color]> == <dark_purple>:
            - determine purple
        - else if <[color]> == <gray>:
            - determine gray
        - else if <[color]> == <white>:
            - determine white
        - else:
            - determine white
