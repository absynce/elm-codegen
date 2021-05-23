module Elm.Let exposing
    ( Declaration, value, valueWith
    , function
    )

{-|

@docs Declaration, value, valueWith

@docs function

-}

import Elm.Pattern as Pattern exposing (Pattern)
import Elm.Syntax.Expression as Exp
import Internal.Compiler as Util


type alias Expression =
    Util.Expression


{-| -}
type alias Declaration =
    Util.LetDeclaration


{-| -}
value : String -> Expression -> Declaration
value name exp =
    valueWith (Pattern.var name) exp


{-| -}
valueWith : Pattern -> Expression -> Declaration
valueWith pattern (Util.Expression expr) =
    Util.LetDeclaration expr.imports
        (Exp.LetDestructuring (Util.nodify pattern)
            (Util.nodify expr.expression)
        )


{-| -}
function : String -> List Pattern -> Expression -> Declaration
function name args (Util.Expression body) =
    Util.LetDeclaration body.imports
        (Exp.LetFunction
            { documentation = Util.nodifyMaybe Nothing
            , signature =
                case body.annotation of
                    Ok sig ->
                        Just
                            (Util.nodify
                                { name = Util.nodify name
                                , typeAnnotation = Util.nodify sig
                                }
                            )

                    Err _ ->
                        Util.nodifyMaybe Nothing
            , declaration =
                Util.nodify
                    { name = Util.nodify name
                    , arguments = Util.nodifyAll args
                    , expression = Util.nodify body.expression
                    }
            }
        )



--
--{-| A value declared inside a let block.
---}
--letVal : String -> Expression -> LetDeclaration
--letVal valName expr =
--    LetDestructuring (varPattern valName |> nodify) (nodify expr)
