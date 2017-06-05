module Aula13 where

import Control.Applicative

data Departamento = Departamento { departamentoNome :: String
                                 , departamentoSigla ::String
                                 } deriving Show