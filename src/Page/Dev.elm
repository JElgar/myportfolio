module Page.Dev exposing (view)

import Html exposing (Html) 

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Events exposing (..)
import Element.Font as Font
import Element.Input as Input

skillsSection : Element msg
skillsSection = 
    column
      [ height fill
      , width <| fillPortion 1
      , Background.color <| rgb255 92 99 118
      , Font.color <| rgb255 255 255 255
      ]
      [
        text "Skills" 
      ]

-- This may become projects and experience with like a nice button ting 
projectsSection : Element msg
projectsSection =
  column 
    [ height fill
    , Background.color <| rgb255 50 50 50
    , width <| fillPortion 3
    ]
    [
      text "Projects"
    ]

view : { title : String, content : Element msg }
view = 
  { title = "Dev"
  , content = 
        row [ height fill, width fill ]
            [
              skillsSection
            , projectsSection
            ]
  }
