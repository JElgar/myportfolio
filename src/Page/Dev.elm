module Page.Dev exposing (view)

import Html exposing (..) 
import Html.Attributes exposing (..)

view : { title : String, content : Html msg }
view = 
  { title = "Dev"
  , content = 
      text "This will be the dev page"
  }
