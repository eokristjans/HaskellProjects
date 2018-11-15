-- Höfundur: Snorri Agnarsson, snorri@hi.is

-- Þýðið með eftirfarandi skipun:
--   ghc -o Pyth.exe --make Pyth.hs

-- Óendanlegur listi Pythagorasarþrennda
-- {(x,y,z) : x,y,z náttúrulegar tölur, x^2+y^2=z^2, gcd(gcd(x,y),z)=1}
pyth1 =
  [(x,y,z) | y <- [2..], 
             x <- [1..(y-1)], -- látum x hlaupa upp í endanlega tölu, annars fengjum við aldrei neitt
             let z=floor $ sqrt $ fromIntegral (x^2+y^2),
             x^2+y^2==z^2,
             (gcd (gcd x y) z)==1
  ]

-- Jafngilt pyth1
-- Einstæða (e. monad)
pyth2 = 
  do { y <- [2..]
     ; x <- [1..(y-1)]
     ; let z=floor $ sqrt $ fromIntegral (x^2+y^2)
     ; zz <- if x^2+y^2==z^2 then [z] else []
     ; if (gcd (gcd x y) zz)==1 then [(x,y,zz)] else []
     }


-- Jafngilt pyth1
pyth3 = 
  [2..] >>= \y ->
  [1..(y-1)] >>= \x ->
  (let
     z=floor $ sqrt $ fromIntegral (x^2+y^2)
   in 
     if x^2+y^2==z^2
       then
         [z]
       else
         []
  ) >>= \z ->
  if (gcd (gcd x y) z)==1
    then
      [(x,y,z)]
    else
      []

main :: IO ()
main =
    do { print (take 100 pyth1) }