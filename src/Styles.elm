module Styles exposing (..)
{- The purpose of this file is to store all the styles that will be used across this project -}

import Element exposing (..)

type MyColor
  = Pink
  | Grey
  | Black

{- This function takes on of the colours used in the project and converts it into a real thing that elm can use -}
getColor : MyColor -> Color
getColor color = 
  case color of
    Pink -> rgb255 255 32 207
    Grey -> rgb255 51 51 51
    Black -> rgb255 0 0 0
