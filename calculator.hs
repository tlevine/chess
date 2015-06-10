data StorageOperation = M | R

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
