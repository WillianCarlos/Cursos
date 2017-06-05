module Aula8 where

--  o type class Functor exige a implementação de fmap
{-instance Functor [] where
   fmap  = map 
-}   
{-
instance Functor Maybe where
    fmap ab Nothing = Nothing
    fmap ab (Just x) = Just (ab x)


*-}

-- fmap :: Functor f => (a -> b) -> f a -> f b

-- functor nao trabalha com tipos constantes so trabalha com typos variaveis.
-- fmap :: Functor f => (a -> b) -> f a -> f b
-- FUNCTOR NAO TRABALHA COM TIPOS CONSTANTES (SOH COM VARIAVEIS)
data Tripla a = Tripla a Int a deriving Show

-- fmap :: (a -> b) -> Tripla a -> Tripla b
-- O functor troca todos os campos a de um tipo com este cshape por campos do tipo b
instance Functor Tripla where
     fmap ab (Tripla x i y) = Tripla (ab x) i (ab y)

data Identidade a = Identidade a deriving Show
-- Faca uma instancia de Functor
-- Faca um teste no ghci.
instance Functor Identidade where
   fmap ab (Identidade x) = Identidade (ab x)
   
{-
teste *Aula8> fmap length (Identidade "Oi")
Identidade 2
-}

safeDiv :: Double -> Double -> Maybe Double
safeDiv x 0 = Nothing
safeDiv x y = Just (x/y)