module Gen.Elm.Case exposing (annotation_, branch0, branch1, branch2, branch3, branch4, branch5, branch6, branchWith, call_, custom, list, listBranch, maybe, moduleName_, otherwise, result, triple, tuple, values_)

{-| 
@docs moduleName_, maybe, result, list, tuple, triple, custom, otherwise, branch0, branch1, branch2, branch3, branch4, branch5, branch6, branchWith, listBranch, annotation_, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Elm", "Case" ]


{-|

    Elm.fn "myMaybe" <|
        \myMaybe ->
            Elm.Case.list myMaybe
                { nothing = Elm.int 0
                , just =
                    \content ->
                        Elm.plus (Elm.int 5) content
                }

Generates

    \myMaybe ->
        case myMaybe of
            Nothing ->
                0

            Just just ->
                just + 5

-}
maybe :
    Elm.Expression
    -> { nothing : Elm.Expression, just : Elm.Expression -> Elm.Expression }
    -> Elm.Expression
maybe arg1 arg2 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Elm", "Case" ]
            , name = "maybe"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Elm" ] "Expression" []
                        , Type.record
                            [ ( "nothing"
                              , Type.namedWith [ "Elm" ] "Expression" []
                              )
                            , ( "just"
                              , Type.function
                                    [ Type.namedWith [ "Elm" ] "Expression" [] ]
                                    (Type.namedWith [ "Elm" ] "Expression" [])
                              )
                            ]
                        ]
                        (Type.namedWith [ "Elm" ] "Expression" [])
                    )
            }
        )
        [ arg1
        , Elm.record
            [ Elm.field "nothing" arg2.nothing
            , Elm.field
                "just"
                (Elm.fn "maybe0" (\fn0_2_2_0 -> arg2.just fn0_2_2_0))
            ]
        ]


{-|

    Elm.fn "myResult" <|
        \myResult ->
            Elm.Case.triple myResult
                { ok =
                    \ok ->
                        Elm.string "No errors"
                , err =
                    \err ->
                        err
                }

Generates

    \myResult ->
        case myResult of
            Ok ok ->
                "No errors"

            Err err ->
                err

-}
result :
    Elm.Expression
    -> { err : Elm.Expression -> Elm.Expression
    , ok : Elm.Expression -> Elm.Expression
    }
    -> Elm.Expression
result arg1 arg2 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Elm", "Case" ]
            , name = "result"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Elm" ] "Expression" []
                        , Type.record
                            [ ( "err"
                              , Type.function
                                    [ Type.namedWith [ "Elm" ] "Expression" [] ]
                                    (Type.namedWith [ "Elm" ] "Expression" [])
                              )
                            , ( "ok"
                              , Type.function
                                    [ Type.namedWith [ "Elm" ] "Expression" [] ]
                                    (Type.namedWith [ "Elm" ] "Expression" [])
                              )
                            ]
                        ]
                        (Type.namedWith [ "Elm" ] "Expression" [])
                    )
            }
        )
        [ arg1
        , Elm.record
            [ Elm.field
                "err"
                (Elm.fn "result0" (\fn0_2_2_0 -> arg2.err fn0_2_2_0))
            , Elm.field
                "ok"
                (Elm.fn "result0" (\fn0_2_2_0 -> arg2.ok fn0_2_2_0))
            ]
        ]


{-|

    Elm.fn "myList" <|
        \myList ->
            Elm.Case.list myList
                { empty = Elm.int 0
                , nonEmpty =
                    \top remaining ->
                        Elm.plus (Elm.int 5) top
                }

Generates

    \myList ->
        case myList of
            [] ->
                0

            top :: remaining ->
                top + 5

-}
list :
    Elm.Expression
    -> { empty : Elm.Expression
    , nonEmpty : Elm.Expression -> Elm.Expression -> Elm.Expression
    }
    -> Elm.Expression
list arg1 arg2 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Elm", "Case" ]
            , name = "list"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Elm" ] "Expression" []
                        , Type.record
                            [ ( "empty"
                              , Type.namedWith [ "Elm" ] "Expression" []
                              )
                            , ( "nonEmpty"
                              , Type.function
                                    [ Type.namedWith [ "Elm" ] "Expression" []
                                    , Type.namedWith [ "Elm" ] "Expression" []
                                    ]
                                    (Type.namedWith [ "Elm" ] "Expression" [])
                              )
                            ]
                        ]
                        (Type.namedWith [ "Elm" ] "Expression" [])
                    )
            }
        )
        [ arg1
        , Elm.record
            [ Elm.field "empty" arg2.empty
            , Elm.field
                "nonEmpty"
                (Elm.fn
                    "list0"
                    (\fn0_2_2_0 ->
                        Elm.fn
                            "list1"
                            (\fn0_5_2_2_0 -> arg2.nonEmpty fn0_2_2_0 fn0_5_2_2_0
                            )
                    )
                )
            ]
        ]


