{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Pagina2 where

import Foundation
import Yesod.Core

getPagina2R :: Handler Html
getPagina2R = defaultLayout $ do
    setTitle "Minimal Multifile"
    [whamlet|
        <h1>
            Você está na Pagina 2
    |]