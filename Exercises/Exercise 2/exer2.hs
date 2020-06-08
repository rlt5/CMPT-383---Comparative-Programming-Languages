-- Hailstone Length
hailstone n 
    | even n = n `div` 2
    | odd n  = 3*n+1

hailLen 1 = 0
hailLen n = 1 + hailLen ( hailstone n )

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

-- Primes and Divisors
divisors :: Int -> [Int]
divisors n = [ i | i <- [2..(n `div` 2)], n `mod` i == 0] -- Generator
primes :: Int -> [Int]
primes n = [i | i <- [2..n], divisors i == []]

-- -------------------- TEST CODE --------------------
-- divisors 30
-- divisors 64
-- divisors 127
-- primes 7
-- primes 100
-- --------------------- RESULTS ---------------------
-- [2,3,5,6,10,15]
-- [2,4,8,16,32]
-- []
-- [2,3,5,7]
-- [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97]


-- Joining Strings
join :: String -> [String] -> String
join _ [] = []
join _ (b:[]) = b
join a (b:c) = b ++ a ++ (join a c)

-- -------------------- TEST CODE --------------------
-- join ", " ["one","two","three"]
-- join "+" ["1","2","3"]
-- join "X" ["abc"]
-- join "X" []
-- --------------------- RESULTS ---------------------
-- "one, two, three"
-- "1+2+3"
-- "abc"
-- ""

-- Pythagorean Triples
pythagorean :: Int -> [(Int,Int,Int)]
pythagorean 5 = [(3,4,5)]
pythagorean x = [(a,b,c) | c <- [1..x],  b <- [1..c], a <- [1..b],  a*a + b*b == c*c]

-- -------------------- TEST CODE --------------------
-- pythagorean 10
-- pythagorean 30
-- --------------------- RESULTS ---------------------
-- [(3,4,5),(6,8,10)]
-- [(3,4,5),(6,8,10),(5,12,13),(9,12,15),(8,15,17),(12,16,20),(15,20,25),(7,24,25),(10,24,26),(20,21,29),(18,24,30)]