{-|

    Elm.fn "myTuple" <|
        \myTuple ->
            Elm.Case.tuple myTuple
                { nothing = Elm.int 0
                , just =
                    \one two ->
                        Elm.plus (Elm.int 5) two
                }

Generates

    \myTuple ->
        case myTuple of
            ( one, two ) ->
                5 + two

-}
tuple :
    Elm.Expression
    -> (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
tuple arg1 arg2 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Elm", "Case" ]
            , name = "tuple"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Elm" ] "Expression" []
                        , Type.function
                            [ Type.namedWith [ "Elm" ] "Expression" []
                            , Type.namedWith [ "Elm" ] "Expression" []
                            ]
                            (Type.namedWith [ "Elm" ] "Expression" [])
                        ]
                        (Type.namedWith [ "Elm" ] "Expression" [])
                    )
            }
        )
        [ arg1
        , Elm.fn
            "tuple0"
            (\fn0_2_0 -> Elm.fn "tuple1" (\fn0_3_2_0 -> arg2 fn0_2_0 fn0_3_2_0))
        ]


{-|

    Elm.fn "myTriple" <|
        \myTriple ->
            Elm.Case.triple myTriple
                { nothing = Elm.int 0
                , just =
                    \one two three ->
                        Elm.plus (Elm.int 5) two
                }

Generates

    \myTriple ->
        case myTriple of
            ( one, two, three ) ->
                5 + two

-}
triple :
    Elm.Expression
    -> (Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
triple arg1 arg2 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Elm", "Case" ]
            , name = "triple"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Elm" ] "Expression" []
                        , Type.function
                            [ Type.namedWith [ "Elm" ] "Expression" []
                            , Type.namedWith [ "Elm" ] "Expression" []
                            , Type.namedWith [ "Elm" ] "Expression" []
                            ]
                            (Type.namedWith [ "Elm" ] "Expression" [])
                        ]
                        (Type.namedWith [ "Elm" ] "Expression" [])
                    )
            }
        )
        [ arg1
        , Elm.fn
            "triple0"
            (\fn0_2_0 ->
                Elm.fn
                    "triple1"
                    (\fn0_3_2_0 ->
                        Elm.fn
                            "triple2"
                            (\fn0_2_3_2_0 -> arg2 fn0_2_0 fn0_3_2_0 fn0_2_3_2_0)
                    )
            )
        ]


{-|

    Elm.fn "maybeString" <|
        \maybeString ->
            Elm.Case.custom maybeString
                [ Elm.Case.branch [ "Maybe" ]
                    "Nothing"
                    (Elm.string "It's nothing, I swear!")
                , Elm.Case.branch2 [ "Maybe" ] "Just" <|
                    \just ->
                        Elm.append (Elm.string "Actually, it's: ") just
                ]

Generates

    \maybeString ->
        case maybeString of
            Nothing ->
                "It's nothing, I swear!"

            Just just ->
                "Actually, it's " ++ just

-}
custom : Elm.Expression -> List Elm.Expression -> Elm.Expression
custom arg1 arg2 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Elm", "Case" ]
            , name = "custom"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Elm" ] "Expression" []
                        , Type.list
                            (Type.namedWith [ "Elm", "Case" ] "Branch" [])
                        ]
                        (Type.namedWith [ "Elm" ] "Expression" [])
                    )
            }
        )
        [ arg1, Elm.list arg2 ]


{-| A catchall branch in case you want the case to be nonexhaustive.
-}
otherwise : (Elm.Expression -> Elm.Expression) -> Elm.Expression
otherwise arg1 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Elm", "Case" ]
            , name = "otherwise"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.namedWith [ "Elm" ] "Expression" [] ]
                            (Type.namedWith [ "Elm" ] "Expression" [])
                        ]
                        (Type.namedWith [ "Elm", "Case" ] "Branch" [])
                    )
            }
        )
        [ Elm.fn "otherwise0" (\fn0_2_0 -> arg1 fn0_2_0) ]


{-| -}
branch0 :
    List Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
branch0 arg1 arg2 arg3 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Elm", "Case" ]
            , name = "branch0"
            , annotation =
                Just
                    (Type.function
                        [ Type.list Type.string
                        , Type.string
                        , Type.namedWith [ "Elm" ] "Expression" []
                        ]
                        (Type.namedWith [ "Elm", "Case" ] "Branch" [])
                    )
            }
        )
        [ Elm.list arg1, arg2, arg3 ]


{-| -}
branch1 :
    List Elm.Expression
    -> Elm.Expression
    -> (Elm.Expression -> Elm.Expression)
    -> Elm.Expression
