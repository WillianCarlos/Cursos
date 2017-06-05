{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Pagina3 where

import Foundation
import Yesod.Core

getPagina3R :: Handler Html
getPagina3R = defaultLayout $ do
    setTitle "Minimal Multifile"
    [whamlet|
        <h1>
            Você está na Pagina 3
    |]