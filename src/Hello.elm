import Html exposing (Html, a, text, div, h1, ul, li)
import Html.Attributes exposing (href)

main : Html msg
main =
    div [] [ header, content ] -- div要素の子要素にheaderとcontentを定義する

header : Html msg
header =
    h1 [] [ text "Useful links" ] -- h1タグでUseful linksのテキストを表示する

content : Html msg
content =
    ul []
        [ linkItem "https://elm-lang.org" "Homepage"
        , linkItem "https://package.elm-lang.org" "Packages"
        , linkItem "https://ellie-app.com" "Playground"
        ] -- ul要素の子要素でlinkItem(li要素)を定義する

linkItem : String -> String -> Html msg
linkItem url text_ =
    li [] [ a [ href url ] [ text text_ ]]  -- li要素の子要素にaタグを定義する