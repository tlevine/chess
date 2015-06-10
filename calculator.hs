import qualified Text.ParserCombinators.Parsec as P
import qualified Data.Map as Map

type Function = Integer -> Integer -> Integer

data Token = Number Integer |
             Operation Char |
             M |
             R |
             Equal

-- The left of the calculator program is the beginning of the list;
-- everything is reversed
--calculate :: [Token] -> Integer
--calculate = foldr applyToken emptyState

number :: P.Parser Token
number = do x <- P.many1 P.digit
            return $ Number 8 -- $ (read x) :: Integer

operationMapping :: Map.Map Char Function
operationMapping = Map.fromList [('+', (+)), ('-', (-)),
                                 ('*', (*)), ('/', div)]

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
