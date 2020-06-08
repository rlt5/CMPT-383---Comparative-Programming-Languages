-- compile and run with:
--     ulimit -v 8388608  # 8GB
--     ghc -O2 tailrec.hs
--     time ./tailrec

stupidAdder :: Int -> Int -> Int
stupidAdder x 0 = x
stupidAdder x y = stupidAdder (x+1) (y-1)

stupidAdder' :: Int -> Int -> Int
stupidAdder' x 0 = x
stupidAdder' x y = 1 + stupidAdder' x (y-1)

myPower :: Int -> Int -> Int
myPower _ 0 = 1
myPower x y = x * myPower x (y-1)

myPower' :: Int -> Int -> Int
myPower' x y
  | y==0      = 1
  | even y    = half*half
  | odd y     = x*half*half
  where half = myPower' x (div y 2)

myPowerTailRec :: Int -> Int -> Int -> Int
myPowerTailRec a _ 0 = a
myPowerTailRec a x y = myPowerTailRec (x*a) x (y-1)

main :: IO ()
main = print (stupidAdder 1 500000000)
--main = print (stupidAdder' 1 500000000)
--main = print (myPower 1 400000000)
--main = print (myPowerTailRec 1 1 400000000)
--main = print (myPower' 1 400000000)
