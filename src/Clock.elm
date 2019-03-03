module Clock exposing (main)

import Browser
import Html exposing (..)
import Task
import Time


-- MAIN

main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


-- MODEL

type alias Model =
    { zone : Time.Zone -- タイムゾーン
    , time : Time.Posix -- 現在時刻
    }

init : () -> ( Model, Cmd Msg )
init _ =
    ( Model Time.utc (Time.millisToPosix 0) -- タイムゾーンの初期値をUTCにする
    , Task.perform AdjustTimeZone Time.here -- 実行環境のタイムゾーンを取得するコマンド
    )


-- UPDATE

type Msg
    = Tick Time.Posix
    | AdjustTimeZone Time.Zone

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        -- 1秒おきに時刻を含んだメッセージが届く
        Tick newTime ->
            ( { model | time = newTime }
            , Cmd.none
            )

        -- タイムゾーンを取得した時
        AdjustTimeZone newZone ->
            ( { model | zone = newZone }
            , Cmd.none
            )


-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
    -- 1秒おきにTickメッセージを受ける
    Time.every 1000 Tick


-- VIEW

view : Model -> Html Msg
view model =
    -- 実行環境のタイムゾーンに変換して時間を表示する
    let
        hour =
            String.fromInt (Time.toHour model.zone model.time)
        minute =
            String.fromInt (Time.toMinute model.zone model.time)
        second =
            String.fromInt (Time.toSecond model.zone model.time)
    in
    h1 [] [ text (hour ++ ":" ++ minute ++ ":" ++ second) ]