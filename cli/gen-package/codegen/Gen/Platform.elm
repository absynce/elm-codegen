module Gen.Platform exposing (annotation_, call_, moduleName_, sendToApp, sendToSelf, values_, worker)

{-| 
@docs moduleName_, worker, sendToApp, sendToSelf, annotation_, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Platform" ]


{-| Create a [headless][] program with no user interface.

This is great if you want to use Elm as the &ldquo;brain&rdquo; for something
else. For example, you could send messages out ports to modify the DOM, but do
all the complex logic in Elm.

[headless]: https://en.wikipedia.org/wiki/Headless_software

Initializing a headless program from JavaScript looks like this:

```javascript
var app = Elm.MyThing.init();
```

If you _do_ want to control the user interface in Elm, the [`Browser`][browser]
module has a few ways to create that kind of `Program` instead!

[headless]: https://en.wikipedia.org/wiki/Headless_software
[browser]: /packages/elm/browser/latest/Browser
-}
worker :
    { init : Elm.Expression -> Elm.Expression
    , update : Elm.Expression -> Elm.Expression -> Elm.Expression
    , subscriptions : Elm.Expression -> Elm.Expression
    }
    -> Elm.Expression
worker arg1 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Platform" ]
            , name = "worker"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "init"
                              , Type.function
                                    [ Type.var "flags" ]
                                    (Type.tuple
                                        (Type.var "model")
                                        (Type.namedWith
                                            [ "Platform", "Cmd" ]
                                            "Cmd"
                                            [ Type.var "msg" ]
                                        )
                                    )
                              )
                            , ( "update"
                              , Type.function
                                    [ Type.var "msg", Type.var "model" ]
                                    (Type.tuple
                                        (Type.var "model")
                                        (Type.namedWith
                                            [ "Platform", "Cmd" ]
                                            "Cmd"
                                            [ Type.var "msg" ]
                                        )
                                    )
                              )
                            , ( "subscriptions"
                              , Type.function
                                    [ Type.var "model" ]
                                    (Type.namedWith
                                        [ "Platform", "Sub" ]
                                        "Sub"
                                        [ Type.var "msg" ]
                                    )
                              )
                            ]
                        ]
                        (Type.namedWith
                            [ "Platform" ]
                            "Program"
                            [ Type.var "flags"
                            , Type.var "model"
                            , Type.var "msg"
                            ]
                        )
                    )
            }
        )
        [ Elm.record
            [ Elm.field
                "init"
                (Elm.fn "worker0" (\fn0_1_2_0 -> arg1.init fn0_1_2_0))
            , Elm.field
                "update"
                (Elm.fn
                    "worker0"
                    (\fn0_1_2_0 ->
                        Elm.fn
                            "worker1"
                            (\fn0_5_1_2_0 -> arg1.update fn0_1_2_0 fn0_5_1_2_0)
                    )
                )
            , Elm.field
                "subscriptions"
                (Elm.fn "worker0" (\fn0_1_2_0 -> arg1.subscriptions fn0_1_2_0))
            ]
        ]


{-| Send the router a message for the main loop of your app. This message will
be handled by the overall `update` function, just like events from `Html`.
-}
sendToApp : Elm.Expression -> Elm.Expression -> Elm.Expression
sendToApp arg1 arg2 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Platform" ]
            , name = "sendToApp"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Platform" ]
                            "Router"
                            [ Type.var "msg", Type.var "a" ]
                        , Type.var "msg"
                        ]
                        (Type.namedWith
                            [ "Platform" ]
                            "Task"
                            [ Type.var "x", Type.unit ]
                        )
                    )
            }
        )
        [ arg1, arg2 ]


{-| Send the router a message for your effect manager. This message will
be routed to the `onSelfMsg` function, where you can update the state of your
effect manager as necessary.

As an example, the effect manager for web sockets
-}
sendToSelf : Elm.Expression -> Elm.Expression -> Elm.Expression
sendToSelf arg1 arg2 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Platform" ]
            , name = "sendToSelf"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Platform" ]
                            "Router"
                            [ Type.var "a", Type.var "msg" ]
                        , Type.var "msg"
                        ]
                        (Type.namedWith
                            [ "Platform" ]
                            "Task"
                            [ Type.var "x", Type.unit ]
                        )
                    )
            }
        )
        [ arg1, arg2 ]


annotation_ :
    { program :
        Type.Annotation -> Type.Annotation -> Type.Annotation -> Type.Annotation
    , task : Type.Annotation -> Type.Annotation -> Type.Annotation
    , processId : Type.Annotation
    , router : Type.Annotation -> Type.Annotation -> Type.Annotation
    }
