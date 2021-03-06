module Page.Home exposing (view)

import Html exposing (..) 
import Html.Attributes exposing (..)

import Element as Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Events exposing (..)
import Element.Font as Font
import Element.Input as Input

import Icon exposing (..)

-- GLOBAL STYLES

grey : String
grey = "rgb(51,51,51)"

pink : String
pink = "rgb(255,32,207)"


view : { title : String, content : Element.Element msg }
view =
  let 
      htmlContent =
        div [] [
         node "link" [ href "https://fonts.googleapis.com/css?family=Montserrat:400,500,600,700&display=swap", rel "stylesheet" ] []
         , div [ style "margin-left" "12%"
               , style "padding-top" "50px"
           
           ] [
             h3 [ style "margin-top" "0px"
                , style "font-weight" "500"
                , style "font-size" "56px"
                , style "color" grey

               ] [Html.text "James Elgar"]
           , roleTitle "Full Stack Developer"
           , roleTitle "Event Technician"
           , roleTitle "Tutor"
           , div [] [
               ul [ style "padding" "0px"
                  , style "padding-top" "40px"
                    
               ] [
                 contactLink Icon.Github "github.com/Jelgar"
               , contactLink Icon.Phone ""
               , contactLink Icon.LinkedIn "https://www.linkedin.com/in/james-elgar-768501170/"
               , contactLink Icon.Facebook "https://www.facebook.com/james.elgar.75?ref=bookmarks"
               , contactLink Icon.Mail "mailto:jamesnelgar@gmail.com?subject=\"Hi James!\""
               ]
             ]
           ]
          ]
  in
  { title = "Hello"
  , content = html htmlContent
  }
  
contactLink : Icon.IconType -> String -> Html msg
contactLink icon linkpath =
  li [ style "display" "inline-block" 
     , style "margin-right" "150px"
  ] [a [href linkpath, style "text-decoration" "none", style  "color" "rgb(51,51,51)"] [
      Icon.view icon { color= grey, swidth= "1", h= "100", w= "auto"}
    ]]

roleTitle : String -> Html msg
roleTitle roleTitleText = 
  h1 [ style "font-size" "100px"
     , style "font-weight" "700"
     , style "margin-top" "30px"
     , style "margin-bottom" "0px"
    ] [Html.text roleTitleText]

