data Scheme = Resistance Integer | Parallel Scheme Scheme | Sequential Scheme Scheme

numberOfDigits n = if n < 10 then 1 else 1 + numberOfDigits (n `div` 10)

generateString c n = foldr (\t res -> res ++ c) "" [1..n]

schemeDimentions (Resistance n) = (1, 2 + numberOfDigits n)
schemeDimentions (Sequential s1 s2) =
    let
      (height1, width1) = schemeDimentions s1
      (height2, width2) = schemeDimentions s2
    in (max height1 height2, width1 + width2)
schemeDimentions (Parallel s1 s2) =
    let
      (height1, width1) = schemeDimentions s1
      (height2, width2) = schemeDimentions s2
    in (1 + height1 + height2, 4 + max width1 width2)

prepareStrings strings from to1 to2 input =
    let
      first = if input then "-+" else "+-"
      last = if input then " +" else "+ "
      doubleSpaces = "  "
      other = if input then " |" else "| "
    in [if k == from
        then curString ++ first
        else if k == to1
             then curString ++ last
             else if k > from && k < to1
                  then curString ++ other
                  else if k > to1 && k < to2
                       then curString ++ doubleSpaces
                       else curString
       | k <- [0..length strings - 1], let curString = strings !! k]

show' (Resistance n) (beginRow, width, height) strings =
    let
      (_, exactWidth) = schemeDimentions (Resistance n)
      cabel = generateString "-" (width - exactWidth)
      spaces = generateString " " width
    in [if k == beginRow
        then curString ++ "-" ++ show n ++ "-" ++ cabel
        else if k > beginRow && k < beginRow + height
             then curString ++ spaces
             else curString
       | k <- [0..length strings - 1], let curString = strings !! k]

show' (Sequential s1 s2) (beginRow, width, height) strings =
    let
      (_, width1) = schemeDimentions s1
    in show' s2 (beginRow, width - width1, height) (show' s1 (beginRow, width1, height) strings)

show' (Parallel s1 s2) (beginRow, width, height) strings =
    let
      (height1, _) = schemeDimentions s1
      preparedStrings = prepareStrings strings beginRow (beginRow + height1 + 1) (beginRow + height) True
      printedS1 = show' s1 (beginRow, width - 4, height1 + 1) preparedStrings
      printedS2 = show' s2 (beginRow + height1 + 1, width - 4, height - height1 - 1) printedS1
    in prepareStrings printedS2 beginRow (beginRow + height1 + 1) (beginRow + height) False

instance Show Scheme where
    show s =
        let
          (height, width) = schemeDimentions s
        in foldr (\string res -> res ++ string ++ "\n") "" (show' s (0, width, height) ["" | k <- [1..height]])
