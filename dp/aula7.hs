module Aula7 where
import Data.Monoid
--para funmcionar o instace eq precisa remover do data o deriving

data Dia = Segunda | Terca | Quarta | Quinta | Sexta | Sabado | Domingo deriving Eq 

--quando trocamos o deriving por instance eh bom ler a documentação
instance Show Dia where
   show Segunda = "Segunda dia de  Haskell"
   show Quarta = "Quarta do Futebol"
   show Sexta = "Dia de maldade"
   show Sabado = "Dia de bar"
   show _ = "Nao me importo"

--instance Eq Dia where
--    Segunda == Domingo = True
--    Domingo == Segunda = True
--    Terca == Terca = False
--    _ == _ = True
    
instance Ord Dia where
    Terca <= Quarta = False
    Domingo <= _ = True    
    _ <= Domingo = False
-- so podemos tranformar em Ord tipos que sao estancia de Eq
-- class (Eq a) => Ord a where

data RPS = Pedra | Papel | Tesoura deriving (Eq, Show)

instance Num RPS where
    Pedra + Tesoura = Pedra
    Tesoura + Pedra = Pedra
    Tesoura + Papel = Tesoura
    Papel + Tesoura = Tesoura
    Papel + Pedra = Papel
    Pedra + Papel = Papel
    x + _ = x
    
    Pedra * Tesoura = Papel
    Tesoura * Pedra = Papel
    Tesoura * Papel = Pedra
    Papel * Tesoura = Pedra
    Papel * Pedra = Tesoura
    Pedra * Papel = Tesoura
    x * _ = x
    
    Pedra - Tesoura = Tesoura
    Tesoura - Pedra = Tesoura
    Tesoura - Papel = Papel
    Papel - Tesoura = Papel
    Papel - Pedra = Pedra
    Pedra - Papel = Pedra
    x - _ = x
    
    abs = id
    
    signum = id
    fromInteger x 
       | mod x 3 == 0 = Pedra
       | mod x 3 == 1 = Tesoura
       | otherwise = Papel

-- tipos de kind * -> *

-- QUANDO TEMOS instance, NAO HA deriving.
data Bolsa a = Nada | UmaCoisa a | DuasCoisas a a deriving Show 

--para tipos de kind 2 temos que pensar
--nos tipos de kind 2  podemos ter uma restricao de type variable
instance (Eq a) => Eq (Bolsa a) where 
    Nada ==  Nada = True
    (UmaCoisa x) == (UmaCoisa y) = x == y
    (DuasCoisas a b) == (DuasCoisas c d) = (a == c && b == d) || (a == d  &&  b == c)
    _ == _ = False
    
--class (Eq a) => SimNao a where
class SimNao a where
--Minimal complete definition
   simnao :: a -> Bool
   
instance SimNao Bool where
    
    simnao = id 
    
instance SimNao Int where
    simnao x
       | x > 0 = True
       | otherwise = False
       
instance SimNao Char where
    simnao ' ' = False
    simnao _ = True

--Monoide

instance Monoid Bool where
    mempty = False
    -- mappend = (||)
    mappend True True = True
    mappend False True = True
    mappend True False = True
    mappend False False = False
verificarNulo :: (Monoid m, Ord m) => m => Bool 
verificarNulo x = x <> x <> x == mempty 

