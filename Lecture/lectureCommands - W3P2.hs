bigCalculation :: Integer -> Integer
bigCalculation n = n^n^n

-- take 0 _ = []
-- take n (x:xs) = x : take (n-1) xs
foldl (+) 0 [1,2,3]

funnyDivisors n   = map pred (divisors (n*2))
funnyDivisors' n  = ((map pred) $ (divisors (n*2))
funnyDivisors'' n = ((map pred) . (divisors (*2))) $ n
funnyDivisors'''  = ((map pred) . (divisors (*2)))


let infList = [1..]
let bigResults = [bigCalculation i | i <- [1..100000]]
take 3 bigResults
bigResults !! 5
let x = bigCalculation 1000
let y = x + 1

