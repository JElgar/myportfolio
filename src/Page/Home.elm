module Page.Home exposing (view)

import Html exposing (..) 
import Html.Attributes exposing (..)

import Icon exposing (..)

-- GLOBAL STYLES

grey : String
grey = "rgb(51,51,51)"

pink : String
pink = "rgb(255,32,207)"


view : { title : String, content : Html msg }
view =
  { title = "Hello"
  , content = 
     div [
         style "font-family" "'Montserrat', sans-serif" 
       
       ] [
      node "link" [ href "https://fonts.googleapis.com/css?family=Montserrat:400,500,600,700&display=swap", rel "stylesheet" ] []
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
              contactLink Icon.Github "github.com/Jelgar"
            , contactLink Icon.Phone ""
            , contactLink Icon.LinkedIn "https://www.linkedin.com/in/james-elgar-768501170/"
            , contactLink Icon.Facebook "https://www.facebook.com/james.elgar.75?ref=bookmarks"
            , contactLink Icon.Mail "mailto:jamesnelgar@gmail.com?subject=\"Hi James!\""
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
  }
  
ocontactLink : String -> String -> Html msg
ocontactLink imagepath linkpath =
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
    ] [text roleTitleText]

