export default () =>
  `
port module Elm.Gen exposing (File, files, error, info)


import Json.Encode as Json


type alias File =
       { path : String
       , contents : String
       }

encodeFile : File -> Json.Value
encodeFile file =
   Json.object
        [ ("path", (Json.string file.path))
        , ("contents", (Json.string file.contents))
        ]

{-|
     Provide the list of files to be generated.
     These files will be generated and the script will end.
-}
files : List File -> Cmd msg
files list =
     onSuccessSend (List.map encodeFile list)


{-|
     Report an error.  The script will end.

-}
error :
     List
          { title : String
          , description : String
          } -> Cmd msg
error errs =
     onFailureSend (List.map encodeError errs)



encodeError :
     { title : String
     , description : String
     } -> Json.Value
encodeError err =
     Json.object
          [ ("title", (Json.string err.title))
          , ("description", (Json.string err.description))
          ]

{-| Report some info.  The script will continue to run.

-}
info : String -> Cmd msg
info err =
     onInfoSend err



port onSuccessSend : List Json.Value -> Cmd msg

port onFailureSend : List Json.Value -> Cmd msg

port onInfoSend : String -> Cmd msg

`.trimLeft()
