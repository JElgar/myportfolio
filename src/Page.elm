module Page exposing (Page(..), view)

import Html exposing (..) 
import Html.Attributes exposing (..)

import Browser exposing (Document)

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Events exposing (..)
import Element.Font as Font
import Element.Input as Input

type Page
  = Home
  | Dev
  | Events
  | Tutoring

pink : String
pink = "rgb(255,32,207)"

view : Page ->  {title : String , content : Element msg } -> Browser.Document msg
view page {title, content} = 
      {
        title = title
      , body = [
          layout [] <|
            column [ 
                  Element.height fill
                , Element.width fill
                , Font.family [ Font.typeface "Montserrat"
                              , Font.sansSerif
                              ]
                ] 
                [
                  html imports
                , html (viewHeader page)
                , row [Element.width fill, Element.height fill] [
                           content
                         , html viewCVButton
                         ]
                ]
        ]
      }
     
imports : Html msg
imports = 
    div [] 
    [
      node "link" [ href "https://fonts.googleapis.com/css?family=Montserrat:400,500,600,700&display=swap", rel "stylesheet" ] []
    ]

pageToString : Page -> String
pageToString page =
  case page of
    Home -> "home"
    Dev -> "dev"
    Events -> "events"
    Tutoring -> "tutoring"

pageUnderlinePos : Page -> String
pageUnderlinePos page =
  case page of 
    Home -> "530px"
    Dev -> "392px"
    Events -> "291px"
    Tutoring -> "141px"

pageFontWeight : String -> Page -> String
pageFontWeight pageName actualPage = 
  if (pageName == (pageToString actualPage)) then
    "600"
  else
    "400"

viewHeader : Page -> Html msg
viewHeader page = 
      div [style "width" "100%", style "height" "140px"] [
          ul [
              style "float" "right"
            , style "margin-right" "33px"
            , style "margin-top" "40px"
            ]
            [ viewLink (pageToString Home) page
            , viewLink (pageToString Dev) page
            , viewLink (pageToString Events) page
            , viewLink (pageToString Tutoring) page
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

viewLink : String -> Page -> Html msg
viewLink path page = 
  li [ style "display" "inline-block" 
     , style "margin-right" "42px"
     , style "color" "black"
     , style "font-size" "32px"
     , style "font-weight" (pageFontWeight path page)
     ] 
     [ a [ href ("/" ++ path), style "text-decoration" "none", style "color" "black" ] [ Html.text path ]]

viewCVButton : Html msg
viewCVButton = 
            div [ style "position" "absolute"
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
                      
                      ] [Html.text "My CV"]]

              ]
