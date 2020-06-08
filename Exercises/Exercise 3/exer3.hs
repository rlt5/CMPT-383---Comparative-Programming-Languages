import Data.Time.Calendar
import Data.Time.Calendar.OrdinalDate
import Data.Tuple

-- Merging two already-sorted lists
merge :: Ord t => [t] -> [t] -> [t]
merge [] b = b
merge a [] = a
merge (a:b) (c:d)
    |   (a < c) = a:merge b (c:d)
    |   otherwise = c:merge (a:b) d

-- -------------------- TEST CODE --------------------
-- merge [2,4,6,8] [1,3,5,7]
-- merge [1,2,3,4] [5,6,7,8,9,10]
-- merge [4,5,7,8] [1,2,3,6,9]
-- merge "aeguz" "ceptw"
-- --------------------- RESULTS ---------------------
-- [1,2,3,4,5,6,7,8]
-- [1,2,3,4,5,6,7,8,9,10]
-- [1,2,3,4,5,6,7,8,9]
-- "aceegptuwz"


-- Tail Recursive Hailstone
hailstone:: Int -> Int
hailstone n 
    | even n = n `div` 2
    | odd n  = 3*n+1
hailLen:: Int -> Int
hailLen n = hailTail 0 n
    where 
        hailTail a 1 = a
        hailTail a n = hailTail (a+1) (hailstone n)
-- hailTail:: Int -> Int -> Int
-- hailTail a 1 = a
-- hailTail a n = hailTail (a+1) (hailstone n)

-- -------------------- TEST CODE --------------------
-- hailLen 11
-- hailLen 27
-- hailLen 686901248
-- hailLen 1
-- --------------------- RESULTS ---------------------
-- 14
-- 111
-- 270
-- 0


-- Factorial
fact :: Int -> Int
fact 0 = 1
fact n = n * fact (n-1)
-- -------------------- TEST CODE --------------------
-- fact 0
-- fact 5
-- fact 10
-- --------------------- RESULTS ---------------------
-- 1
-- 120
-- 3628800


-- Factorial with foldl
fact' :: Int -> Int
fact' n = foldl (*) 1 [1..n]
-- -------------------- TEST CODE --------------------
-- fact 0
-- fact 5
-- fact 10
-- --------------------- RESULTS ---------------------
-- 1
-- 120
-- 3628800


-- Haskell Library and Dates
daysInYear :: Integer -> [Day]
daysInYear y  = [jan1..dec31]
  where jan1  = fromGregorian y  1  1
        dec31 = fromGregorian y 12 31

isFriday :: Day -> Bool
isFriday day
    | snd (mondayStartWeek day) == 5 = True
    | otherwise                      = False
-- -------------------- TEST CODE --------------------
-- isFriday (fromGregorian 2018 5 17)
-- isFriday (fromGregorian 2018 5 18)
-- filter isFriday (daysInYear 2018)
-- --------------------- RESULTS ---------------------
-- False
-- True
-- [2018-01-05,2018-01-12,2018-01-19,…]

divisors :: Int -> [Int]
divisors n = [ i | i <- [2..(n `div` 2)], n `mod` i == 0] -- Generator

third :: (a,b,c) -> c
third (_,_,c) = c

getDay (y,m,d) = d

isPrimeDay :: Day -> Bool
-- isPrimeDay day 
--     |   divisors (getDay (toGregorian day)) == [] = True
--     |   otherwise                                 = False
isPrimeDay day
let x = (getDay (toGregorian day))
    |   divisors x == [] = True
    |   otherwise                                 = False
-- -------------------- TEST CODE --------------------
-- isPrimeDay (fromGregorian 2018 5 13)
-- isPrimeDay (fromGregorian 2018 5 14)
-- isPrimeDay (fromGregorian 2018 6 23)
-- --------------------- RESULTS ---------------------
-- True
-- False
-- True

primeFridays :: Integer -> [Day]
primeFridays a = [ day | day <- (daysInYear a), isFriday day, isPrimeDay day]
-- -------------------- TEST CODE --------------------
-- primeFridays 2018
-- --------------------- RESULTS ---------------------
-- [2018-01-05,2018-01-19,2018-02-02,2018-02-23,2018-03-02,2018-03-23,2018-04-13,2018-05-11,2018-06-01,2018-06-29,2018-07-13,2018-08-03,2018-08-17,2018-08-31,2018-09-07,2018-10-05,2018-10-19,2018-11-02,2018-11-23,2018-12-07]