module Aula4 where

data Dia = Dom | Seg | Ter | Qua | Qui | Sex | Sab deriving Show

data Mes = JAN | FEV | MAR | ABR | MAI | JUN | JUL | AGO | SET | OUT | NOV | DEZ deriving Show

data Pokemon  = Squirtle | Pikachu | Charmander | Bulbasaur deriving (Show, Eq)

data Treinador  = Treinador { nome :: String,
                              chapa :: Pokemon    
                            } deriving Show

data Resultado  = Vencedor | Perdedor | Empate deriving Show

-- se o primeiro eh vencedor
batalha1 :: Treinador -> Treinador -> Resultado
batalha1 (Treinador _ Pikachu) (Treinador _ Squirtle) = Vencedor
batalha1 (Treinador _ Charmander) (Treinador _ Bulbasaur) = Vencedor
batalha1 (Treinador _ Bulbasaur) (Treinador _ Charmander) = Perdedor
batalha1 (Treinador _ Squirtle) (Treinador _ Pikachu) = Perdedor
batalha1 (Treinador _ Bulbasaur) (Treinador _ Squirtle) = Vencedor
batalha1 (Treinador _ Charmander) (Treinador _ Squirtle) = Perdedor
batalha1 (Treinador _ Squirtle) (Treinador _ Charmander) = Vencedor

batalha1' :: Treinador -> Treinador -> Resultado
batalha1' t1 t2
    | (chapa t1 == Pikachu && chapa t2 == Squirtle) ||
      (chapa t1 == Charmander && chapa t2 == Bulbasaur) ||
      (chapa t1 == Bulbasaur && chapa t2 == Squirtle) ||
      (chapa t1 == Squirtle && chapa t2 == Charmander) = Vencedor
    | (chapa t2 == Pikachu && chapa t1 == Squirtle) ||
      (chapa t2 == Charmander && chapa t1 == Bulbasaur) ||
      (chapa t2 == Bulbasaur && chapa t1 == Squirtle) ||
      (chapa t2 == Squirtle && chapa t1 == Charmander) = Vencedor
    |otherwise = Empate  
--RECORD SYNTAX : EH A NOMEACAO DOS CAMPOS. ESSES NOMES TEM UM INTUINTO MAIS PROFUNDO
-- QUE O DE PROVER MEIOS DE EXTRAIR O VALOR DO CAMPO FORA DO TIPO.
-- OS NOMES DOS CAMPOS SAO TAMBEM, FUNCOES DE EXTRACAO(GETTERS)

data Calendario = Calendario {diaSemana :: Dia,
                             dia :: Int,
                             mes :: Mes,
                             ano :: Int} deriving Show

ehBisexto :: Calendario -> Bool
ehBisexto (Calendario _ _ _ anos) = mod anos 4 == 0

ehBisexto' :: Calendario -> Bool
ehBisexto' cal = mod (ano  cal) 4 == 0

data Status = Magro | Gordo | Saudavel deriving Show

proximo :: Dia->Dia
proximo Dom = Seg
proximo Seg = Ter
proximo Ter = Qua
proximo Qua = Qui
proximo Qui = Sex
proximo Sex = Sab
proximo Sab = Dom

proxMes :: Mes -> Mes
proxMes JAN = FEV
proxMes FEV = MAR
proxMes MAR = ABR
proxMes ABR = MAI
proxMes MAI = JUN
proxMes JUN = JUL
proxMes JUL = AGO
proxMes AGO = SET
proxMes SET = OUT
proxMes OUT = NOV
proxMes NOV = DEZ
proxMes DEZ = JAN

amanha :: Calendario -> Calendario
amanha (Calendario dia 31 DEZ ano) = Calendario (proximo dia) 1 (proxMes DEZ) (ano+1)
amanha (Calendario dia 30 NOV ano) = Calendario (proximo dia) 1 (proxMes NOV) ano
amanha (Calendario dia 31 OUT ano) = Calendario (proximo dia) 1 (proxMes OUT) ano
amanha (Calendario dia 30 SET ano) = Calendario (proximo dia) 1 (proxMes SET) ano
amanha (Calendario dia 31 AGO ano) = Calendario (proximo dia) 1 (proxMes AGO) ano
amanha (Calendario dia 31 JUL ano) = Calendario (proximo dia) 1 (proxMes JUL) ano
amanha (Calendario dia 30 JUN ano) = Calendario (proximo dia) 1 (proxMes JUN) ano
amanha (Calendario dia 31 MAI ano) = Calendario (proximo dia) 1 (proxMes MAI) ano
amanha (Calendario dia 30 ABR ano) = Calendario (proximo dia) 1 (proxMes ABR) ano
amanha (Calendario dia 31 MAR ano) = Calendario (proximo dia) 1 (proxMes MAR) ano
amanha (Calendario dia numero FEV ano) 
    | mod ano 4 == 0 && numero == 29 = Calendario (proximo dia) 1 (proxMes FEV) ano
    | mod ano 4 /= 0 && numero == 28 = Calendario (proximo dia) 1 (proxMes FEV) ano
    | numero<1 && numero >29 = Calendario dia numero FEV ano
    | otherwise  = Calendario (proximo dia) (numero+1) FEV ano
amanha (Calendario dia 31 JAN ano) = Calendario (proximo dia) 1 (proxMes JAN) ano
amanha (Calendario dia numero mes ano)
    | numero <1 && numero >31 = Calendario dia numero mes ano
    | otherwise = Calendario (proximo dia) (numero+1) mes ano
    
imc :: Double -> Double -> Status
imc  peso altura
    | (peso/altura**2) > 25 = Gordo
    | (peso/altura**2) >18 = Saudavel
    | otherwise = Magro
    
    
-- currying = eh o ato de se passar menos argumentos do qoe os definidos para uma função
-- os argumenyos esquecidoes poderao ser passdados depois e o tipo da função será modificado de forma
-- a contemplar os argumentos restantes.
    
    
data Treinador1  = Treinador1 { nome1 :: String,
                                chapa1 :: Pokemon,
                                id1 :: Int
                              } deriving Show
                              