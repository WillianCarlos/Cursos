module Aula9 where

infixr 0 |>
(|>) :: a -> (a -> b) -> b
(|>) a ab = ab a

dobro :: Int -> Int
dobro x = 2*x

{-quadruplo :: Int -> Int
quadruplo x =  x 
            |> dobro 
            |> dobro
-}
quadruplo' :: Int -> Int
quadruplo' x = dobro $ dobro $ x


{-

class (Functor m) => Monad m where
    return :: a -> m a
    (>>=) :: m a -> (a -> m b) -> m b

-}

class (Functor m) => Monada m where
    retorno :: a -> m a
    juntar :: m (m a) -> m a

-- m = []
instance Monada [] where
    retorno a = [a] 
    juntar = concat
    

f :: a -> [a]
f x = retorno x   -- f True [True]

--  juntar(f [5])  = [5]

{-
expr1 :: Maybe Int
expr1 = Just 5 
    >>= \x -> Just (2*x) 
    >>= \y -> Just (x+y)

expr2 :: Int
expr2 =  5 
      |> \x -> (2*x) 
      |> \y -> (x+y)
-}

{-expr1 :: Maybe Int
expr1 = do
    x <- Just 5 
    y <- Just (2*x) 
    return (x+y)-}