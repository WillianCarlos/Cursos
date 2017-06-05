module Aula5 where

fat :: Int -> Int
fat 0 = 1 
fat n = n * fat (n-1)
-- fat n 
--    | n <= 0 =1
--    | otherwise = n * fat (n -1)

fib :: Int -> Int 
fib t
   | t <= 0 = 0
   | t == 1 = 1
   | otherwise = fib(t -1) + fib(t -2)
   
--elimVogal "Fatec" = Ftc
--type String = [char]
elimVogal :: String -> String
elimVogal [] = []
elimVogal (x:xs)
   | elem x "AEIOUaeiou" = elimVogal xs 
   | otherwise = x : elimVogal xs
-- high order funcion é uma função que recebe via paremetro  ou retorna outra função (map filter)
--map funç~]aoq ue joga para dentro de uma lista outra função ela tem como parametro uma função (a -> b) e uma lista de a
-- o map transformara a lista de a em uma lista de b.
--filter  eleimina as ocorrencias false  calculadas pelo parametro  (a -> bool), não modificando o tipo da lista de entrada.
-- currying é o ato de passar menos parametros que o definido para uma função.