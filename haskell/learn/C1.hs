-- Functions
doubleMe x = x + x
doubleUs x y = x*2 + y*2
doubleUsMe x y = doubleMe x + doubleMe y
doubleSmallNumber x = if x > 100
                        then x
                        else x*2
-- Lists
lostNumbers = [4, 8, 15, 16, 23, 42]

stringA = ['1','2','3']
stringB = "123"

lostNumbersDouble = lostNumbers ++ lostNumbers
lostNumbersWith5 = 5 : lostNumbers

lostNumbersElem3 = lostNumbers !! 3

lostNumbersOfLN = [lostNumbers, lostNumbers]

-- List functions

cmpRes = lostNumbers < lostNumbersWith5

hLN = head lostNumbers
tLN = tail lostNumbers
lLN = last lostNumbers
iLN = init lostNumbers
lenLN = length lostNumbers
nullLN = null lostNumbers
reverseLN = reverse lostNumbers
takeLN = take 3 lostNumbers
dropLN = drop 3 lostNumbers
minLN = minimum lostNumbers
maxLN = maximum lostNumbers
sumLN = sum lostNumbers
prLN = product lostNumbers
ex4LN = elem 4 lostNumbers -- or 4 `elem` lostNumbers
ex100LN = elem 100 lostNumbers

-- Intervals

intvl = [1..20]
wintvl = ['a' .. 'z']
chintvl = [2, 4 .. 20]
rintvl = [20, 19 .. 1]

-- 13intvl = [13, 26..24*13] -- doesn't work
-- 13intvl = take 24 [13, 26..] -- doesn't work

infIntvl = take 10 (cycle [1, 2 ,3])
repIntvl = take 10 (repeat 5)
replIntvl = replicate 3 10 -- res [10, 10, 10]

-- List generators

chgen = [x * 2 | x <- [1..10]]
prechgen = [x * 2 | x <- [1..10], x * 2 >= 12]
premodgen = [x | x <- [50..100], mod x 7 == 3]

boomBang xs = [if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]

multipregen = [x | x <- [10..20], x /= 13, x /= 15, x /= 19]

addsetgen = [x + y | x <- [1..3], y <- [10, 100, 1000]]
mulsetgen = [x * y | x <- [2, 5, 10], y <- [8, 10 ,11]]
premulsetgen = [x * y | x <- [2, 5, 10], y <- [8, 10 ,11], x * y > 50]

nouns = ["man", "animal", "pen"]
adjs = ["happy", "strange", "awful"]
setnounsadjs xs ys = [x ++ " " ++ y | x <- xs, y <- ys]

mylen xs = sum [1 | _ <- xs]

removeNotUpperCase xs = [x | x <- xs, elem x ['A'..'Z']]

xxs = [[1..10], [3..7]]
removeOddGen p1 = [[x | x <- xs, even x] | xs <- p1]

-- Tuples

t1 = (1, 3)
t2 = (3, 'a', "hello")

listOfTuples = [(1,2,3), (3,4,5)]
-- listOfTuples = [(1,2,3), (3,5) -- got error because sizes are not compatible

firstT = fst (1, 2)
secondT = snd (1, 2)

-- zip functions
zipNumbers = zip [1, 2, 3] [5, 5, 5]
zipDifferent = zip [1..5]["One", "Two", "Three", "Four", "Five"]
zipSizes = zip [1..2]["1","3","4","123"]
zipInfNum = zip [1..]["Orange", "Blue", "White"]

-- task
-- len < 10, perim = 24, one angle eqauls 90 degrees
triples = [(a, b, c)| c <- [1..10], a <- [1..c], b <- [1..a] ,a^2+b^2 == c^2, a + b + c == 24]