branch1 arg1 arg2 arg3 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Elm", "Case" ]
            , name = "branch1"
            , annotation =
                Just
                    (Type.function
                        [ Type.list Type.string
                        , Type.string
                        , Type.function
                            [ Type.namedWith [ "Elm" ] "Expression" [] ]
                            (Type.namedWith [ "Elm" ] "Expression" [])
                        ]
                        (Type.namedWith [ "Elm", "Case" ] "Branch" [])
                    )
            }
        )
        [ Elm.list arg1, arg2, Elm.fn "branch10" (\fn0_2_0 -> arg3 fn0_2_0) ]


{-| -}
branch2 :
    List Elm.Expression
    -> Elm.Expression
    -> (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
branch2 arg1 arg2 arg3 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Elm", "Case" ]
            , name = "branch2"
            , annotation =
                Just
                    (Type.function
                        [ Type.list Type.string
                        , Type.string
                        , Type.function
                            [ Type.namedWith [ "Elm" ] "Expression" []
                            , Type.namedWith [ "Elm" ] "Expression" []
                            ]
                            (Type.namedWith [ "Elm" ] "Expression" [])
                        ]
                        (Type.namedWith [ "Elm", "Case" ] "Branch" [])
                    )
            }
        )
        [ Elm.list arg1
        , arg2
        , Elm.fn
            "branch20"
            (\fn0_2_0 ->
                Elm.fn "branch21" (\fn0_4_2_0 -> arg3 fn0_2_0 fn0_4_2_0)
            )
        ]


{-| -}
branch3 :
    List Elm.Expression
    -> Elm.Expression
    -> (Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
branch3 arg1 arg2 arg3 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Elm", "Case" ]
            , name = "branch3"
            , annotation =
                Just
                    (Type.function
                        [ Type.list Type.string
                        , Type.string
                        , Type.function
                            [ Type.namedWith [ "Elm" ] "Expression" []
                            , Type.namedWith [ "Elm" ] "Expression" []
                            , Type.namedWith [ "Elm" ] "Expression" []
                            ]
                            (Type.namedWith [ "Elm" ] "Expression" [])
                        ]
                        (Type.namedWith [ "Elm", "Case" ] "Branch" [])
                    )
            }
        )
        [ Elm.list arg1
        , arg2
        , Elm.fn
            "branch30"
            (\fn0_2_0 ->
                Elm.fn
                    "branch31"
                    (\fn0_4_2_0 ->
                        Elm.fn
                            "branch32"
                            (\fn0_2_4_2_0 -> arg3 fn0_2_0 fn0_4_2_0 fn0_2_4_2_0)
                    )
            )
        ]


{-| -}
branch4 :
    List Elm.Expression
    -> Elm.Expression
    -> (Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression)
    -> Elm.Expression
branch4 arg1 arg2 arg3 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Elm", "Case" ]
            , name = "branch4"
            , annotation =
                Just
                    (Type.function
                        [ Type.list Type.string
                        , Type.string
                        , Type.function
                            [ Type.namedWith [ "Elm" ] "Expression" []
                            , Type.namedWith [ "Elm" ] "Expression" []
                            , Type.namedWith [ "Elm" ] "Expression" []
                            , Type.namedWith [ "Elm" ] "Expression" []
                            ]
                            (Type.namedWith [ "Elm" ] "Expression" [])
                        ]
                        (Type.namedWith [ "Elm", "Case" ] "Branch" [])
                    )
            }
        )
        [ Elm.list arg1
        , arg2
        , Elm.fn
            "branch40"
            (\fn0_2_0 ->
                Elm.fn
                    "branch41"
                    (\fn0_4_2_0 ->
                        Elm.fn
                            "branch42"
                            (\fn0_2_4_2_0 ->
                                Elm.fn
                                    "branch43"
                                    (\fn0_2_2_4_2_0 ->
                                        arg3 fn0_2_0 fn0_4_2_0 fn0_2_4_2_0
                                            fn0_2_2_4_2_0
                                    )
                            )
                    )
            )
        ]


{-| -}
branch5 :
    List Elm.Expression
    -> Elm.Expression
    -> (Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression)
    -> Elm.Expression
branch5 arg1 arg2 arg3 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Elm", "Case" ]
            , name = "branch5"
            , annotation =
                Just
                    (Type.function
                        [ Type.list Type.string
                        , Type.string
                        , Type.function
                            [ Type.namedWith [ "Elm" ] "Expression" []
                            , Type.namedWith [ "Elm" ] "Expression" []
                            , Type.namedWith [ "Elm" ] "Expression" []
                            , Type.namedWith [ "Elm" ] "Expression" []
                            , Type.namedWith [ "Elm" ] "Expression" []
                            ]
                            (Type.namedWith [ "Elm" ] "Expression" [])
                        ]
                        (Type.namedWith [ "Elm", "Case" ] "Branch" [])
                    )
            }
        )
        [ Elm.list arg1
        , arg2
        , Elm.fn
            "branch50"
            (\fn0_2_0 ->
                Elm.fn
                    "branch51"
                    (\fn0_4_2_0 ->
                        Elm.fn
                            "branch52"
                            (\fn0_2_4_2_0 ->
                                Elm.fn
                                    "branch53"
                                    (\fn0_2_2_4_2_0 ->
                                        Elm.fn
                                            "branch54"
                                            (\fn0_2_2_2_4_2_0 ->
                                                arg3 fn0_2_0 fn0_4_2_0
                                                    fn0_2_4_2_0
                                                    fn0_2_2_4_2_0
                                                    fn0_2_2_2_4_2_0
                                            )
                                    )
                            )
                    )
            )
        ]


