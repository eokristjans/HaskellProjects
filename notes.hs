-- Glósur
--      /=    not equal

-- Innbyggð föll:
--  min a b
--  max a b
--  succ a
--  div 92 10   > 9
--  rem 92 10   > 2

{-
Innbyggð föll, listar:
Listar þurfa að hafa öll gildin af sömu gerð
    ++          -- skeytir saman tveimur listum og/eða strengjum, jafngilt append?
    7 : 6 : [5,4,3,2,1]     > [7,6,5,4,3,2,1]
    head
    tail
    last [5,4,3,2,1]    > 1
    init [5,4,3,2,1]    > [5,4,3,2]
    take 3 [5,4,3,2,1]  > [5,4,3]
    take 3 [1..]        > [1,2,3]
    [5,4,3,2,1] !! 1    > 4
    reverse             -- snýr lista við
    maximum
    minimum
    sum
    product
    elem 3 [5,4,3,2,1]      > Tru
-}


{-
Innbyggð föll, straumar
    take 10 (cycle [1,2,3])             > [1,2,3,1,2,3,1,2,3,1]  
    [x*2 | x <- [1..10], x*2 >= 12]     > [12,14,16,18,20]  
    [x | x <- [50..100], mod x 7 == 3]  > [52,59,66,73,80,87,94]

    pyth1 =
      [(x,y,z) | y <- [2..], 
        x <- [1..(y-1)],
        let z=floor $ sqrt $ fromIntegral (x^2+y^2),
        x^2+y^2==z^2,
        (gcd (gcd x y) z)==1
      ]
-}

{-
Innbyggð föll, tuples & triples
Þurfa EKKI að hafa öll gildin af sömu gerð
    [(1,2),(8,11),(4,5)]            -- List of Tuples==Pairs
    [(1,2,3),(8,11,1),(4,5,1)]      -- List of Triples
    zip [1,2,3,4,5] [5,5,5,5,5]     > [(1,5),(2,5),(3,5),(4,5),(5,5)]

    fst (a,b)   > a
    snd (a,b)   > b
-}