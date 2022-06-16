import System.IO
import Data.Char
import Data.Map

-- Shunting - Yard algorithm for Reverse Polish Notation
data Token = Number Int | ParenOpen | ParenClose
             | AddOp | MulOp  | DivOp | SubOp
            deriving (Show, Eq)

isOp:: Token -> Bool
isOp AddOp = True
isOp MulOp = True
isOp DivOp = True
isOp SubOp = True
isOp _ = False

isWhiteSpace:: Char -> Bool
isWhiteSpace '\n' = True
isWhiteSpace '\r' = True
isWhiteSpace '\0' = True
isWhiteSpace _ = False

scanNumber:: String -> (Int, String)
scanNumber xs = (num, str) where 
        (n, str) = span isNumber xs
        num = read n :: Int

opmap:: Map Char Token
opmap = fromList [ ('+', AddOp), ('*', MulOp), ('/', DivOp), ('(', ParenOpen),
                    ('-', SubOp), (')', ParenClose)]

tokenize:: String -> [Maybe Token]
tokenize s = loop s [] where
    loop str tokens
        | Prelude.null str = tokens
        | isNumber $ head str = let
                    (num, str') = scanNumber str
                    tokens' = tokens ++ [Just (Number num)]
                in loop str' tokens'
        | isWhiteSpace $ head str = loop (tail str) tokens
        | otherwise = loop (tail str) (tokens ++ [Data.Map.lookup (head str) opmap])

prec:: Token -> Int
prec AddOp = 0
prec SubOp = 0
prec MulOp = 1
prec DivOp = 1
prec ParenOpen = 2
prec ParenClose = 2
prec (Number _) = 3


translate:: [Maybe Token] -> [Token]
translate ts = translate' ts [] [] where
-- No more tokens
    translate' [] [] q = q
    translate' [] s q =
        if head s == ParenOpen 
            then error "Mismatched Parentheses" 
            else translate' [] (tail s) (q ++ [head s])
    translate' (x:xs) s q = case x of
        Nothing -> error "Illegal tokens"
        (Just (Number n)) -> translate' xs s (q ++ [Number n])
        (Just ParenOpen) -> translate' xs (ParenOpen:s) q
        (Just ParenClose) -> translate' xs s0 q0 where
            s0 = tail $ dropWhile (/= ParenOpen) s
            q0 = q ++ takeWhile (/= ParenOpen) s
        (Just o1) -> translate' xs s1 q1 where
            cond o2 = isOp o2 && (prec o1 < prec o2)
            spl = span cond s
            s1 = o1 : snd spl
            q1 = q ++ fst spl

toString:: [Token] -> String
toString = concatMap toStringOne where
    toStringOne (Number n) = show n ++ " "
    toStringOne AddOp = "+ "
    toStringOne MulOp = "* "
    toStringOne DivOp = "/ "
    toStringOne SubOp = "- "
    toStringOne ParenOpen = "( "
    toStringOne ParenClose = ") "

convert:: String -> String
convert = toString . translate . tokenize

-- Calculation of expression in RPN form
solve :: String -> Double
solve = head . Prelude.foldl foldingFunction [] . words
    where 
        foldingFunction (x:y:ys) "*" = (x * y):ys
        foldingFunction (x:y:ys) "+" = (x + y):ys
        foldingFunction (x:y:ys) "-" = (y - x):ys
        foldingFunction (x:y:ys) "/" = (y / x):ys
        foldingFunction xs numberString = read numberString:xs

con z = convert z

main = do
    z <- getLine
    let con = convert z
    print(con)
    print (solve con)