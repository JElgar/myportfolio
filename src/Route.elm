module Route exposing (..)
import Url.Parser as Parser exposing (Parser, (</>), int, map, oneOf, s, string)
import Url exposing (Url)

-- ROUTING
type Route
  = Home
  | Dev
  | Events
  | Tutoring

urlToRoute : Url -> Maybe Route
urlToRoute url =
  url
    |> Parser.parse urlParser

urlParser : Parser (Route -> a) a
urlParser = 
  oneOf 
    [ Parser.map Home Parser.top
    , Parser.map Dev (Parser.s "dev")
    , Parser.map Events (Parser.s "events")
    , Parser.map Tutoring (Parser.s "tutoring")
      
      ]

