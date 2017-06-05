{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Pagina1 where

import Foundation
import Yesod.Core

getPagina1R :: Handler Html
getPagina1R = defaultLayout $ do
    setTitle "Minimal Multifile"
    [whamlet|
        <h1>
            Você está na Pagina 1
    |]