annotation_ =
    { program =
        \arg0_0 arg1_0 arg2_0 ->
            Type.namedWith moduleName_ "Program" [ arg0_0, arg1_0, arg2_0 ]
    , task =
        \arg0_0 arg1_0 -> Type.namedWith moduleName_ "Task" [ arg0_0, arg1_0 ]
    , processId = Type.namedWith moduleName_ "ProcessId" []
    , router =
        \arg0_0 arg1_0 -> Type.namedWith moduleName_ "Router" [ arg0_0, arg1_0 ]
    }


call_ :
    { worker : Elm.Expression -> Elm.Expression
    , sendToApp : Elm.Expression -> Elm.Expression -> Elm.Expression
    , sendToSelf : Elm.Expression -> Elm.Expression -> Elm.Expression
    }
call_ =
    { worker =
        \arg1_0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Platform" ]
                    , name = "worker"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.record
                                    [ ( "init"
                                      , Type.function
                                            [ Type.var "flags" ]
                                            (Type.tuple
                                                (Type.var "model")
                                                (Type.namedWith
                                                    [ "Platform", "Cmd" ]
                                                    "Cmd"
                                                    [ Type.var "msg" ]
                                                )
                                            )
                                      )
                                    , ( "update"
                                      , Type.function
                                            [ Type.var "msg", Type.var "model" ]
                                            (Type.tuple
                                                (Type.var "model")
                                                (Type.namedWith
                                                    [ "Platform", "Cmd" ]
                                                    "Cmd"
                                                    [ Type.var "msg" ]
                                                )
                                            )
                                      )
                                    , ( "subscriptions"
                                      , Type.function
                                            [ Type.var "model" ]
                                            (Type.namedWith
                                                [ "Platform", "Sub" ]
                                                "Sub"
                                                [ Type.var "msg" ]
                                            )
                                      )
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Platform" ]
                                    "Program"
                                    [ Type.var "flags"
                                    , Type.var "model"
                                    , Type.var "msg"
                                    ]
                                )
                            )
                    }
                )
                [ arg1_0 ]
    , sendToApp =
        \arg1_0 arg2_0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Platform" ]
                    , name = "sendToApp"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "Platform" ]
                                    "Router"
                                    [ Type.var "msg", Type.var "a" ]
                                , Type.var "msg"
                                ]
                                (Type.namedWith
                                    [ "Platform" ]
                                    "Task"
                                    [ Type.var "x", Type.unit ]
                                )
                            )
                    }
                )
                [ arg1_0, arg2_0 ]
    , sendToSelf =
        \arg1_0 arg2_0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Platform" ]
                    , name = "sendToSelf"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "Platform" ]
                                    "Router"
                                    [ Type.var "a", Type.var "msg" ]
                                , Type.var "msg"
                                ]
                                (Type.namedWith
                                    [ "Platform" ]
                                    "Task"
                                    [ Type.var "x", Type.unit ]
                                )
                            )
                    }
                )
                [ arg1_0, arg2_0 ]
    }


values_ :
    { worker : Elm.Expression
    , sendToApp : Elm.Expression
    , sendToSelf : Elm.Expression
    }
values_ =
    { worker =
        Elm.value
            { importFrom = [ "Platform" ]
            , name = "worker"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "init"
                              , Type.function
                                    [ Type.var "flags" ]
                                    (Type.tuple
                                        (Type.var "model")
                                        (Type.namedWith
                                            [ "Platform", "Cmd" ]
                                            "Cmd"
                                            [ Type.var "msg" ]
                                        )
                                    )
                              )
                            , ( "update"
                              , Type.function
                                    [ Type.var "msg", Type.var "model" ]
                                    (Type.tuple
                                        (Type.var "model")
                                        (Type.namedWith
                                            [ "Platform", "Cmd" ]
                                            "Cmd"
                                            [ Type.var "msg" ]
                                        )
                                    )
                              )
                            , ( "subscriptions"
                              , Type.function
                                    [ Type.var "model" ]
                                    (Type.namedWith
                                        [ "Platform", "Sub" ]
                                        "Sub"
                                        [ Type.var "msg" ]
                                    )
                              )
                            ]
                        ]
                        (Type.namedWith
                            [ "Platform" ]
                            "Program"
                            [ Type.var "flags"
                            , Type.var "model"
                            , Type.var "msg"
                            ]
                        )
                    )
            }
    , sendToApp =
        Elm.value
            { importFrom = [ "Platform" ]
            , name = "sendToApp"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Platform" ]
                            "Router"
                            [ Type.var "msg", Type.var "a" ]
                        , Type.var "msg"
                        ]
                        (Type.namedWith
                            [ "Platform" ]
                            "Task"
                            [ Type.var "x", Type.unit ]
                        )
                    )
            }
    , sendToSelf =
        Elm.value
            { importFrom = [ "Platform" ]
            , name = "sendToSelf"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Platform" ]
                            "Router"
                            [ Type.var "a", Type.var "msg" ]
                        , Type.var "msg"
                        ]
                        (Type.namedWith
                            [ "Platform" ]
                            "Task"
                            [ Type.var "x", Type.unit ]
                        )
                    )
            }
    }