{-| -}
branch6 :
    List Elm.Expression
    -> Elm.Expression
    -> (Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression)
    -> Elm.Expression
branch6 arg1 arg2 arg3 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Elm", "Case" ]
            , name = "branch6"
            , annotation =
                Just
                    (Type.function
                        [ Type.list Type.string
                        , Type.string
                        , Type.function
                            [ Type.namedWith [ "Elm" ] "Expression" []
                            , Type.namedWith [ "Elm" ] "Expression" []
                            , Type.namedWith [ "Elm" ] "Expression" []
                            , Type.namedWith [ "Elm" ] "Expression" []
                            , Type.namedWith [ "Elm" ] "Expression" []
                            , Type.namedWith [ "Elm" ] "Expression" []
                            ]
                            (Type.namedWith [ "Elm" ] "Expression" [])
                        ]
                        (Type.namedWith [ "Elm", "Case" ] "Branch" [])
                    )
            }
        )
        [ Elm.list arg1
        , arg2
        , Elm.fn
            "branch60"
            (\fn0_2_0 ->
                Elm.fn
                    "branch61"
                    (\fn0_4_2_0 ->
                        Elm.fn
                            "branch62"
                            (\fn0_2_4_2_0 ->
                                Elm.fn
                                    "branch63"
                                    (\fn0_2_2_4_2_0 ->
                                        Elm.fn
                                            "branch64"
                                            (\fn0_2_2_2_4_2_0 ->
                                                Elm.fn
                                                    "branch65"
                                                    (\fn0_2_2_2_2_4_2_0 ->
                                                        arg3 fn0_2_0 fn0_4_2_0
                                                            fn0_2_4_2_0
                                                            fn0_2_2_4_2_0
                                                            fn0_2_2_2_4_2_0
                                                            fn0_2_2_2_2_4_2_0
                                                    )
                                            )
                                    )
                            )
                    )
            )
        ]


{-| -}
branchWith :
    List Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> (Elm.Expression -> Elm.Expression)
    -> Elm.Expression
branchWith arg1 arg2 arg3 arg4 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Elm", "Case" ]
            , name = "branchWith"
            , annotation =
                Just
                    (Type.function
                        [ Type.list Type.string
                        , Type.string
                        , Type.int
                        , Type.function
                            [ Type.list
                                (Type.namedWith [ "Elm" ] "Expression" [])
                            ]
                            (Type.namedWith [ "Elm" ] "Expression" [])
                        ]
                        (Type.namedWith [ "Elm", "Case" ] "Branch" [])
                    )
            }
        )
        [ Elm.list arg1
        , arg2
        , arg3
        , Elm.fn "branchWith0" (\fn0_2_0 -> arg4 fn0_2_0)
        ]


{-| -}
listBranch :
    Elm.Expression -> (Elm.Expression -> Elm.Expression) -> Elm.Expression
listBranch arg1 arg2 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Elm", "Case" ]
            , name = "listBranch"
            , annotation =
                Just
                    (Type.function
                        [ Type.int
                        , Type.function
                            [ Type.list
                                (Type.namedWith [ "Elm" ] "Expression" [])
                            ]
                            (Type.namedWith [ "Elm" ] "Expression" [])
                        ]
                        (Type.namedWith [ "Elm", "Case" ] "Branch" [])
                    )
            }
        )
        [ arg1, Elm.fn "listBranch0" (\fn0_2_0 -> arg2 fn0_2_0) ]


annotation_ : { branch : Type.Annotation }
annotation_ =
    { branch = Type.namedWith moduleName_ "Branch" [] }


call_ :
    { maybe : Elm.Expression -> Elm.Expression -> Elm.Expression
    , result : Elm.Expression -> Elm.Expression -> Elm.Expression
    , list : Elm.Expression -> Elm.Expression -> Elm.Expression
    , tuple : Elm.Expression -> Elm.Expression -> Elm.Expression
    , triple : Elm.Expression -> Elm.Expression -> Elm.Expression
    , custom : Elm.Expression -> Elm.Expression -> Elm.Expression
    , otherwise : Elm.Expression -> Elm.Expression
    , branch0 :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , branch1 :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , branch2 :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , branch3 :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , branch4 :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , branch5 :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , branch6 :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , branchWith :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , listBranch : Elm.Expression -> Elm.Expression -> Elm.Expression
    }
