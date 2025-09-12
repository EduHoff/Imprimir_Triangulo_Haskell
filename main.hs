import System.Process (system)

baseTriangulo :: Int -> Int
baseTriangulo h_atual
    | h_atual <= 0 = 0
    | otherwise = 2 * h_atual - 1

totalTriangulo :: Int -> Int
totalTriangulo h_maximo
    | h_maximo <= 0 = 0
    | otherwise = baseTriangulo h_maximo + totalTriangulo (h_maximo-1)

imprimirEspaco :: Int -> Int -> Int -> IO ()
imprimirEspaco h_maximo h_atual acc
    | h_atual >= h_maximo = putStr ""
    | acc > ((baseTriangulo h_maximo) - (baseTriangulo h_atual)) `div` 2 = putStr ""
    | otherwise = do
        putStr " "
        imprimirEspaco h_maximo h_atual (acc + 1)

imprimirAsterisco :: Int -> Int -> IO ()
imprimirAsterisco h_atual acc
    | acc > (baseTriangulo h_atual) = putStr ""
    | otherwise = do
        putStr "*"
        imprimirAsterisco h_atual (acc + 1)

triangulo :: Int -> Int -> IO ()
triangulo h_maximo h_atual
    | h_maximo <= 0 = putStr ""
    | h_atual > h_maximo = putStr ""
    | otherwise = do
        imprimirEspaco h_maximo h_atual 1
        imprimirAsterisco h_atual 1
        imprimirEspaco h_maximo h_atual 1
        putStrLn""
        triangulo h_maximo (h_atual+1)

main :: IO()
main = do
    clear
    putStrLn "Desenhe um triangulo de altura: "
    putStr "||"
    altura  <- readLn

    clear
    triangulo altura 1

    putStrLn""
    putStrLn $ "Altura: " ++ show altura
    putStrLn $ "Base: " ++ show (baseTriangulo altura)
    putStrLn $ "Total: " ++ show (totalTriangulo altura)


clear :: IO ()
clear = system "cls || clear" >> return ()