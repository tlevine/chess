import qualified Text.ParserCombinators.Parsec as P

data Token = Number String |
             Operation Char |
             M |
             R |
             Equal

number :: P.Parser Token
number = do x <- P.many1 P.digit
            return $ Number x

operation :: P.Parser Token
operation = do x <- P.choice $ map P.char ['+', '-', '*', '/']
               return $ Operation x

m :: P.Parser Token
m = do P.char 'M'
       return M

r :: P.Parser Token
r = do P.char 'R'
       return R

equal :: P.Parser Token
equal = do P.char '='
           return Equal

main = do putStrLn "hi"
