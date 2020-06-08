myGcd :: Int -> Int -> Int
myGcd 0 b = b
myGcd a 0 = a
myGcd a b = myGcd b (mod a b)

divides :: Int -> Int -> Bool
divides a b = (a `mod` b) == 0

divisors :: Int -> [Int]
divisors n = filter (divides n) [2..(n `div` 2)]

mySum, mySum' :: [Int] -> Int
mySum [] = 0
mySum (x:xs) = x + mySum xs

mySum' xs = foldl (+) 0 xs

f :: Double -> Double -> Double
f x y = 2*x + 3*y

oneMore n _ = n+1
myLength xs = foldl oneMore 0 xs

prefix :: [t] -> t -> [t]
prefix xs x = x:xs

myReverse :: [t] -> [t]
myReverse xs = foldl prefix [] xs

val = 6

base, power :: Integer
base = 2
power = 64


myPower :: Int -> Int -> Int
myPower _ 0 = 1
myPower x y = x * myPower x (y-1)

theSame :: (Eq t) => t -> t -> Bool
theSame x y = x == y

infiniteStartingAt x = [x..]

-- Joining Strings
join :: String -> [String] -> String
join _ [] = []
join _ (b:[]) = b
join a (b:c) = b ++ a ++ (join a c)

commajoin :: [String] -> String
commajoin = join ", "

plusjoin :: [String] -> String
plusjoin = join "+"

