module Aula1 where

-- dobro HAS TYPE Int no parametro e Int na saida

dobro :: Int -> Int
dobro x = 2*x

v :: [Int]
v = [1 .. 10]

a :: [Int]
a = [6, 5 .. 1]

w :: [Char]
w = ['A' .. 'Z'] 

somarUm :: Int -> Int
somarUm a = a + 1

somar :: Int -> Int -> Int
somar x y = x+y

u:: Int
u = 8

-- List Compreenshions

-- virgula condicao para filtrar

-- [expressao | lista de iteracao, filtro, filtro, ... ]


todosPares :: Int -> [Int]
todosPares n = [x | x <- [0 .. n], mod x 2 == 0]


-- O dobro de todos os numeros de 0 a n maiores que 12 e menores que 142

todos n = [ x*2 | x <- [0 .. n], x > 12, x < 142 ] 