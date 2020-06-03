module Types exposing (..)

import Dict exposing (Dict)
import Lamdera exposing (ClientId)



-- Lamdera Types


type alias BackendModel =
    { players : Dict ClientId String
    }


type FrontendMsg
    = DeckShuffled (List Card)
    | CardClicked Card
    | FNoop


type ToBackend
    = PlayerJoined String


type Set
    = Set Card Card Card


type BackendMsg
    = BNoop


type ToFrontend
    = NoOpToFrontend



-- Domain Types


type Color
    = Red
    | Green
    | Purple


type Shading
    = Solid
    | Striped
    | Empty


type Card
    = Card CardData


type alias CardData =
    { symbol : Symbol
    , color : Color
    , number : Number
    , shading : Shading
    }


type Number
    = One
    | Two
    | Three


type FrontendModel
    = Preparing
    | Playing PlayingModel


type Picked
    = PickedNone
    | PickedOne Card
    | PickedTwo Card Card
    | Valid Set
    | Invalid Card Card Card


type alias PlayingModel =
    { remainingDeck : List Card
    , deal : List Card
    , picked : Picked
    }



-- Features: Symbol, Shading, Color and Number
-- all the same or all different on a feature level


type Symbol
    = Oval
    | Diamond
    | Squiggle
