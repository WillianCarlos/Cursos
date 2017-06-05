module Main where

{- main :: IO ()
main = putStrLn "Olá mundo!" -} 

--ghc aula9.hs -o aula9.out
-- ./aula9.out

{-main :: IO ()
main = do
    putStrLn "Digite um numero"
    x <- readLn -- retorna um IO Int
    putStrLn "Digite outro numero"
    y <- readLn
    putStrLn $ "O resultado eh: " ++ show(x+y)

main' :: IO ()
main' = putStrLn "Digite um numero" 
     >> readLn 
     >>= \x -> putStrLn "Digite outro numero " 
     >> readLn 
     >>= \y -> putStrLn $ "O resultado eh: " ++ show(x+y)
-}

-- TODA VEZ QUE USARMOS FUNCOES NAO-MONADICAS (PURAS)
-- DEVEMOS USAR O return 
main :: IO ()
main = do
    putStrLn "Digite um nome"
    nome <- getLine -- IO String
    putStrLn $ "Olá " ++ nome
{-main = do
    putStrLn "Digite um nome"
    nome <- getLine -- IO String
    rev <- return $ reverse nome -- tipar IO atraves do return
    putStrLn $ "Olá " ++ rev-}