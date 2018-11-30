-- í GHCI:    :load functions.hs

{-
h2.1
Notkun:   penultimate x
Fyrir:    x er listi með lágmark einu gildi
Gildi:    næstaftasta gildið í listanum x
-}
penultimate x =
  if null (tail (tail x))
    then head x
    else penultimate (tail x)


{-
h2.2    Hvorugt halaendurkvæmt
Notkun:   removePenultimate x
Fyrir:    x er listi með lágmark einu gildi
Gildi:    listinn x án næstaftasta gildisins í listanum x
-}
removePenultimate x = (init (init x)) ++ [last x]

removePenultimate1 x = 
  if null (tail (tail (tail x)))
    then (head x) : (tail (tail x))
    else (head x) : removePenultimate1 (tail x)

{-
h2.3    Halaendurkvæmt
Notkun:   myProduct x
Fyrir:    x er talnalisti
Gildi:    margfeldi talnanna í x
-}
myProduct x = 
  if null x
    then 1
    else if null (tail x)
      then head x
      else myProduct ( (head x) * (head (tail x)) : (tail (tail x)) )


{-
h2.4
Notkun:   myAppend x y
Fyrir:    x,y eru listar
Gildi:    x ++ y
-}
myAppend x y = 
  if null y   -- Sneggra að gá, því annars gæti maður framkvæmt 1000 aðgerðir í stað eins samanburðar
    then x    -- Líklega betra að hafa hjálparfall sem kemur í veg fyrir 1000 gagnslausa samanburði 
              -- if not (null y)     í upphafi
    else if null x
      then y
      else myAppend (init x) (last x : y)

{-
e2.1    Halaendurkvæmt
Notkun:   mySum x
Fyrir:    x er listi talna
Gildi:    summa gildanna í x
-}
mySum x =
  if null x
    then 0
    else if null (tail x)
      then head x
      else mySum ( (head x) + (head (tail x)) : (tail (tail x)) )

    
{-
e2.2
Notkun:   squaresum x
Fyrir:    x er listi talna
Gildi:    summa kvaðrata talnanna í x
-}
squaresum x = 
  if null x
    then 0
    else if null (tail x)
      then (head x)
      else squaresum ( (head x)*(head x)+(head (tail x))*(head (tail x)) : (tail (tail x)) )

{-

Notkun:   
Fyrir:    
Gildi:    
-}