import Html exposing (Html, a, text, div, h1, ul, li)
import Html.Attributes exposing (href)

main : Html msg
main =
    div [] [ header, content ]

header : Html msg
header =
    h1 [] [ text "Useful links" ]

content : Html msg
content =
    ul []
        [ li [] [ a [ href "https://elm-lang.org" ] [ text "HomePage" ] ]
        , li [] [ a [ href "https://package.elm-lang.org" ] [ text "Packages" ] ]
        , li [] [ a [ href "https://ellie-app.com" ] [ text "Playground" ] ]
        ]
