-- Verkefni 1
-- Notkun:  y = reverseListAsListOfLists x
-- Fyrir:   x er listi [x1,...,xN], má vera tómur
-- Gildi:   y er listinn [[xN],[xN-1],...,[x2],[x1]]
-- Ef x er tómur, skila y
reverseList l = foldl (\x y -> [y]:x) [] l
{-
Prelude> reverseList [1,2,3,4,5]
[[5],[4],[3],[2],[1]]
Prelude> reverseList []
[]

map (\x->[x]) [1,2,3]
[[1],[2],[3]]
foldl (\x y -> [y]:x) [] 1
[49,47,45,43,41,39,37,35,33,31,29,27,25,23,21,19,17,15,13,11,9,7,5,3,1]
-}


-- Verkefni 2
-- Notkun:  y = sumOfProducts x
-- Fyrir:   x er listi lista af fleytitölum
--          þ.e.a.s. x = [[x11,...,x1N],[x21,...,x2M],...,[xK1,...,xKL]]
--              þ.s. N,M,K,L eru náttúrulegar tölur
-- Eftir:   y er summa margfeldanna af gildum innri listanna
--          þ.e.a.s. y = x11*...*x1N + x21*+++*x2M + xK1*...*xKL
sumOfProducts l = auxFunc l 0.0 where auxFunc x u | null x = u | otherwise = auxFunc (tail x) (1.0 * product (head x) + u)

{-
product (head [[2,3],[4,5]])
6
-}