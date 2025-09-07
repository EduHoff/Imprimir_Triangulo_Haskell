import System.Process (system)

triangulo :: Int -> IO
triangulo _ = do
    print"teste" 

main :: IO()
main = do
    clear
    putStrLn "Desenhe um triangulo de altura: "
    putStr "||"
    altura  <- readLn
    
    putStr "Distância: "
    print(triangulo altura)

clear :: IO ()
clear = system "cls || clear" >> return ()