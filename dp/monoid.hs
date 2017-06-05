module Monoid where
    
import Data.Monoid

data Bolsa a = Nada | UmaCoisa a deriving Show

instance (Monoid a) => Monoid (Bolsa a) where
    mempty = Nada
    mappend (UmaCoisa x) (UmaCoisa y) = UmaCoisa (x <> y)
    mappend Nada x = x
    mappend x Nada = x

instance Monoid Bool where
    mempty = False
    mappend = (||)
    --mappend True True = True
    --mappend False True = True
    --mappend True False = True
    --mappend False False = False
        
verificarNulo :: (Monoid m, Eq m) => m -> Bool
verificarNulo x = x <> x <> x == mempty
-----------------------------------------------------------------------------------------


