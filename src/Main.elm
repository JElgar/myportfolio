module Main exposing (..)

import Browser
import Browser.Navigation as Nav
import Html exposing (..) 
import Html.Attributes exposing (..)
import Url exposing (Url)
import Url.Parser as Parser exposing (Parser, (</>), int, map, oneOf, s, string)

import Page 
import Page.Home exposing (view)
import Page.Dev exposing (view)



-- ROUTING

urlToPage : Url -> Page.Page
urlToPage url =
  url
    |> Parser.parse urlParser
    |> Maybe.withDefault Page.Home

urlParser : Parser (Page.Page -> a) a
urlParser = 
  oneOf 
    [ Parser.map Page.Home Parser.top
    , Parser.map Page.Dev (Parser.s "dev")
    , Parser.map Page.Events (Parser.s "events")
    , Parser.map Page.Tutoring (Parser.s "tutoring")
      
      ]

-- GLOBAL STYLES

grey : String
grey = "rgb(51,51,51)"

pink : String
pink = "rgb(255,32,207)"

-- MAIN

main : Program () Model Msg
main = 
  Browser.application 
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    , onUrlChange = UrlChanged
    , onUrlRequest = LinkClicked
    }

-- MODEL

type alias Model = 
  { key : Nav.Key
  , page: Page.Page
  }

init : () -> Url.Url -> Nav.Key -> (Model, Cmd Msg)
init flags url key = 
  ( Model key (urlToPage url), Cmd.none )

-- UPDATE

type Msg 
  = LinkClicked Browser.UrlRequest
  | UrlChanged Url.Url

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = 
  case msg of 
    LinkClicked urlRequest ->
      case urlRequest of 
        Browser.Internal url ->
          ( model, Nav.pushUrl model.key ( Url.toString url ) )

        Browser.External href -> 
          ( model, Nav.load href )

    UrlChanged url -> 
      ( { model | page = urlToPage url }
      , Cmd.none
      )

subscriptions : Model -> Sub Msg
subscriptions _ =
  Sub.none


-- VIEW

view : Model -> Browser.Document Msg
view model = 
  case model.page of
    Page.Home  ->
      Page.view Page.Home Page.Home.view
    _  ->
      Page.view Page.Dev Page.Dev.view
