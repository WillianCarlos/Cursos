{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE TemplateHaskell      #-}
{-# LANGUAGE ViewPatterns         #-}

{-# OPTIONS_GHC -fno-warn-orphans #-}
module Application where

-- CADA TABELA VAI POSSUIR UM .hs
-- ESSE DEVE SER INCLUIDO NO .cabal
-- E IMPORTADO AQUI NO Application
import Foundation
import Yesod.Core

import Add
import Home
import Pagina1
import Pagina2
import Pagina3

mkYesodDispatch "App" resourcesApp
