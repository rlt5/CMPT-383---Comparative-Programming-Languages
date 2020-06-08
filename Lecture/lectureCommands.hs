-- ============================ FIELD COMPREHENSION ============================

------- generator -------
[ x^2 + 1 | x <- [1,2,3,4,5,6,7,8,9,10] ]
-- [2,5,10,17,26,37,50]


------- Successor-------
[ succ c | c <- "hello"]
-- "ifmmp"
[ succ c | c <- [10, 20, 30, 40] ]
-- [11,21,31,41]
[ 10*x + y | x <- [3,4,5], y <- [6,7,8,9] ]
-- [36,37,38,39,46,47,48,49,56,57,58,59]
[ even x | x <- [0,1,2,3,4,5,6,7,8,9,10] ]
-- [True,False,True,False,True,False,True,False,True,False,True]
[ x^2+1 | x <- [0,1,2,3,4,5,6,7] , even x]
-- [1,5,17,37]

-- ARITHEMETIC SEQUENECE ONLY NO GEOMETRIC
[1..6]
[1..100]
[1,3..101]
[1,3..100]
[1.0, 1.5..100]


-- PYTHON CODE
-- import sys
-- sys.getrecursionlimit
-- sys.getrecursionlimit()

-- SHELL COMMANDS
ulimit -v 4194304
ghc -O2 tailrec.hs -- The -O2 is level 2 optimization used for tail recursion