module Aula3 where

-- data Int = ... |-8|-7 |...|0|1|...
-- data Bool = True | False
data Dia = Domingo | Segunda | Terca | Quarta | Quinta | Sexta | Sabado deriving (Show, Enum)

--Recebe via parametro um Dia e retorna uma String
-- Tal string representa o que vou fazer no dia

--Pattern Matching -->  na entrada da funcao ao inves de usar uma variavel usamos um valor constante do mesmo tipo que a entrada
--Cada vez que a funcao receber esse valor, retornara a expressao correspondente.
--O pattern matching sempre começa com as constantes e  por ultimo temos as variaveis.
--caso eu nao uso a varivel posso isso o ignore que ignorara o valor recebido
-- um valor por vez!!
--usando enum ele trato tipo como numeros se ele nao pode usar succ,pred ..
-- show mostra na tela e enum enxerga como fosse inteiro

agenda :: Dia -> String
agenda Domingo = "Dia de descanso"
agenda Sabado = "Dia de maldade"
agenda _ = "Trabalho, infelizmente"


--Exemplo : umtrabalhador ganha o salario hora, dobrado ao sabado
--aos domingos o triplo no resto da semana nao ha incremento algum

salario :: Double -> Dia -> Double
salario s Domingo = s*3
salario s Sabado = s*2
salario s _ = s

-- exe a Faça uma função chamada toInt recebe um dia e converte para inteiro
--Domingo vale 1, segunda 2, ...
--exe b faça uma função chamada toDia que faz o contrario da de cima

toInt :: Dia -> Int
toInt Domingo = 1
toInt Segunda = 2
toInt Terca = 3
toInt Quarta = 4
toInt Quinta = 5
toInt Sexta = 6
toInt Sabado = 7

toDia :: Int -> Dia
toDia 1 = Domingo 
toDia 2 = Segunda
toDia 3 = Terca
toDia 4 = Quarta
toDia 5 = Quinta
toDia 6 = Sexta
toDia _ = Sabado

--exec C faça um tipo chamado Day que contenha os dia da semana em inglês faça uma função chamada traduzir
-- que traduza de port para ing, a traduzir recebe um dia e devolve uma Day

data Day = Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday deriving Show

traduzir :: Dia -> Day
traduzir Domingo = Sunday
traduzir Segunda = Monday
traduzir Terca = Tuesday
traduzir Quarta = Wednesday
traduzir Quinta = Thursday
traduzir Sexta = Friday
traduzir Sabado = Saturday

--azul nome, laranja value constructor, verde campos 
data Correncia  = Euro | Real | Dolar deriving Show

data Dinheiro = Dinheiro Double Correncia deriving Show

data Pessoa = Fisica String Int | Juridica String deriving Show

--no pattern matching usamos os constantes antes e por ultimo a varivel(x)
fazerAniversario :: Pessoa -> Pessoa
fazerAniversario (Fisica nome idade) = Fisica nome (idade+1) --fazerAniversario (Fisica "mim" 23)
fazerAniversario x = x

converterReal :: Dinheiro -> Dinheiro
converterReal (Dinheiro valor Euro) = Dinheiro (3.28*valor) Real
converterReal (Dinheiro valor Dolar) = Dinheiro (3.09*valor) Real
converterReal dinheiro = dinheiro