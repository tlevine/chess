type Operation = Integer -> Integer -> Integer

-- Current number, stored number, current operation
type State = (Integer, Integer, Operation)

-- Each character is a command.
type Command = State -> State

emptyOperation :: Operation
emptyOperation left right = (left * 10) + right

m :: Command
m (current, _) = (current, current)

r :: Command
r :: (_, stored) = (stored, stored)

operate :: Operation -> Command
operate operation (current, stored, _) = (current, stored, operation)







data Token = Digit Integer |
             Operation (Integer -> Integer) |

fromChar :: Char -> Token
fromChar char

showWord a b = a ++ " (" ++ b ++ ")"
instance Show Word where
  show (Name text) = showWord "Name" text
  show (Literal text) = showWord "Literal" text
  show (Number text) = showWord "Number" text
  show (SpecialCharacter text) = showWord "Special" text

calculate :: [Token] -> Integer
calculate
