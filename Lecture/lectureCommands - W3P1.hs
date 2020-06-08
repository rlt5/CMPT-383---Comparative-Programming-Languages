
(1, "Hello") :: (Int, String)
(1,2,3) :: (Int,Int,Int)

zip [1,2,3,4] "abcd"
-- [(1,'a'),(2,'b'),(3,'c'),(4,'d')]
zip :: [a] -> [b] = [(a,b)]