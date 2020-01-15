module Icon exposing (..)

import Svg exposing (..)
import Svg.Attributes exposing (..)

type IconType
  = Eye
  | Github
  | Facebook
  | LinkedIn
  | Mail
  | Phone

view : IconType -> {color: String, swidth: String, h: String, w: String} -> Svg msg
view icon {color, swidth, h, w} = 
  svg 
  [
    width w
  , height h
  , viewBox "0 0 24 24"
  , fill "none"
  , stroke color
  , strokeWidth swidth
  ]
  (getPath icon)


getPath : IconType -> List (Svg msg)  
getPath icon =
  case icon of 
    Eye -> eye
    Github -> github
    Facebook -> facebook
    LinkedIn -> linkedin
    Mail -> mail
    Phone -> phone


eye : List (Svg msg)
eye =  
  [
    Svg.path [d "M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"][]
  , Svg.circle [cx "12", cy "12", r "3"] []
  ]

github : List (Svg msg)
github =  
  [
    Svg.path [d "M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22"][]
  ]

facebook : List (Svg msg)
facebook =  
  [
    Svg.path [d "M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"][]
  ]

linkedin : List (Svg msg)
linkedin =  
  [
    Svg.path [d "M16 8a6 6 0 0 1 6 6v7h-4v-7a2 2 0 0 0-2-2 2 2 0 0 0-2 2v7h-4v-7a6 6 0 0 1 6-6z"] []
  , Svg.rect [ x "2", y "9", width "4", height "12" ] []
  , Svg.circle [cx "4", cy "4", r "2"] []
  ]

mail : List (Svg msg)
mail =  
  [
    Svg.path [d "M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"] []
  , Svg.polyline [points "22,6 12,13 2,6"] []
  ]

phone : List (Svg msg)
phone =  
  [
    Svg.path [d "M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"] []
  ]
