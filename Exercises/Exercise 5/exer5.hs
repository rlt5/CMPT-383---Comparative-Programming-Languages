hailstone:: Int -> Int
hailstone n 
    | even n = n `div` 2
    | odd n  = 3*n+1

hailSeq :: Int -> [Int]
hailSeq n = (takeWhile (> 1) [ x | x <- (iterate hailstone n)]) ++ [1]

hailSeq' :: Int -> [Int]
hailSeq' n = (myTakeWhile (> 1) [ x | x <- (myIterate hailstone n)]) ++ [1]

-- Built-In Functions
---------------------------------------------------------------
myIterate :: (a -> a) -> a -> [a]
myIterate f x = [x] ++ (myIterate f (f x))

myTakeWhile :: (a -> Bool) -> [a] -> [a]
myTakeWhile f (a:b)
    | (f a) = [a] ++ (myTakeWhile f b)
    | otherwise = []

-- -------------------- TEST CODE --------------------
-- hailSeq' 1
-- hailSeq' 11
-- hailSeq' 6
-- --------------------- RESULTS ---------------------
-- [1]
-- [11,34,17,52,26,13,40,20,10,5,16,8,4,2,1]
-- [6,3,10,5,16,8,4,2,1]


-- Pascal's Triangle
---------------------------------------------------------------
addArray:: (Num a) => [a] -> [a] -> [a]
addArray [] [] = []
addArray (a:b) (c:d) = [(a+c)] ++ (addArray b d)

takeAllExceptFirst :: [a] -> [a]
takeAllExceptFirst (a:b) = b
takeAllExceptFirst [] = []

takeAllExceptLast :: [a] -> [a]
takeAllExceptLast a = take (length a - 1) a

pascal :: Int -> [Int]
pascal 0 = [1]
pascal a = [1] ++ (addArray (takeAllExceptFirst (pascal (a-1))) (takeAllExceptLast (pascal (a-1))) ) ++ [1]

-- -------------------- TEST CODE --------------------
-- pascal 0
-- pascal 1
-- pascal 2
-- pascal 3
-- pascal 12
-- --------------------- RESULTS ---------------------
-- [1]
-- [1,1]
-- [1,2,1]
-- [1,3,3,1]
-- [1,12,66,220,495,792,924,792,495,220,66,12,1]


-- Pointfree Addition
---------------------------------------------------------------
addPair :: (Num a) => (a, a) -> a
addPair = uncurry (+)
-- -------------------- TEST CODE --------------------
-- addPair (2,3)
-- addPair (100, 3+4)
-- --------------------- RESULTS ---------------------
-- 5
-- 107

-- Pointfree Filtering
withoutZeros :: (Num a, Eq a) => [a] -> [a]
withoutZeros = filter (/= 0)
---------------------------------------------------------------
-- -------------------- TEST CODE --------------------
-- withoutZeros [1,2,0,3,4,0,5,6,0]
-- withoutZeros [0.0, 0.1, 0.2, 0.3]
-- --------------------- RESULTS ---------------------
-- [1,2,3,4,5,6]
-- [0.1,0.2,0.3]


-- Exploring Fibonacci
-- fib :: Int -> Int
-- fib 0 = 0;
-- fib 1 = 1;
-- fib x = (fib (x-1)) + (fib (x-2))
fib :: Int -> Int
fib 0 = 0;
fib 1 = 1;
fib a = fib (a-1) + fib (a-2)
---------------------------------------------------------------
-- -------------------- TEST CODE --------------------
-- fib 0
-- fib 1
-- fib 2
-- fib 3
-- fib 10
-- fib 20
-- --------------------- RESULTS ---------------------
-- 0
-- 1
-- 1
-- 2
-- 55
-- 6765

fibs ::  [Int]
fibs = map fib [0..]

-- main = print (fib 33)


-- Something Else
---------------------------------------------------------------
things :: [Integer]
things = 0 : 1 : zipWith (+) things (tail things)