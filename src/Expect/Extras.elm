module Expect.Extras exposing (equalJust, equalJson)

{-| Expect helpers.

@docs equalJust, equalJson

-}

import Json.Encode as Encode
import Expect exposing (Expectation)


{-| Passes if the second argument is `Just` of the first argument.
-}
equalJust : a -> Maybe a -> Expectation
equalJust =
    Expect.equal << Just


{-| Passes if the arguments are equal Json values.
-}
equalJson : Encode.Value -> Encode.Value -> Expectation
equalJson a =
    Expect.all
        [ Expect.equal a
        , flip Expect.equal a
        ]
