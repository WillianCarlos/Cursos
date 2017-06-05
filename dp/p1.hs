module P1 where

import Data.List
import Data.Monoid

{-
  1-  Explique o que é o unfoldr do pacote Data.List,seu tipo e dê exemplos de onde podemos usá-lo.
-}
-----------------------------------------------------------------------------------------------------------------------------------------------
{- Resposta: 
 É uma função que ao contrario de foldr que retorna um resultado da operação de uma lista, o unfoldr retorna uma [a] de qualuqer tipo 
 A função usa o tipo Maybe para condicionar a logica de execução: caso seja Nothing  ele para a exução e retorna a lista gerada senão
 caso seja Just ele continua a chamada de função atraves da recursividade; 

 Onde b valor inicial rcebido para função , o a do Maybe o valor prefixado na lista gerada e o valor b o proximo elemento da chamada recursiva. 
 unfoldr :: (b -> Maybe (a, b)) -> b -> [a]
 
 foldr(\ a b -> a + b)0 [1,2,3]
 unfoldr (\b -> if b == 0 then Nothing else Just (b, b-1)) 5
-}
------------------------------------------------------------------------------------------------------------------------------------------------
{-
  2- Faça uma função que gere 3 baralhos usando um list comprehension. Faça outra função para filtrar
as cartas de Copas da lista acima. 
-} 

----------------------------------------------------------------------------------------------------------------------------------------------------------
fazerBaralho :: [([Char],[Char])]
fazerBaralho = take 156 (cycle[(naipe, valor) | naipe <- ["Paus","Copas","Espadas","Ouros"], valor <- ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]])

filtroCopas :: [([Char],[Char])] -> [([Char],[Char])]
filtroCopas x = filter (\ (a,_) -> a == "Copas") x
---------------------------------------------------------------------------------------------------------------------------------------------------------
{-
3- Faça uma instância de Monoid para o tipo data Sozinho = Sozinho.
-}
data Sozinho = Sozinho deriving Show
 
--teste Sozinho <> Sozinho
instance Monoid Sozinho where
    mempty = Sozinho
    mappend Sozinho Sozinho = mempty
---------------------------------------------------------------------------------------------------------------------------------------------------------     


