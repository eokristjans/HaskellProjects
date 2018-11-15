# HaskellProjects

## Glósur
### Keyrsla og þýðing
* Keyra Haskell Interactive Mode með `ghci`

* Þýða Haskell með `ghc -o [filename].exe --make [filename].hs`

### Listar og straumar
Enginn munur á listum og straumum
    * `[1..]` er heil straumurinn
    * `take 10 [1..]` == `[1..10]` eru 10 fyrstu tölurnar er heil straumurinn
    * `[1,3..]` oddatölustraumurinn
    * `[x^2|x<-[1..20]]` prentar 20 fyrstu heiltölurnar í öðru veldi

### Lazy evaluation
`let f x y = x`   `f 1 [1..]`     skilar `1` því það er aldrei reiknað úr heiltölulistanum sem er ekki hluti af útkomunni

### Keyrsluumhverfi
    * Hægt að hlaða inn skrá í keyrsluumhverfi með 
    ```:load "/home/erling/Documents/Forritunarmal/HaskellProjects/[fileName].hs```
    