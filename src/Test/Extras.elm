module Test.Extras exposing (pending)

{-| Test helpers.

@docs pending

-}

import Expect
import Test exposing (Test)


{-| Disable a pending Test.
Unlike `skip`, this causes `elm-test` to succeed. This makes it possible to
add pending tests to source control without break git hooks and CI.

The message isn't logged consistently with other test results. I think elm-test
doesn't actually want anyone to do this.

-}
pending : a -> String -> b -> Test
pending _ s _ =
    test s <|
        \_ ->
            let
                _ =
                    Debug.log "skipping test" s
            in
                Expect.pass
