import qualified Text.ParserCombinators.Parsec as P
import qualified Data.Map as Map

type Function = Integer -> Integer -> Integer

data Token = Number Integer |
             Operation Function |
             M |
             R |
             Equal

-- left, right, operation, stored
type State = (Integer, Integer, Function, Integer)

updateState :: Token -> State -> State
updateState (Number n) (left, _, op, stored) -> (left, n, op, stored)
updateState (Operation f) (left, right, op, stored) -> (op left right, 0, f, stored)
updateState M (left, right, op, _) -> (left, right, op, right)
updateState R (left, _, op, stored) -> (left, stored, op, stored)
updateState Equal (left, right, op, stored) -> (0, op left right, (+), stored)


initialState :: State
initialState = (0, 0, (+), 0) 

-- The left of the calculator program is the beginning of the list;
-- everything is reversed
--calculate :: [Token] -> Integer
--calculate = foldr applyToken emptyState

number :: P.Parser Token
number = do x <- P.many1 P.digit
            return $ Number 8 -- $ (read x) :: Integer

operation :: P.Parser Token
operation = do x <- P.choice $ map P.char ['+', '-', '*', '/']
               return $ Operation $ case x of
                 '+' -> (+)
                 '-' -> (-)
                 '*' -> (*)
                 '/' -> div

m :: P.Parser Token
m = do P.char 'M'
       return M

r :: P.Parser Token
r = do P.char 'R'
       return R

equal :: P.Parser Token
equal = do P.char '='
           return Equal

main = undefined
