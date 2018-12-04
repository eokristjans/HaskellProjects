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
      else mySum (a : b)
      where a = (head x) + (head (tail x))
            b = tail (tail x)

mySum2 x
  | null x          = 0
  | null (tail x)   = (head x)
  | otherwise       = mySum2 (a : b)
  where a = (head x) + (head (tail x))
        b = tail (tail x)

{-
e2.2
Notkun:   squareSum x
Fyrir:    x er listi talna
Gildi:    summa kvaðrata talnanna í x
-}
squareSum x = 
  if null x 
    then 0 
    else auxFuncSS ((head x)*(head x)) (tail x)
    where auxFuncSS ss x = 
            if null x 
              then ss
              else auxFuncSS (ss + (head x)*(head x)) (tail x)

{-
Notkun:   myMap f x
Fyrir:    x er listi, f er tvíundaraðgerð
Gildi:    f hefur verið beitt á öll stökin í x
-}
myMap f x = 
  if null x
    then []
    else (f (head x)) : (myMap f (tail x))

{-
e2.3 ------------------------ FALL SEM SKILAR FALLI ---------------------------
Notkun:   incall y
Fyrir:    y er tala
Gildi:    skilar falli sem tekur lista talna sem viðfang og leggur y við hvert stak í listanum
-}
incall y =
  returnFunc
  where 
    returnFunc x =
      if null x
        then []
        else (y+(head x)) : (returnFunc (tail x) )


---------------------------- LAMBDA REIKNINGUR -----------------------------
{-
h3.1  Lx.(Ly.x/y)
Notkun:   (\x -> (\y -> (x/y))) a b
Fyrir:    a b tölur
Gildi:    a / b
-}
h31 = (\x -> (\y -> (x/y)))

{-
h3.2  ((Lx.(Ly.x/y))3)6
Notkun:   (\x -> (\y -> (x/y))3)6
Fyrir:    
Gildi:   6 / 3 = 2
         ath að 3 fer fyrst inn í Ly, svo y verður 3
-}
h32 = (\x -> (\y -> (x/y))3)6

{-
e3.1  Lx.x/z
Notkun:   (\x -> x / z) a
Fyrir:    a er tala
Gildi:    Fall, ekki einfalt gildi.
          Skilar gildinu 1/z ef z er til og inniheldur tölu
-}
z = 5 -- óháð inntaki, z einhver fyrirfram skilgreind tala.
e31 = (\x -> x / z)

{-
h4.1    Halaendurkvæmt index
Notkun:   index n
Fyrir:    n >= 0 heiltala
Gildi:    listi allra heiltalna i, þ.a. 0 < i <= n í vaxandi röð
-}
index n =
  indexAuxFunc n []
    where -- setja fall í nýja línu
      indexAuxFunc n x = 
        if n == 0
          then x
          else indexAuxFunc (n-1) (n : x)


{-
h4.2    Halaendurkvæmt insertL (foldL)
Notkun:   insert f u x
Fyrir:    f tvíundarfall sem tekur lista af einhverju tagi
          x listi gilda af því tagi (ekki tómur)
          u gildi af því tagi
Gildi:    f (f ... ( f (f u x1) x2) ...) xN
-}
insert f u x =
  if null (tail x)
    then f u (head x)
    else insert f (f u (head x)) (tail x)


{-
h4.3a
Segð sem reiknar summu talnanna 1-50 með því að nota insert og index að ofan
Segð sem reiknar margfeldi talnanna 1-50 með því að nota insert og index að ofan
-}
h43a = insert (\x y -> x+y) 0 (index 50)
h43b = insert (\x y -> x*y) 1 (index 50)

{-
e4.1    Halaendurkvæmt sum1
Notkun:   sum1 n
Fyrir:    n >= 0 heiltala
Gildi:    Summan 0+1+...+n
-}
sum1 n = 
  sum1AuxFunc n 0
  where
    sum1AuxFunc n s =
      if n == 0
        then s
        else sum1AuxFunc (n-1) (s+n)


{-
e4.2    Halaendurkvæmt sum2
Notkun:   sum2 i n
Fyrir:    i <= n+1 heiltölur
Gildi:    Summan i + (i+1) + ... + n
-}
sum2 i n = 
  if i > n 
    then 0
    else sum2AuxFunc n i 0
  where
    sum2AuxFunc n i s =
      if n == i
        then s
        else sum2AuxFunc (n-1) i (s+n)

{-
e4.3    sum3
Notkun:   (sum3 i) n
Fyrir:    i <= n+1 heiltölur
Gildi:    Summan i + (i+1) + ... + n
-}
sum3 i =
  sum3ReturnFunction
  where 
    sum3ReturnFunction n =
      if i > n 
        then 0
        else sum3AuxFunc n 0
    sum3AuxFunc n s =
      if n == i
        then s 
        else sum3AuxFunc (n-1) (s+n)


{-
h5.1    byltaStraumi
Notkun:   byltaStraumi s
Fyrir:    s er óendanlegur straumur óendanlegra strauma
        s=[
            [x11 x12 x13 ...]
            [x21 x22 x23 ...]
            [x31 x32 x33 ...]
            ...
          ]
Gildi:    Óendanlegi straumurinn sem er byltingin af s, þ.e.
          [
            [x11 x21 x31 ...]
            [x12 x22 x32 ...]
            [x13 x23 x33 ...]
            ...
          ]
Scheme lausn:
  (define (byltastraumi s)
    (cons-stream
      (stream-map stream-car s)
      (byltastraumi (stream-map stream-cdr s))
    )
  )
-}


{-
h5.2    powerList
Notkun:   powerList x
Fyrir:    x er endanlegur listi
Gildi:    Listi allra undirlista x
-}
powerList x = 
  if null x
    then [[]]
    else
      (powerList (tail x)) ++ (map (\z -> (head(x):z)) (powerList (tail x)))

{-        SKOÐA / ENDURGERA Í STUÐI
e5.1    Halaendurkvæmt (\r p q -> rem r (p ^ q))
Notkun:   remainder r p q
Fyrir:    r p q jákvæðar heiltölur
Gildi:    rem r (p ^ q)
-}




{-
e5.2    streamCross
Notkun:   streamCross a b
Fyrir:    a=[a1 a2 a3 ...], b=[b1 b2 b3 ...] óendanlegir straumar
Gildi:    Óendanlegi straumurinn af óendanlegum straumum af tuples
          [
            [(a1 b1) (a1 b2) (a1 b3) ...]
            [(a2 b1) (a2 b2) (a2 b3) ...]
            [(a3 b1) (a3 b2) (a3 b3) ...]
          ]
Scheme lausn:
(define (stream-cross a b)
  (cons-stream
    (stream-map (lambda (x) (list (stream-car a) x)) b)
    (stream-cross (stream-cdr a) b)
  )
)
-}
streamCross a b = ((map (\x -> ( (head a),x) ) b) : (streamCross (tail a) b))
take 5 (map (\s -> take 5 s) (streamCross [1..] [1..])) -- prófunarfall


{-

Notkun:   
Fyrir:    
Gildi:    
-}



{-

Notkun:   
Fyrir:    
Gildi:    
-}


{-

Notkun:   
Fyrir:    
Gildi:    
-}



{-

Notkun:   
Fyrir:    
Gildi:    
-}


{-

Notkun:   
Fyrir:    
Gildi:    
-}



{-

Notkun:   
Fyrir:    
Gildi:    
-}


