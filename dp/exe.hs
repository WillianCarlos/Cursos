module Exe where

--Exercício 5.4 Crie uma função minAll que recebe um [Min] e retorna um Min contendo o menor valor.

data Min = Min Int deriving (Eq,Ord,Show)
-- minAll[Min 12, Min 25, Min 101, Min 9, Min 13, Min 45, Min 5]
minAll :: [Min] -> Min
minAll mins = minimum mins 

{-Exercício 5.5 Crie o tipo Paridade com os value constructors Par e Impar. Crie o typeclass ParImpar que contém a função,
    decide :: a → Paridade, e possua as instâncias:
    • Para Int: noção de Par/Impar de Int.
    • Para [a]: Uma lista de elementos qualquer é Par se o número de elementos o for.
    • Para Bool: False como Par, True como Impar.
-}

data Paridade = Par | Impar deriving Show

class ParImpar a where
   decide :: a -> Paridade
-- decide 100
instance ParImpar Integer where
   decide a 
      | mod a 2 == 0 = Par
      | otherwise = Impar
-- decide [1..5]
instance ParImpar[a] where 
   decide a
      | mod (length a) 2 == 0 = Par
      | otherwise = Impar 
-- decide False 
instance ParImpar Bool  where
   decide a
      | a == True = Impar
      | otherwise = Par
      
      