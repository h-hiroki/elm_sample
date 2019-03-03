module Main exposing (main)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

main : Program () Model Msg
main =
    Browser.sandbox
        { init = init -- Modelの初期化
        , update = update -- メッセージを受けてModelを更新する方法
        , view = view -- Modelを参照してhtmlを作成
        }

-- MODEL アプリケーションが管理すべき状態を表したもの
-- 今回はカウンタの数値を状態管理するためModelはIntのみで定義
type alias Model =
    Int

-- init関数を実行するとModelは0がセットされる。
init : Model
init =
    0

-- UPDATE Modelを変更する方法を記述する
-- カスタム型でMsgを定義する。MsgにはIncrementかDecrementがセットされる
type Msg
    = Increment | Decrement

-- MsgがIncrementかDecrementかを判別してModelの数値の状態変更を行う。immutabelなので古いModelをうけとって新しいModelを返している。
update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1
        Decrement ->
            model - 1

-- VIEW
view : Model -> Html Msg -- 自分で定義したMsg型(Increment|Decrement)のメッセージを発生させる要素のこと
view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ] -- onClickには送信したいメッセージをセットする。
        , div [] [ text (String.fromInt model) ]
        , button [ onClick Increment ] [ text "+" ]
        ]