module Page.Dev exposing (view, Model)

import Html exposing (Html) 

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Events exposing (..)
import Element.Font as Font
import Element.Input as Input

import Styles exposing (getColor, getFontSize)
import Icon exposing (..)


type alias Model = 
  { collapsed : Maybe Int
  }

type Msg
  = SetCollapsed (Maybe Int)
 
skillsSection : Element msg
skillsSection = 
    column
      [ height fill
      , width <| fillPortion 2
      , paddingXY 120 10
      ]
      [
        el [Font.size (getFontSize Styles.Header), Font.medium] (text "Skills")
      , collapsible {title="GoLang", content="Hello GoLang", collapsed=False, lbutton=Nothing, rbutton=Nothing}
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
     , Background.color <| getColor Styles.Pink
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

type alias CollapsibleButton = 
  { icon : IconType
  , text : String
  }

type alias CollapsibleContent = 
  { title : String
  , content : String
  , collapsed : Bool
  , lbutton : Maybe CollapsibleButton
  , rbutton : Maybe CollapsibleButton
  }

collapsible : CollapsibleContent -> Element msg
collapsible {title, content, collapsed, lbutton, rbutton} = 
  column 
  []
  [
    row []
    [ 
      el [] (html (Icon.view Arrow {color= (Styles.getHTMLColor (getColor Styles.Pink)), swidth= "3", h= "10px", w= "10px"}))
    , el [] (text title)     
    ]         
  , if not collapsed then el [] (text content) else none
  ]

checkbox : Bool -> Element Msg
checkbox collapsed =
    Input.checkbox []
        { onChange = onChangeCheckBox
        , icon = Input.defaultCheckbox
        , checked = collapsed
        , label =
            Input.labelRight []
                (text "Do you want Guacamole?")
        }

onChangeCheckBox : Bool -> Msg
onChangeCheckBox checked = 
  case checked of 
    True -> SetCollapsed (Just 0)
    False -> SetCollapsed Nothing

-- UPDATE 

update : Msg -> Model -> ( Model, Cmd Msg)
update msg model = 
  case msg of
    SetCollapsed num -> 
      case num of 
        Just n -> ( { model | collapsed = ( Just n ) }
                  , Cmd.none
                  )
        Nothing -> ( {model | collapsed = Nothing }
                   , Cmd.none
                   )
    
