import System.IO

solve :: String -> Double
solve = head . foldl foldingFunction [] . words
    where 
        foldingFunction (x:y:ys) "*" = (x * y):ys
        foldingFunction (x:y:ys) "+" = (x + y):ys
        foldingFunction (x:y:ys) "-" = (x + y):ys
        foldingFunction (x:y:ys) "/" = (x + y):ys
        foldingFunction xs numberString = read numberString:xs

main = do
    z <- getLine
    print (solve z)