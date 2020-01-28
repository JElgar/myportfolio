module Main exposing (..)

import Browser
import Browser.Navigation as Nav
import Html exposing (..) 
import Html.Attributes exposing (..)
import Url exposing (Url)

import Page 
import Page.Home
import Page.Dev

import Session exposing (Session, navKey)

import Route exposing (..)


-- GLOBAL STYLES
-- Can't wait to get rid of these 

grey : String
grey = "rgb(51,51,51)"

pink : String
pink = "rgb(255,32,207)"

-- MAIN

main : Program () Model Msg
main = 
  Browser.application 
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    , onUrlChange = UrlChanged
    , onUrlRequest = LinkClicked
    }

-- MODEL

type Model 
  = Home Session
  | Dev Page.Dev.Model Session


{-
type alias Model = 
  { key : Nav.Key
  , page: Page.Page
  , checked : Int
  }
-}


{-
init : () -> Url.Url -> Nav.Key -> (Model, Cmd Msg)
init flags url key = 
  ( Model key (urlToPage url), Cmd.none )
-}

init : () -> Url.Url -> Nav.Key -> (Model, Cmd Msg)
init flags url key =
  ( Home ( Session.sessionFromKey key ), Cmd.none )

-- UPDATE

type Msg 
  = LinkClicked Browser.UrlRequest
  | UrlChanged Url.Url

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = 
  case msg of 
    LinkClicked urlRequest ->
      case urlRequest of 
        Browser.Internal url ->
          ( model, Nav.pushUrl (getNavKey model) ( Url.toString url ) )

        Browser.External href -> 
          ( model, Nav.load href )

    UrlChanged url -> 
      changeRoute ( urlToRoute url ) model


subscriptions : Model -> Sub Msg
subscriptions _ =
  Sub.none


-- VIEW

view : Model -> Browser.Document Msg
view model = 
  case model of
    Home _ ->
      Page.view Page.Home (Page.Home.view )
    Dev devmodel _ ->
      Page.view Page.Dev (Page.Dev.view devmodel)

getNavKey : Model -> Nav.Key
getNavKey model = 
  case model of 
    Home session -> (Session.navKey session)
    Dev _ session -> (Session.navKey session)

getSession : Model -> Session
getSession model = 
  case model of 
    Home session -> session
    Dev _ session -> session

changeRoute : Maybe Route.Route -> Model -> ( Model, Cmd Msg )
changeRoute route model = 
  let 
    session = getSession model
  in
  case route of 
    Nothing -> ( Home session , Cmd.none )
    Just Route.Home -> ( Home session , Cmd.none )
    Just Route.Dev -> ( Dev Page.Dev.initModel session , Cmd.none )
    _ -> ( Home session , Cmd.none )

