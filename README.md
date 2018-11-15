# HaskellProjects

## Glósur
### Keyrsla og þýðing
* [Sækja Haskell](https://www.haskell.org/downloads)
* Keyra Haskell Interactive Mode með `ghci`

* Þýða Haskell með `ghc -o [filename].exe --make [filename].hs`

### Listar og straumar
Enginn munur á listum og straumum
    * `[1..]` er heil straumurinn
    * `take 10 [1..]` == `[1..10]` eru 10 fyrstu tölurnar er heil straumurinn
    * `[1,3..]` oddatölustraumurinn
    * `[x^2|x<-[1..20]]` prentar 20 fyrstu heiltölurnar í öðru veldi

### Lazy evaluation
 * `let f x y = x`   `f 1 [1..]`     skilar `1` því það er aldrei reiknað úr heiltölulistanum sem er ekki hluti af útkomunni

    * `foldr` og `foldl` taka eitt viðfang, skila falli sem tekur eitt viðfang, sem skilar falli sem skilar gildi.
        * Keimlík `listit` og `itlist`.
        * `foldr (\x y->x+y) 10 [1,2,3,4,5]` skilar summu gilda í listanum og tölunnar, þ.e. `25`.
        * `\` er jafngild `fun` eða `lambda`
        * `foldr (\x y->x-y) 0 [1,2,3,4,5]` reiknar aftan frá, þ.e.  (1 - (2 - (3 - (4 - (5 - 0))))) = 3
        * `foldl (\x y->x-y) 0 [1,2,3,4,5]` reiknar framan frá, þ.e.  0 - 1 - 2 - 3 - 4 - 5 = -15
    * `map (\x->x^2) [1..10]`
    * Snorri ritar `myMap f x = do {a<-x; return (f a)}`
        

### Keyrsluumhverfi
Hægt að hlaða inn skrá í keyrsluumhverfi með 

    ```
    :load "/home/erling/Documents/Forritunarmal/HaskellProjects/[fileName].hs
    :load "C:\\Users\\ellio\\Documents\\Forritunarmal\\HaskellProjects\\[filename].hs"
    ```

_virkar reyndar samt ekki að keyra t.d. `take 10 pyth1` eftir að hafa hlaðið því inn_
