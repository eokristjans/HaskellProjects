-- Höfundur: Snorri Agnarsson, snorri@hi.is

-- Þýðið með eftirfarandi skipun:
--       ghc -o Pyth.exe --make Pyth.hs

pyth1 =
  [(x,y,z) | y <- [2..], 
             x <- [1..(y-1)],
             let z=floor $ sqrt $ fromIntegral (x^2+y^2),
             x^2+y^2==z^2,
             (gcd (gcd x y) z)==1
  ]




  
pyth2 = 
  do { y <- [2..]
     ; x <- [1..(y-1)]
     ; let z=floor $ sqrt $ fromIntegral (x^2+y^2)
     ; zz <- if x^2+y^2==z^2 then [z] else []
     ; if (gcd (gcd x y) zz)==1 then [(x,y,zz)] else []
     }

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

pyth4 = 
  concatMap
    (\y ->
      (
        filter
          (\(x,y,z) -> (gcd (gcd x y) z)==1)
          (filter
            (\(x,y,z) -> x^2+y^2==z^2)
            (concatMap
              (
                \x ->
                  let 
                    z=floor (sqrt (fromIntegral (x^2+y^2)))
                  in
                    [(x,y,z)]
              )
              [1..(y-1)]
            )
          )
      )
    )
    [2..]

pyth5 = 
  filter
    (\(x,y,z) -> (gcd (gcd x y) z)==1)
    (filter
      (\(x,y,z) -> x^2+y^2==z^2)
      (concatMap
        (
          \y ->
          (
            concatMap
              (
                \x ->
                  let 
                    z=floor (sqrt (fromIntegral (x^2+y^2)))
                  in
                    [(x,y,z)]
              )
              [1..(y-1)]
          )
        )
        [2..]
      )
    )

main :: IO ()
main =
    do
      print (take 10 pyth1)
      print (take 10 pyth2)
      print (take 10 pyth3)
      print (take 10 pyth4)
      print (take 10 pyth5)