1. Notið foldl eða foldr, sem eru innbyggð föll í Haskell, til að búa til
Haskell fall sem tekur sem viðfang lista gilda [x1,x2,...,xN] og skilar listanum
[[xN],...,[x2],[x1]]. Stofninn á fallinu skal vera eitt kall á foldl eða foldr með
viðeigandi viðföngum.

-- Notkun:  y = reverseListAsListOfLists x
-- Fyrir:   x er listi [x1,...,xN], má vera tómur
-- Gildi:   y er listinn [[xN],[xN-1],...,[x2],[x1]]
-- Ef x er tómur, skila y


map (\x->[x]) [1,2,3]
[[1],[2],[3]]

foldl (\x y-> y:x) [] [1,3..50]
[49,47,45,43,41,39,37,35,33,31,29,27,25,23,21,19,17,15,13,11,9,7,5,3,1]

2. Skrifið fall í Haskell sem tekur eitt viðfang sem er listi lista af fleytitölum og
skilar summunni af margfeldunum af gildum innri listanna. Athugið að summa
núll talna er 0.0 og margfeldi núll talna er 1.0.

-- Notkun:  y = sumOfProducts x
-- Fyrir:   x er listi lista af fleytitölum
--          þ.e.a.s. x = [[x11,...,x1N],[x21,...,x2M],...,[xK1,...,xKL]]
--              þ.s. N,M,K,L eru náttúrulegar tölur
-- Eftir:   y er summa margfeldanna af gildum innri listanna
--          þ.e.a.s. y = x11*...*x1N + x21*+++*x2M + xK1*...*xKL