call_ =
    { maybe =
        \arg1_0 arg2_0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Elm", "Case" ]
                    , name = "maybe"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [ "Elm" ] "Expression" []
                                , Type.record
                                    [ ( "nothing"
                                      , Type.namedWith [ "Elm" ] "Expression" []
                                      )
                                    , ( "just"
                                      , Type.function
                                            [ Type.namedWith
                                                [ "Elm" ]
                                                "Expression"
                                                []
                                            ]
                                            (Type.namedWith
                                                [ "Elm" ]
                                                "Expression"
                                                []
                                            )
                                      )
                                    ]
                                ]
                                (Type.namedWith [ "Elm" ] "Expression" [])
                            )
                    }
                )
                [ arg1_0, arg2_0 ]
    , result =
        \arg1_0 arg2_0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Elm", "Case" ]
                    , name = "result"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [ "Elm" ] "Expression" []
                                , Type.record
                                    [ ( "err"
                                      , Type.function
                                            [ Type.namedWith
                                                [ "Elm" ]
                                                "Expression"
                                                []
                                            ]
                                            (Type.namedWith
                                                [ "Elm" ]
                                                "Expression"
                                                []
                                            )
                                      )
                                    , ( "ok"
                                      , Type.function
                                            [ Type.namedWith
                                                [ "Elm" ]
                                                "Expression"
                                                []
                                            ]
                                            (Type.namedWith
                                                [ "Elm" ]
                                                "Expression"
                                                []
                                            )
                                      )
                                    ]
                                ]
                                (Type.namedWith [ "Elm" ] "Expression" [])
                            )
                    }
                )
                [ arg1_0, arg2_0 ]
    , list =
        \arg1_0 arg2_0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Elm", "Case" ]
                    , name = "list"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [ "Elm" ] "Expression" []
                                , Type.record
                                    [ ( "empty"
                                      , Type.namedWith [ "Elm" ] "Expression" []
                                      )
                                    , ( "nonEmpty"
                                      , Type.function
                                            [ Type.namedWith
                                                [ "Elm" ]
                                                "Expression"
                                                []
                                            , Type.namedWith
                                                [ "Elm" ]
                                                "Expression"
                                                []
                                            ]
                                            (Type.namedWith
                                                [ "Elm" ]
                                                "Expression"
                                                []
                                            )
                                      )
                                    ]
                                ]
                                (Type.namedWith [ "Elm" ] "Expression" [])
                            )
                    }
                )
                [ arg1_0, arg2_0 ]
    , tuple =
        \arg1_0 arg2_0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Elm", "Case" ]
                    , name = "tuple"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [ "Elm" ] "Expression" []
                                , Type.function
                                    [ Type.namedWith [ "Elm" ] "Expression" []
                                    , Type.namedWith [ "Elm" ] "Expression" []
                                    ]
                                    (Type.namedWith [ "Elm" ] "Expression" [])
                                ]
                                (Type.namedWith [ "Elm" ] "Expression" [])
                            )
                    }
                )
                [ arg1_0, arg2_0 ]
    , triple =
        \arg1_0 arg2_0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Elm", "Case" ]
                    , name = "triple"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [ "Elm" ] "Expression" []
                                , Type.function
                                    [ Type.namedWith [ "Elm" ] "Expression" []
                                    , Type.namedWith [ "Elm" ] "Expression" []
                                    , Type.namedWith [ "Elm" ] "Expression" []
                                    ]
                                    (Type.namedWith [ "Elm" ] "Expression" [])
                                ]
                                (Type.namedWith [ "Elm" ] "Expression" [])
                            )
                    }
                )
                [ arg1_0, arg2_0 ]
    , custom =
        \arg1_0 arg2_0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Elm", "Case" ]
                    , name = "custom"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [ "Elm" ] "Expression" []
                                , Type.list
                                    (Type.namedWith
                                        [ "Elm", "Case" ]
                                        "Branch"
                                        []
                                    )
                                ]
                                (Type.namedWith [ "Elm" ] "Expression" [])
                            )
                    }
                )
                [ arg1_0, arg2_0 ]
    , otherwise =
        \arg1_0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Elm", "Case" ]
                    , name = "otherwise"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.namedWith [ "Elm" ] "Expression" [] ]
                                    (Type.namedWith [ "Elm" ] "Expression" [])
                                ]
                                (Type.namedWith [ "Elm", "Case" ] "Branch" [])
                            )
                    }
                )
                [ arg1_0 ]
    , branch0 =
        \arg1_0 arg2_0 arg3_0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Elm", "Case" ]
                    , name = "branch0"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.list Type.string
                                , Type.string
                                , Type.namedWith [ "Elm" ] "Expression" []
                                ]
                                (Type.namedWith [ "Elm", "Case" ] "Branch" [])
                            )
                    }
                )
                [ arg1_0, arg2_0, arg3_0 ]
    , branch1 =
        \arg1_0 arg2_0 arg3_0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Elm", "Case" ]
                    , name = "branch1"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.list Type.string
                                , Type.string
                                , Type.function
                                    [ Type.namedWith [ "Elm" ] "Expression" [] ]
                                    (Type.namedWith [ "Elm" ] "Expression" [])
                                ]
                                (Type.namedWith [ "Elm", "Case" ] "Branch" [])
                            )
                    }
                )
                [ arg1_0, arg2_0, arg3_0 ]
    , branch2 =
        \arg1_0 arg2_0 arg3_0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Elm", "Case" ]
                    , name = "branch2"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.list Type.string
                                , Type.string
                                , Type.function
                                    [ Type.namedWith [ "Elm" ] "Expression" []
                                    , Type.namedWith [ "Elm" ] "Expression" []
                                    ]
                                    (Type.namedWith [ "Elm" ] "Expression" [])
                                ]
                                (Type.namedWith [ "Elm", "Case" ] "Branch" [])
                            )
                    }
                )
                [ arg1_0, arg2_0, arg3_0 ]
    , branch3 =
        \arg1_0 arg2_0 arg3_0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Elm", "Case" ]
                    , name = "branch3"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.list Type.string
                                , Type.string
                                , Type.function
                                    [ Type.namedWith [ "Elm" ] "Expression" []
                                    , Type.namedWith [ "Elm" ] "Expression" []
                                    , Type.namedWith [ "Elm" ] "Expression" []
                                    ]
                                    (Type.namedWith [ "Elm" ] "Expression" [])
                                ]
                                (Type.namedWith [ "Elm", "Case" ] "Branch" [])
                            )
                    }
                )
                [ arg1_0, arg2_0, arg3_0 ]
    , branch4 =
        \arg1_0 arg2_0 arg3_0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Elm", "Case" ]
                    , name = "branch4"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.list Type.string
                                , Type.string
                                , Type.function
                                    [ Type.namedWith [ "Elm" ] "Expression" []
                                    , Type.namedWith [ "Elm" ] "Expression" []
                                    , Type.namedWith [ "Elm" ] "Expression" []
                                    , Type.namedWith [ "Elm" ] "Expression" []
                                    ]
                                    (Type.namedWith [ "Elm" ] "Expression" [])
                                ]
                                (Type.namedWith [ "Elm", "Case" ] "Branch" [])
                            )
                    }
                )
                [ arg1_0, arg2_0, arg3_0 ]
    , branch5 =
        \arg1_0 arg2_0 arg3_0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Elm", "Case" ]
                    , name = "branch5"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.list Type.string
                                , Type.string
                                , Type.function
                                    [ Type.namedWith [ "Elm" ] "Expression" []
                                    , Type.namedWith [ "Elm" ] "Expression" []
                                    , Type.namedWith [ "Elm" ] "Expression" []
                                    , Type.namedWith [ "Elm" ] "Expression" []
                                    , Type.namedWith [ "Elm" ] "Expression" []
                                    ]
                                    (Type.namedWith [ "Elm" ] "Expression" [])
                                ]
                                (Type.namedWith [ "Elm", "Case" ] "Branch" [])
                            )
                    }
                )
                [ arg1_0, arg2_0, arg3_0 ]
    , branch6 =
        \arg1_0 arg2_0 arg3_0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Elm", "Case" ]
                    , name = "branch6"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.list Type.string
                                , Type.string
                                , Type.function
                                    [ Type.namedWith [ "Elm" ] "Expression" []
                                    , Type.namedWith [ "Elm" ] "Expression" []
                                    , Type.namedWith [ "Elm" ] "Expression" []
                                    , Type.namedWith [ "Elm" ] "Expression" []
                                    , Type.namedWith [ "Elm" ] "Expression" []
                                    , Type.namedWith [ "Elm" ] "Expression" []
                                    ]
                                    (Type.namedWith [ "Elm" ] "Expression" [])
                                ]
                                (Type.namedWith [ "Elm", "Case" ] "Branch" [])
                            )
                    }
                )
                [ arg1_0, arg2_0, arg3_0 ]
    , branchWith =
        \arg1_0 arg2_0 arg3_0 arg4_0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Elm", "Case" ]
                    , name = "branchWith"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.list Type.string
                                , Type.string
                                , Type.int
                                , Type.function
                                    [ Type.list
                                        (Type.namedWith
                                            [ "Elm" ]
                                            "Expression"
                                            []
                                        )
                                    ]
                                    (Type.namedWith [ "Elm" ] "Expression" [])
                                ]
                                (Type.namedWith [ "Elm", "Case" ] "Branch" [])
                            )
                    }
                )
                [ arg1_0, arg2_0, arg3_0, arg4_0 ]
    , listBranch =
        \arg1_0 arg2_0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Elm", "Case" ]
                    , name = "listBranch"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.int
                                , Type.function
                                    [ Type.list
                                        (Type.namedWith
                                            [ "Elm" ]
                                            "Expression"
                                            []
                                        )
                                    ]
                                    (Type.namedWith [ "Elm" ] "Expression" [])
                                ]
                                (Type.namedWith [ "Elm", "Case" ] "Branch" [])
                            )
                    }
                )
                [ arg1_0, arg2_0 ]
    }


