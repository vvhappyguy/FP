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


