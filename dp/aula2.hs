module Aula2 where

(^*^) :: Int -> Int -> Int
(^*^) x y = 5*x + 4*y

--Listas: guardam uma quantidade
--indeterminada de elementos dosomar
-- mesmo tipo.

--Tuplas: guardam uma quantidade
--fixa de elementos de vários tipos.

somar :: Int -> Int -> Int
somar x y = x+y

somar2 :: (Int,Int) -> Int
somar2 (x, y) = x + y

somarLista :: [Int]->Int
somarLista ns = sum ns

somarTupla :: (Int, Int, Int) -> Int
somarTupla (x,y,z) = x+y+z

-- faca a funcao trd que extraia o 3° cord de tupla de inteiros
-- faca a funcao ssnd que extraia a segunda cord. de uma tupla de Int

trd :: (Int, Int, Int) -> Int
trd (x,y,z) = z

ssnd :: (Int, Int, Int) -> Int
ssnd (x,y,z) = y