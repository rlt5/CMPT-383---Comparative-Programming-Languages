import Data.Bits
countingBits :: Int -> Int
countingBits 0 = 0
countingBits n = countingBits ( bit n `shiftR` 1 ) + n % 2