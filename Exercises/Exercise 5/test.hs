import RainbowAssign
import System.Random
import qualified Data.Map as Map

pwLength, nLetters, width, height :: Int
filename :: FilePath
pwLength = 8            -- length of each password
nLetters = 5            -- number of letters to use in passwords: 5 -> a-e
width = 40              -- length of each chain in the table
height = 1000           -- number of "rows" in the table
filename = "table.txt"  -- filename to store the table

-- 1) Create a list of all of the divisors
-- 2) Create a list of all of the divisors being mod'd
-- 3) Take the length of it and reverse it
-- 4) Convert the digits in the list to letters and concat into string
pwReduce :: Int -> String
pwReduce a = pwDigToLetters (reverse (take pwLength (pwModList (pwDivList a))))

-- Takes in a number and returns the mod
pwMod :: Int -> Int
pwMod a = a `mod` nLetters

-- Takes in a number and returns the divides number
pwDiv :: Int -> Int
pwDiv a = a `div` nLetters

-- Creates the list of divisors used for mod'ing
pwDivList :: Int -> [Int]
pwDivList 0 = []
pwDivList a = a : pwDivList(pwDiv a)

-- Creates the list of mods
pwModList :: [Int] -> [Int]
pwModList [x] = [x]
pwModList (x:xs) = (pwMod x) : pwModList xs

-- keep the list of #'s but update the list to be the letters?
pwDigToLetters :: [Int] -> String
pwDigToLetters [] = ""
pwDigToLetters (x:xs) = [(toLetter x)] ++ (pwDigToLetters xs)