values_ :
    { maybe : Elm.Expression
    , result : Elm.Expression
    , list : Elm.Expression
    , tuple : Elm.Expression
    , triple : Elm.Expression
    , custom : Elm.Expression
    , otherwise : Elm.Expression
    , branch0 : Elm.Expression
    , branch1 : Elm.Expression
    , branch2 : Elm.Expression
    , branch3 : Elm.Expression
    , branch4 : Elm.Expression
    , branch5 : Elm.Expression
    , branch6 : Elm.Expression
    , branchWith : Elm.Expression
    , listBranch : Elm.Expression
    }
values_ =
    { maybe =
        Elm.value
            { importFrom = [ "Elm", "Case" ]
            , name = "maybe"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Elm" ] "Expression" []
                        , Type.record
                            [ ( "nothing"
                              , Type.namedWith [ "Elm" ] "Expression" []
                              )
                            , ( "just"
                              , Type.function
                                    [ Type.namedWith [ "Elm" ] "Expression" [] ]
                                    (Type.namedWith [ "Elm" ] "Expression" [])
                              )
                            ]
                        ]
                        (Type.namedWith [ "Elm" ] "Expression" [])
                    )
            }
    , result =
        Elm.value
            { importFrom = [ "Elm", "Case" ]
            , name = "result"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Elm" ] "Expression" []
                        , Type.record
                            [ ( "err"
                              , Type.function
                                    [ Type.namedWith [ "Elm" ] "Expression" [] ]
                                    (Type.namedWith [ "Elm" ] "Expression" [])
                              )
                            , ( "ok"
                              , Type.function
                                    [ Type.namedWith [ "Elm" ] "Expression" [] ]
                                    (Type.namedWith [ "Elm" ] "Expression" [])
                              )
                            ]
                        ]
                        (Type.namedWith [ "Elm" ] "Expression" [])
                    )
            }
    , list =
        Elm.value
            { importFrom = [ "Elm", "Case" ]
            , name = "list"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Elm" ] "Expression" []
                        , Type.record
                            [ ( "empty"
                              , Type.namedWith [ "Elm" ] "Expression" []
                              )
                            , ( "nonEmpty"
                              , Type.function
                                    [ Type.namedWith [ "Elm" ] "Expression" []
                                    , Type.namedWith [ "Elm" ] "Expression" []
                                    ]
                                    (Type.namedWith [ "Elm" ] "Expression" [])
                              )
                            ]
                        ]
                        (Type.namedWith [ "Elm" ] "Expression" [])
                    )
            }
    , tuple =
        Elm.value
            { importFrom = [ "Elm", "Case" ]
            , name = "tuple"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Elm" ] "Expression" []
                        , Type.function
                            [ Type.namedWith [ "Elm" ] "Expression" []
                            , Type.namedWith [ "Elm" ] "Expression" []
                            ]
                            (Type.namedWith [ "Elm" ] "Expression" [])
                        ]
                        (Type.namedWith [ "Elm" ] "Expression" [])
                    )
            }
    , triple =
        Elm.value
            { importFrom = [ "Elm", "Case" ]
            , name = "triple"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Elm" ] "Expression" []
                        , Type.function
                            [ Type.namedWith [ "Elm" ] "Expression" []
                            , Type.namedWith [ "Elm" ] "Expression" []
                            , Type.namedWith [ "Elm" ] "Expression" []
                            ]
                            (Type.namedWith [ "Elm" ] "Expression" [])
                        ]
                        (Type.namedWith [ "Elm" ] "Expression" [])
                    )
            }
    , custom =
        Elm.value
            { importFrom = [ "Elm", "Case" ]
            , name = "custom"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Elm" ] "Expression" []
                        , Type.list
                            (Type.namedWith [ "Elm", "Case" ] "Branch" [])
                        ]
                        (Type.namedWith [ "Elm" ] "Expression" [])
                    )
            }
    , otherwise =
        Elm.value
            { importFrom = [ "Elm", "Case" ]
            , name = "otherwise"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.namedWith [ "Elm" ] "Expression" [] ]
                            (Type.namedWith [ "Elm" ] "Expression" [])
                        ]
                        (Type.namedWith [ "Elm", "Case" ] "Branch" [])
                    )
            }
    , branch0 =
        Elm.value
            { importFrom = [ "Elm", "Case" ]
            , name = "branch0"
            , annotation =
                Just
                    (Type.function
                        [ Type.list Type.string
                        , Type.string
                        , Type.namedWith [ "Elm" ] "Expression" []
                        ]
                        (Type.namedWith [ "Elm", "Case" ] "Branch" [])
                    )
            }
    , branch1 =
        Elm.value
            { importFrom = [ "Elm", "Case" ]
            , name = "branch1"
            , annotation =
                Just
                    (Type.function
                        [ Type.list Type.string
                        , Type.string
                        , Type.function
                            [ Type.namedWith [ "Elm" ] "Expression" [] ]
                            (Type.namedWith [ "Elm" ] "Expression" [])
                        ]
                        (Type.namedWith [ "Elm", "Case" ] "Branch" [])
                    )
            }
    , branch2 =
        Elm.value
            { importFrom = [ "Elm", "Case" ]
            , name = "branch2"
            , annotation =
                Just
                    (Type.function
                        [ Type.list Type.string
                        , Type.string
                        , Type.function
                            [ Type.namedWith [ "Elm" ] "Expression" []
                            , Type.namedWith [ "Elm" ] "Expression" []
                            ]
                            (Type.namedWith [ "Elm" ] "Expression" [])
                        ]
                        (Type.namedWith [ "Elm", "Case" ] "Branch" [])
                    )
            }
    , branch3 =
        Elm.value
            { importFrom = [ "Elm", "Case" ]
            , name = "branch3"
            , annotation =
                Just
                    (Type.function
                        [ Type.list Type.string
                        , Type.string
                        , Type.function
                            [ Type.namedWith [ "Elm" ] "Expression" []
                            , Type.namedWith [ "Elm" ] "Expression" []
                            , Type.namedWith [ "Elm" ] "Expression" []
                            ]
                            (Type.namedWith [ "Elm" ] "Expression" [])
                        ]
                        (Type.namedWith [ "Elm", "Case" ] "Branch" [])
                    )
            }
    , branch4 =
        Elm.value
            { importFrom = [ "Elm", "Case" ]
            , name = "branch4"
            , annotation =
                Just
                    (Type.function
                        [ Type.list Type.string
                        , Type.string
                        , Type.function
                            [ Type.namedWith [ "Elm" ] "Expression" []
                            , Type.namedWith [ "Elm" ] "Expression" []
                            , Type.namedWith [ "Elm" ] "Expression" []
                            , Type.namedWith [ "Elm" ] "Expression" []
                            ]
                            (Type.namedWith [ "Elm" ] "Expression" [])
                        ]
                        (Type.namedWith [ "Elm", "Case" ] "Branch" [])
                    )
            }
    , branch5 =
        Elm.value
            { importFrom = [ "Elm", "Case" ]
            , name = "branch5"
            , annotation =
                Just
                    (Type.function
                        [ Type.list Type.string
                        , Type.string
                        , Type.function
                            [ Type.namedWith [ "Elm" ] "Expression" []
                            , Type.namedWith [ "Elm" ] "Expression" []
                            , Type.namedWith [ "Elm" ] "Expression" []
                            , Type.namedWith [ "Elm" ] "Expression" []
                            , Type.namedWith [ "Elm" ] "Expression" []
                            ]
                            (Type.namedWith [ "Elm" ] "Expression" [])
                        ]
                        (Type.namedWith [ "Elm", "Case" ] "Branch" [])
                    )
            }
    , branch6 =
        Elm.value
            { importFrom = [ "Elm", "Case" ]
            , name = "branch6"
            , annotation =
                Just
                    (Type.function
                        [ Type.list Type.string
                        , Type.string
                        , Type.function
                            [ Type.namedWith [ "Elm" ] "Expression" []
                            , Type.namedWith [ "Elm" ] "Expression" []
                            , Type.namedWith [ "Elm" ] "Expression" []
                            , Type.namedWith [ "Elm" ] "Expression" []
                            , Type.namedWith [ "Elm" ] "Expression" []
                            , Type.namedWith [ "Elm" ] "Expression" []
                            ]
                            (Type.namedWith [ "Elm" ] "Expression" [])
                        ]
                        (Type.namedWith [ "Elm", "Case" ] "Branch" [])
                    )
            }
    , branchWith =
        Elm.value
            { importFrom = [ "Elm", "Case" ]
            , name = "branchWith"
            , annotation =
                Just
                    (Type.function
                        [ Type.list Type.string
                        , Type.string
                        , Type.int
                        , Type.function
                            [ Type.list
                                (Type.namedWith [ "Elm" ] "Expression" [])
                            ]
                            (Type.namedWith [ "Elm" ] "Expression" [])
                        ]
                        (Type.namedWith [ "Elm", "Case" ] "Branch" [])
                    )
            }
    , listBranch =
        Elm.value
            { importFrom = [ "Elm", "Case" ]
            , name = "listBranch"
            , annotation =
                Just
                    (Type.function
                        [ Type.int
                        , Type.function
                            [ Type.list
                                (Type.namedWith [ "Elm" ] "Expression" [])
                            ]
                            (Type.namedWith [ "Elm" ] "Expression" [])
                        ]
                        (Type.namedWith [ "Elm", "Case" ] "Branch" [])
                    )
            }
    }


