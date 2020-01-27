module Route exposing (..)

-- ROUTING
type Route
  = Home
  | Dev
  | Events
  | Tutoring

urlToPage : Url -> Page.Page
urlToPage url =
  url
    |> Parser.parse urlParser
    |> Maybe.withDefault Page.Home

urlParser : Parser (Page.Page -> a) a
urlParser = 
  oneOf 
    [ Parser.map Page.Home Parser.top
    , Parser.map Page.Dev (Parser.s "dev")
    , Parser.map Page.Events (Parser.s "events")
    , Parser.map Page.Tutoring (Parser.s "tutoring")
      
      ]

