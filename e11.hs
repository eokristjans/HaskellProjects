-- Einstaklingsverkefni 1
-- Notkun:  y = listAll i n f
-- Fyrir:   i og n eru heiltölur með i<=n+1
--          f er fall sem tekur inn heiltölu
-- Eftir:   y er listinn þar sem fallinu f hefur verið beitt á öll viðföng listans [i..n]
--          þ.e.a.s.    y = [f(i),f(i+1),...,f(n-1),f(n)]
listAll i n f = map f [i..n]

-- Keyrsludæmi úr ghci keyrsluumhverfi (sömu og á skjámynd):
Prelude> listAll (-10) 20 (\x -> x^2)
[100,81,64,49,36,25,16,9,4,1,0,1,4,9,16,25,36,49,64,81,100,121,144,169,196,225,256,289,324,361,400]
Prelude> listAll 4 5 (\x -> x+1)
[5,6]
Prelude> listAll 7 6 (\x -> x+1)
[]
Prelude> listAll 8 8 (\x -> x+1)
[9]


-- Einstaklingsverkefni 2
-- Notkun:  y = powerList x
-- Fyrir:   x er listi, x = [x1,x2,...,xN]
-- Eftir:   y er listi sem inniheldur alla undirlista x
powerList l = if null l then [[]] else append (powerList (tail l)) (map (\z -> ((head l):z)) (powerList (tail l)))

-- Hjálparfall fyrir einstaklingsverkefni 2
-- Notkun:  z = append x y
-- Fyrir:   x = [x1,x2,...,xN] og y = [y1,y2,...,yM] eru listar
-- Eftir:   z=[x1,x2,...,xN,y1,y2,...,yM] er listinn x skeyttur fram fyrir listann y
append x y = if null x then y else head(x) : append (tail x) y

-- Keyrsludæmi úr ghci keyrsluumhverfi (sömu og á skjámynd):
Prelude> powerList [1,2,3]
[[],[3],[2],[2,3],[1],[1,3],[1,2],[1,2,3]]
Prelude> powerList []
[[]]
Prelude> powerList "ABC"
["","C","B","BC","A","AC","AB","ABC"]