import Data.Bits

shift1:: Int -> Int
shift1 a = a `shiftL` 1

myPopCount:: Int -> Int
myPopCount 0 = 0
myPopCount a
    |   ((.&.) a 1) == 1 = 1 + (myPopCount (a `shiftR` 1))
    |   otherwise = myPopCount (a `shiftR` 1)