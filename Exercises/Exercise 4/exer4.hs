import Data.Maybe

-- Hailstone, Again
---------------------------------------------------------------
hailstone:: Int -> Int
hailstone n 
    | even n = n `div` 2
    | odd n  = 3*n+1

hailSeq:: Int -> [Int]
hailSeq 1 = [1]
hailSeq n = n : (hailSeq (hailstone n))

-- -------------------- TEST CODE --------------------
-- hailSeq 1
-- hailSeq 11
-- hailSeq 6
-- --------------------- RESULTS ---------------------
-- [1]
-- [11,34,17,52,26,13,40,20,10,5,16,8,4,2,1]
-- [6,3,10,5,16,8,4,2,1]

hailSeq' :: Int -> [Int]
hailSeq' n = (takeWhile (> 1) [ x | x <- (iterate hailstone n)]) ++ [1]
-- -------------------- TEST CODE --------------------
-- hailSeq' 1
-- hailSeq' 11
-- hailSeq' 6
-- --------------------- RESULTS ---------------------
-- [1]
-- [11,34,17,52,26,13,40,20,10,5,16,8,4,2,1]
-- [6,3,10,5,16,8,4,2,1]


-- Joining Strings, Again
---------------------------------------------------------------
join:: String -> [String] -> String
join _ [] = ""
join func (begin:end) = foldl operation begin end
    where 
        operation begin end = begin ++ func ++ end
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


-- Merge Sort
---------------------------------------------------------------
merge :: (Ord t) => [t] -> [t] -> [t]
merge [] b = b
merge a [] = a
merge (a:b) (c:d)
    |   (a < c) = a:merge b (c:d)
    |   otherwise = c:merge (a:b) d

splitMerge:: (Ord t) => [t] -> ([t],[t])
splitMerge list = splitAt ((length list) `div` 2) list

mergeSort:: (Ord t) => [t] -> [t]
mergeSort [] = []
mergeSort [a] = [a]
mergeSort list = merge (mergeSort left) (mergeSort right) 
    where (left, right) = splitMerge list
-- -------------------- TEST CODE --------------------
-- mergeSort [1,9,3,2,7,6,4,8,5]
-- mergeSort [6,2,4,8,9,5,3,1,7,10]
-- mergeSort []
-- mergeSort [4]
-- mergeSort "The quick brown fox jumps over the lazy dog."
-- --------------------- RESULTS ---------------------
-- [1,2,3,4,5,6,7,8,9]
-- [1,2,3,4,5,6,7,8,9,10]
-- []
-- [4]
-- "        .Tabcdeeefghhijklmnoooopqrrstuuvwxyz"


-- Searching? Maybe?
---------------------------------------------------------------
findElt :: (Eq t) => t -> [t] -> Maybe Int
findElt elt list = case Just [ i | i <- [0..(length list)-1], (list !! i) == elt ] of
    Just (a:b) -> Just a
    Just [] -> Nothing
-- -------------------- TEST CODE --------------------
-- findElt 8 [4,5,2,8,7,3,1]
-- findElt 6 [4,5,2,8,7,3,1]
-- findElt 'o' "Hello World!"
-- findElt 'q' "Hello World!"
-- --------------------- RESULTS ---------------------
-- Just 3
-- Nothing
-- Just 4
-- Nothing