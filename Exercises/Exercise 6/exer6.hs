import Data.Ratio
-- Rational Numbers
---------------------------------------------------------------
divisors :: Int -> [Int]
divisors n = [ i | i <- [2..(n `div` 2)], n `mod` i == 0] -- Generator

rationalSum:: Int -> [Ratio Int]
rationalSum n = [ i % (n-i) | i <- [1..n-1]]
-- -------------------- TEST CODE --------------------
-- rationalSum 5
-- rationalSum 8
-- rationalSum 1
-- --------------------- RESULTS ---------------------
-- [1 % 4,2 % 3,3 % 2,4 % 1]
-- [1 % 7,1 % 3,3 % 5,1 % 1,5 % 3,3 % 1,7 % 1]
-- []


-- Lowest Terms Only
---------------------------------------------------------------
rationalSumLowest :: Int -> [Ratio Int]
rationalSumLowest n = [ i % (n-i) | i <- [1..n-1], i == numerator (i%(n-i))]
-- -------------------- TEST CODE --------------------
-- rationalSumLowest 5
-- rationalSumLowest 8
-- rationalSumLowest 12
-- --------------------- RESULTS ---------------------
-- [1 % 4,2 % 3,3 % 2,4 % 1]
-- [1 % 7,3 % 5,5 % 3,7 % 1]
-- [1 % 11,5 % 7,7 % 5,11 % 1]

-- All Rational Numbers
---------------------------------------------------------------
rationals :: [Ratio Int]
rationals =  concat [rationalSumLowest i | i <- [1..]]
-- -------------------- TEST CODE --------------------
-- take 20 rationals
-- elem (8%7) rationals
-- elem (8%16) rationals
-- elem (251%1237) rationals  -- make take a few seconds
-- elem (-1%2) rationals
-- --------------------- RESULTS ---------------------
-- [1 % 1,1 % 2,2 % 1,1 % 3,3 % 1,1 % 4,2 % 3,3 % 2,4 % 1,1 % 5,5 % 1,1 % 6,2 % 5,3 % 4,4 % 3,5 % 2,6 % 1,1 % 7,3 % 5,5 % 3]
-- True
-- True
-- True
-- infinite loop


-- Input/Output
---------------------------------------------------------------
parseLinesStringToInts :: String -> [Int]
parseLinesStringToInts string = map (read) (lines string) :: [Int]

sumFile :: IO ()
sumFile = do
    contents <- readFile "input.txt"
    print (sum (parseLinesStringToInts contents))
-- -------------------- TEST CODE --------------------
-- sumFile 
-- --------------------- RESULTS ---------------------
-- 164