module Session exposing (Session, navKey, sessionFromKey)

import Browser.Navigation as Nav

type Session
    = Guest Nav.Key

navKey : Session -> Nav.Key
navKey session =
  case session of
    Guest key ->
      key

sessionFromKey : Nav.Key -> Session 
sessionFromKey key =
  Guest key
