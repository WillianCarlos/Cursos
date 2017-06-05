module chamada where
{-
Faça uma função encriptarTodos que encripta (ou dá erro) todos
os elementos de um vetor de Cripto.
-}
data Cripto = Mensagem String deriving Show
encriptarTodos :: [Cripto] ->  String
encriptarTodos [Mensagem a, Mensagem b] = reverse a ++ ", " ++ reverse b
encriptarTodos _ = "Erro"
-- encriptarTodos (a:b:xs) = [succ a] ++ [succ b] 

{-
Crie a função maxMoeda que recebe uma lista de Moedas e retorna
o valor máximo absoluto(sem conversão alguma) dentre os campos val
desta lista. Exemplo,
maxMoeda [Moeda 3 Real , Moeda 7 Dollar , Moeda 2 Euro] = 7.
OBS: Use a função maximum.
-}

data Moeda = Moeda{nome :: String, val :: Int} deriving Show
maxMoeda :: [Moeda] -> Int
maxMoeda [Moeda a a1, Moeda b b1, Moeda c c1] = maximum[a1,b1,c1]  
maxMoeda _ = 0 