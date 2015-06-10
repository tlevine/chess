perSet :: [Integer]
perSet = [8, 2, 2, 2, 1, 1, 8, 2, 2, 2, 1, 1]

nSets pieces = minimum $ zipWith div pieces perSet
leftOver pieces = sum $ zipWith (-) pieces $ map (* (nSets pieces)) perSet

f :: [Integer] -> String
f pieces = (show $ nSets pieces) ++ "," ++ (show $ leftOver pieces)

main = do
  putStrLn $ f [34,86,70,46,30,65,92,59,99,16,43,13]
