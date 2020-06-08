divides a b = (a `mod` b) == 0
divisors n = filter (divides n) [2..(n `div` 2)]

mySum, mySum' :: [Int] -> Int
mySum [] = 0
mySum (x:xs) = x + mySum xs


(1, "Hello") :: (Int, String)
(1,2,3) :: (Int,Int,Int)
