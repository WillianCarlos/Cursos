module Aula6 where

fat :: Int -> Int
fat n = foldl (\mult vi -> mult * vi) 1 [1..n]

--contar quantoa elementos de um vetor são pares

contaPar :: [Int] -> Int
contaPar ns = foldl checaContagem 0 ns

-- (a -> b -> a)
checaContagem :: Int -> Int -> Int
checaContagem cont numero
   | even numero = cont + 1
   | otherwise = cont
   
-- Faca uma funcao que conte as Vogais de uma String


contaVogal :: [Char] -> Int
contaVogal ns = foldl checaVogal 0 ns

checaVogal ::  Int -> Char -> Int
checaVogal cont letra
   | elem letra "AEIOUaeiou" = cont + 1
   | otherwise = cont 
-- faça uma função que retorne a soma dos tamanhos de um vetor de strings

contaTamanho :: [String] -> Int
contaTamanho ls = foldl (\ cont v -> cont + length v ) 0 ls

--polimorfismo parametrico
--Tuplas
data Dupla a = Dupla a a deriving Show

--Listas
data Coisa a = DuasCoias a a | UmaCoisa a | Nada deriving Show

foo :: Coisa Int -> Coisa Int
foo (DuasCoisas x y) = DuasCoias (x+1)(y-1)
foo (UmaCoisa x) = UmaCoisa (2*x)
foo Nada = Nada


data Tree a = Nada | Leaf a | Branch a (Tree a) (Tree a) deriving Show

-- EM ORDEM - E R D
emOrdem :: Tree a -> [a]
emOrdem Nada = []
emOrdem (Leaf x) = [x]
emOrdem (Branch r e d) = emOrdem e ++ [r] ++ emOrdem d  