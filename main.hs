import System.Process (system)
{-
Estrutura base do programa
triangulo _ = do
    putStr"_"
    putStr"*"
    putStr"_"
    putStrLn""
-}

baseTriangulo :: Int -> Int
baseTriangulo n
    | n <= 0 = 0
    | otherwise = 2 * n - 1

totalTriangulo :: Int -> Int
totalTriangulo n
    | n <= 0 = 0
    | otherwise = baseTriangulo n + totalTriangulo (n-1)

imprimirUnderline :: Int -> Int -> IO ()
imprimirUnderline altura acc
    | acc > (altura `div` 2) + 1 = putStr ""
    | otherwise = do
        putStr "_"
        imprimirUnderline altura (acc + 1)
    
imprimirAsterisco :: Int -> Int -> IO ()
imprimirAsterisco altura acc
    | acc > altura = putStr ""
    | otherwise = do
    putStr"*"
    imprimirAsterisco altura (acc + 1)

--Ey acho que entendi o que eu devo fazer para concerta tudo isso. A lógica que eu devo está buscando é fazer com as minhas funções auxiliares não receba um acc, no lugar disso, a principal vai passar a altura atual que estou trabalhando e vai ter um acc na principal. Assim a main vai ser a função recursiva e não as outras (acho que deve dá certo)

triangulo :: Int -> IO ()
triangulo n = do
    imprimirUnderline n 0
    imprimirAsterisco n 0
    imprimirUnderline n 0
    putStrLn""    

main :: IO()
main = do
    clear
    putStrLn "Desenhe um triangulo de altura: "
    putStr "||"
    altura  <- readLn
    
    putStrLn "Distância: "
    triangulo altura

    print(baseTriangulo altura)
    print(totalTriangulo altura)

clear :: IO ()
clear = system "cls || clear" >> return ()