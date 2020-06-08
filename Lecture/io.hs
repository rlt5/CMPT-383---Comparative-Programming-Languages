secondLine' :: IO String
secondLine' = 
    getLine >>= (\line1
    -> getLine >>= (\line2
    -> return line2))

secondLine :: IO String
secondLine = do
    line1 <- getLine
    line2 <- getLine
    -- return (line1 ++ line2)
    return line2
    -- line2 is a string. Return is a function that takes the string and wraps it into a Monad