-- Types

-- gchi> :t 'c' -- get type of data
-- gchi> :t True
-- gchi> :t "Hello"
-- gchi> :t (True, 'a')
-- gchi> :t 4 == 5

-- :: means "left value has type right value"

-- Type of functions

removeNonUppercase ::  [Char] -> [Char]
removeNonUppercase  st = [c | c <- st, elem c ['A'..'Z']]

sumThree :: Int -> Int -> Int -> Int
sumThree x y z = x + y + z

-- Haskell types
-- Int - default integer depends on size of machine word -2^31..2^31-1 for 32 bit, etc.
-- Integer - big numbers

factorial :: Integer -> Integer
factorial n  = product [1..n]

-- Float

circumferenceFloat :: Float -> Float
circumferenceFloat r = 2 * pi * r

-- Double

circumferenceDouble :: Double -> Double
circumferenceDouble r = 2 * pi * r

-- Bool
-- Char (unicode character)
-- Tuple

-- Clases of types

intEq = 5 == 5  -- (==) :: (Eq a) => a -> a -> Bool
intCmp =  5 < 7  -- (<) :: (Ord a) => a -> a -> Ordering (where Ordering can be one of [EQ, GT, LT])
intShow = show 5 -- show :: (Show a) => a -> String

-- Read
boolRead = read "True" || False -- res: True
intRead = read "3.8" + 8.2 -- res: 12
listRead = read "[1, 4]" ++ [1..3] -- [1,4,1,2,3]
-- read "4" -- error
-- read :: Read a => String -> a

-- Type annotations
aIntRead = read "4" :: Int
aFloatRead = read "4" :: Float
aListRead = read "[1, 2, 3]" :: [Int]
aSumIntRead = (read "5" :: Int) + 10
aTupleRead = read "('a', 10)" :: (Char, Int)
aElemListRead = [read "True", False, True]

-- Enum
eChar = ['a'..'e'] -- Char
eOrdering = [LT .. GT] -- Ordering
eInt = [1 .. 5] -- Int

-- Bounded
minInt = minBound :: Int -- minBound :: Bounded a => a
maxInt = maxBound :: Int -- maxBound :: Bounded a => a

maxChar = maxBound :: Char 
minChar = minBound :: Char 

maxTuple = maxBound :: (Int, Char, Bool)
minTuple = minBound :: (Int, Char, Bool)

-- Num (includes  Show + Eq)
-- 20 :: Num a =>
-- (*) :: Num a => a -> a -> a
-- (5 :: Int) * (6 :: Integer) -- error
-- 5 * (6 :: Integer) -- error

-- Floating - Float + Double
-- Integral - Like Num but without integers
frIntegral = fromIntegral (length [1..4]) + 3.2