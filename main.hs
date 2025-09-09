import System.Process (system)
{-
Estrutura base do programa
triangulo _ = do
    putStr"_"
    putStr"*"
    putStr"_"
    putStrLn""
-}

base_triangulo :: Int -> Int
base_triangulo n
    | n <= 0 = 0
    | otherwise = 2 * n - 1

total_triangulo :: Int -> Int
total_triangulo n
    | n <= 0 = 0
    | otherwise = base_triangulo n + total_triangulo (n-1)

triangulo :: Int -> IO ()
triangulo _ = do
    putStr"_"
    putStr"*"
    putStr"_"
    putStrLn""
    

main :: IO()
main = do
    clear
    putStrLn "Desenhe um triangulo de altura: "
    putStr "||"
    altura  <- readLn
    
    putStrLn "Distância: "
    triangulo altura

    print(base_triangulo altura)
    print(total_triangulo altura)

clear :: IO ()
clear = system "cls || clear" >> return ()