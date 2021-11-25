"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.default = (function () { return "\nmodule Generator exposing (main)\n\n{-| -}\n\nimport Elm\nimport Elm.Annotation as Type\nimport Elm.Gen\n\n\nmain : Program {} () ()\nmain =\n    Platform.worker\n        { init =\n            \\json ->\n                ( ()\n                , Elm.Gen.files\n                    [ file\n                    ]\n                )\n        , update =\n            \\msg model ->\n                ( model, Cmd.none )\n        , subscriptions = \\_ -> Sub.none\n        }\n\n\nfile =\n    Elm.file [ \"My\", \"Module\" ]\n        [ Elm.declaration \"hello\"\n            (Elm.string \"World!\")\n        ]\n"; });
