module Main exposing (..)

import Browser
import Browser.Navigation as Nav
import Html exposing (..) 
import Html.Attributes exposing (..)
import Url

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
  , url : Url.Url
  }

init : () -> Url.Url -> Nav.Key -> (Model, Cmd Msg)
init flags url key = 
  ( Model key url, Cmd.none )

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
      ( { model | url = url }
      , Cmd.none
      )

subscriptions : Model -> Sub Msg
subscriptions _ =
  Sub.none


-- VIEW

view : Model -> Browser.Document Msg
view model =
  { title = "Hello"
  , body = 
    [ 
    ul []
      [ viewLink "home"
      , viewLink "dev"
      , viewLink "events"
      , viewLink "tutoring"
      ]
    , div [] [
        h3 [] [text "James Elgar"]
      , h1 [] [text "Full Stack Developer"]
      , h1 [] [text "Event Technician"]
      , h1 [] [text "Tutor"]
      ]
    , ul [] [
        contactLink "github" "github.com/Jelgar"
      , contactLink "phone" ""
      , contactLink "linkedin" "https://www.linkedin.com/in/james-elgar-768501170/"
      , contactLink "facebook" "https://www.facebook.com/james.elgar.75?ref=bookmarks"
      , contactLink "mail" "mailto:jamesnelgar@gmail.com?subject=\"Hi James!\""
      ]
    , div [] [
        button [] [text "My CV"]
      ]
    ]
  }
  
viewLink : String -> Html msg
viewLink path = 
  li [] [ a [ href ("/" ++ path) ] [ text path ]]

contactLink : String -> String -> Html msg
contactLink imagepath linkpath =
  li [] [a [href linkpath] [
      object [style "pointer-events" "none", type_ "image/svg+xml", attribute "data" ("assets/contact/" ++ imagepath ++ ".svg")] []
    ]]
