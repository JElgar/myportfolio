module Main exposing (..)

import Browser
import Browser.Navigation as Nav
import Html exposing (..) 
import Html.Attributes exposing (..)
import Url

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
     div [
         style "font-family" "'Montserrat', sans-serif" 
       
       ] [
      node "link" [ href "https://fonts.googleapis.com/css?family=Montserrat:400,500,600,700&display=swap", rel "stylesheet" ] []
      , div [style "width" "100%", style "height" "140px"] [
          ul [
            style "float" "right"
          , style "margin-right" "33px"
          , style "margin-top" "40px"
          ]
          [ viewLink "home"
          , viewLink "dev"
          , viewLink "events"
          , viewLink "tutoring"
          ]
        ]
      , div [ style "margin-left" "12%"
            , style "padding-top" "50px"
        
        ] [
          h3 [ style "margin-top" "0px"
             , style "font-weight" "500"
             , style "font-size" "56px"
             , style "color" grey

            ] [text "James Elgar"]
        , roleTitle "Full Stack Developer"
        , roleTitle "Event Technician"
        , roleTitle "Tutor"
        , div [] [
            ul [ style "padding" "0px"
               , style "padding-top" "40px"
                 
            ] [
              contactLink "github" "github.com/Jelgar"
            , contactLink "phone" ""
            , contactLink "linkedin" "https://www.linkedin.com/in/james-elgar-768501170/"
            , contactLink "facebook" "https://www.facebook.com/james.elgar.75?ref=bookmarks"
            , contactLink "mail" "mailto:jamesnelgar@gmail.com?subject=\"Hi James!\""
            ]
            , div [ style "position" "absolute"
                  , style "right" "75px"
                  , style "bottom" "50px"
              
              ] [
                div [ style "color" pink
                    , style "background-color" "white"
                    , style "border" ( "6px solid " ++ pink)
                    , style "font-size" "42px"
                    , style "font-weight" "600"
                    , style "text-align" "center"
                    , style "height" "80px"
                    , style "width" "240px"
                    , style "border-radius" "80px"

                  
                  ] [
                    p [ style "margin" "0px"
                      , style "margin-top" "15px"
                      
                      ] [text "My CV"]]

              ]
            ]
          ]
       ]
      ]
  }
  
viewLink : String -> Html msg
viewLink path = 
  li [ style "display" "inline-block" 
     , style "margin-right" "42px"
     , style "color" "black"
     , style "font-size" "32px"
     ] 
     [ a [ href ("/" ++ path), style "text-decoration" "none", style "color" "black" ] [ text path ]]

contactLink : String -> String -> Html msg
contactLink imagepath linkpath =
  li [ style "display" "inline-block" 
     , style "margin-right" "150px"
  ] [a [href linkpath, style "text-decoration" "none", style  "color" "rgb(51,51,51)"] [
      object [ style "pointer-events" "none"
             , style "height" "100px"
             , style "color" "rgb(51,51,51)"
             , type_ "image/svg+xml"
             , attribute "data" ("assets/contact/" ++ imagepath ++ ".svg")
             ] []
    ]]

roleTitle : String -> Html msg
roleTitle roleTitleText = 
  h1 [ style "font-size" "100px"
     , style "font-weight" "700"
     , style "margin-top" "30px"
     , style "margin-bottom" "0px"
    ] [text roleTitleText]

