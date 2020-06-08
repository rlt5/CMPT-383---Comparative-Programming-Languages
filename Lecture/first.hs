half_of x = x/2
double x = x * 2

isBig a = a > 100
listify x y = [x,y]

-- myAnd False True = False
-- myAnd False False = False
-- myAnd True False = False
-- myAnd True True = True
myAnd False _ = False
myAnd True a = a

isZero 0 = True
isZero _ = False

myLength [] = 0
myLength (_:xs) = 1 + myLength xs

mySum [] = 0
mySum (x:xs) = x + mySum xs

listEqual [] [] = True
listEqual (x:xs) (y:ys) = (x == y) && (listEqual xs ys)
listEqual _ _ = False
--listEqual [] (_:_) = False
--listEqual (_:_)[] = False

hasEvenLength [] = True     -- base case: length 0 is even
hasEvenLength [_] = False   -- base case: length 1 is odd
hasEvenLength (_:_:rest) = hasEvenLength rest

mySignum x
  | x>0         = 1
  | x<0         = -1
  | otherwise   = 0

word n = case n of
  1 -> "one"
  2 -> "two"
  3 -> "three"
  _ -> "???"

wordx 1 = "one"
wordx 2 = "two"
wordx 3 = "three"
wordx _ = "???"

wordWithX n = (case n of
  1 -> "one"
  2 -> "two"
  3 -> "three"
  _ -> "???") ++ "X"

describeList lst = "The list is " ++ case lst of
  _:_:_:_:_  -> "fairly long"     --  >= 4 elements
  _:_        -> "short"           --  >= 1 element
  []         -> "empty"


firstSquares  n = [ i*i | i <- [1..n] ]
firstEvenSquares  n = [ i*i | i <- [1..n] , even i ]
firstEvenSquares'  n = [ i*i | i <- [2,4..n] ]

qs [] = []
qs (x:xs) = smaller ++ [x] ++ larger
  where smaller = qs [a | a <- xs, a <= x ]
        larger  = qs [a | a <- xs, a > x ]

qs' [] = []
qs' (x:xs) = 
  let smaller = qs' [ a | a <- xs, a <= x ]
      larger = qs' [ a | a <- xs, a > x ]
  in smaller ++ [x] ++ larger


somePowers x = [x, sq x, sq (sq x)]
  where sq n = n*n

-- x is an integer
myPower _ 0 = 1
myPower x y = x * myPower x (y-1)

myPower' x y
  | y == 0    = 1
  | even y    = half*half
  | odd y     = x*half*half
  where half = myPower' x  (div y 2)

-- {
-- Does not need call stack
stupidAdder x 0 = x
stupidAdder x y = stupidAdder (x+1) (y-1)

-- Needs call stack
stupidAdder' x 0 = x
stupidAdder' x y = 1 + stupidAdder' x (y-1)
-- }

myPowerTailRec a _ 0 = a
myPowerTailRec a x y = myPowerTailRec (x*a) x (y-1)

factorial 0 = 1
factorial n = n * factorial (n-1)

factorial' n = factorialTailRec 1 n
  where 
    factorialTailRec a 0 = a
    factorialTailRec a x = factorialTailRec (n*a) (n-1)

(+) 4 2