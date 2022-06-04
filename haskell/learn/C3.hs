-- Pattern matching
lucky :: Int -> String
lucky 7 = "Lucky number"
lucky x = "Sorry"

sayMe :: Int -> String
sayMe 1 = "One"
sayMe 2 = "Two"
sayMe 3 = "Three"
sayMe 4 = "Four"
sayMe 5 = "Five"
sayMe x = "Argument is not in [1..5] interval"

factorial :: Integer -> Integer
factorial 0 = 1
factorial x = x * factorial (x-1)

-- Pairs
addVectorsBad :: (Double, Double) -> (Double, Double) -> (Double, Double)
addVectorsBad x y = (fst x + fst y, snd x + snd y)

addVectorsGood :: (Double, Double) -> (Double, Double) -> (Double, Double)
addVectorsGood (x1, y1) (x2, y2) = (x1 + y1, x2 + y2)

first :: (a, b ,c) -> a
first (a, _, _) = a
second :: (a, b ,c) -> b
second (_, b, _) = b
third :: (a, b ,c) -> c
third (_, _, c) = c

-- Lists and generators
xs = [(1, 2), (3, 4), (5, 6)]
sumList xs = [a + b | (a,b) <- xs]

myHead :: [a]  -> a
myHead [] = error "No head in empty list"
myHead (x:_) = x

tell :: (Show a) =>  [a] -> String
tell [] = "Empty list"
tell (x:[]) = "One element " ++ show x
tell (x:y:[]) = "Two elements " ++ show x ++ " and " ++ show y
tell (x:y:_) = "A lot of elements, first is "  ++ show x ++ ", second is " ++ show y

badAdd :: (Num a) => [a] -> a
badAdd (x:y:z:[]) = x + y + z
-- badAdd [1, 2] -- error

-- Named patterns
firstLetter ::  String -> String
firstLetter "" = "Empty string"
firstLetter all@(x:_) = "First letter of word " ++ all ++ " is " ++ [x]