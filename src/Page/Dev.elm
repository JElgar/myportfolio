module Page.Dev exposing (view)

import Html exposing (Html) 

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Events exposing (..)
import Element.Font as Font
import Element.Input as Input

import Styles exposing (getColor)

skillsSection : Element msg
skillsSection = 
    column
      [ height fill
      , width <| fillPortion 1
      , padding 20
      ]
      [
        el [Font.semiBold] <| text "Skills" 
      ]

-- This may become projects and experience with like a nice button ting 
projectsSection : Element msg
projectsSection =
  column 
    [ height fill
    , width <| fillPortion 2
    , padding 20
    ]
    [
      text "Projects"
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
