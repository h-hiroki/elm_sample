import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }


-- MODEL
-- input 入力中の文字列
-- memos メモのリスト
type alias Model =
    { input : String
    , memos : List String
    }

init : Model
init =
    { input = ""
    , memos = []
    }


-- UPDATE
type Msg
    = Input String -- Stringは入力中のメッセージ
    | Submit


update : Msg -> Model -> Model
update msg model =
    case msg of
        Input input ->
            -- 入力中の文字を更新する
            { model | input = input } -- modelのinputにinputを代入する

        Submit ->
            { model
                -- 入力中の文字をリセットする
                | input = "" -- modelのinputに""を代入する"
                -- メモを追加する
                , memos = model.input :: model.memos -- modelのmemosにmodel.inputを追加したものを代入する
            }


-- VIEW
view : Model -> Html Msg
view model =
    div []
        [ Html.form [ onSubmit Submit ]
            [ input [ value model.input, onInput Input ] []
            , button
                [ disabled (String.length model.input < 1) ]
                [ text "Submit" ]
            ]
        , ul [] (List.map viewMemo model.memos)
        ]

viewMemo : String -> Html Msg
viewMemo memo =
    li [] [ text memo ]