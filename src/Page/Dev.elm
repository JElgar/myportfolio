module Page.Dev exposing (view)

import Html exposing (Html) 

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Events exposing (..)
import Element.Font as Font
import Element.Input as Input

import Styles exposing (getColor, getFontSize)
import Icon exposing (..)

skillsSection : Element msg
skillsSection = 
    column
      [ height fill
      , width <| fillPortion 2
      , paddingXY 120 10
      ]
      [
        el [Font.size (getFontSize Styles.Header), Font.medium] (text "Skills")
      , collapsible "GoLang" "I like golang"
      ]

-- This may become projects and experience with like a nice button ting 
projectsSection : Element msg
projectsSection =
  column 
    [ height fill
    , width <| fillPortion 2
    , paddingXY 70 10
    , Font.medium
    ]
    [
      el [Font.size (getFontSize Styles.Header), Font.medium] (text "Projects")
    ]

divider : Element msg
divider = 
  el [ width (px 7)
     , height (px 140)
     , alignTop
     , Background.color <| (getColor Styles.Pink)
     , Border.rounded 3
     ] none

view : { title : String, content : Element msg }
view = 
  { title = "Dev"
  , content = 
        row [ height fill, width fill ]
            [
              skillsSection
            , divider
            , projectsSection
            ]
  }

collapsible : String -> String -> Element msg
collapsible title content = 
  column 
  []
  [
    row []
    [ 
      el [] (html (Icon.view Arrow {color= (Styles.getHTMLColor (getColor Styles.Pink)), swidth= "3", h= "10px", w= "10px"}))
    , el [] (text title)     
    ]         
  , el [] (text content)
  ]

