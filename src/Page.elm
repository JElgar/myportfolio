module Page exposing (Page(..), view)

import Html exposing (..) 
import Html.Attributes exposing (..)

import Browser exposing (Document)

type Page
  = Home
  | Dev
  | Events
  | Tutoring

pink : String
pink = "rgb(255,32,207)"

view : Page ->  {title : String , content : Html msg } -> Browser.Document msg
view page {title, content} = 
      {
        title = title
      , body = [
          div 
          [
            style "font-family" "'Montserrat', sans-serif" 
          ] 
          [
            viewHeader page
          , content
          ]
        ]
      }
     

pageUnderlinePos : Page -> String
pageUnderlinePos page =
  case page of 
    Home -> "530px"
    Dev -> "392px"
    Events -> "291px"
    Tutoring -> "141px"

viewHeader : Page -> Html msg
viewHeader page = 
      div [style "width" "100%", style "height" "140px"] [
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
          , div [ style "height" "7px"
                , style "width" "60px"  
                , style "float" "right"
                , style "border-radius" "20px"
                , style "background-color" pink
                , style "position" "absolute"
                , style "top" "78px"
                , style "transition" "right 0.5s"
                , style "right" (pageUnderlinePos page)
            ] []

        ]

viewLink : String -> Html msg
viewLink path = 
  li [ style "display" "inline-block" 
     , style "margin-right" "42px"
     , style "color" "black"
     , style "font-size" "32px"
     ] 
     [ a [ href ("/" ++ path), style "text-decoration" "none", style "color" "black" ] [ text path ]]
