
/// type of integer is implied, but f sharp also interprets the recommended type used
/// we can hover a variable to see its type
(*this is how to block comments
*) // this is a line comment
/// this is for xml document comments
let won = 1
let hello = "hello"
let dubble = 1.0
let isTrue = true
isTrue = false // this will be displayed as IT in interactive
/// = is == in other

//if you want a value to be mutable
let mutable isTruemut = true // avoid those

// func
let myadd x y = x + y
let add5 x = x + 5
// you can nest let
let add5ish x =
    let y = 5
    x+y
///lambda funct
let myadd' = fun x y -> x+y // same as myadd
///currying or making it into two one parameter function that return one value
let myadd'' x = fun y -> x+y // f sharp actually makes myadd into a curried function naturally!

//layered func
let add5' x = myadd x 5


// if you want to make x a specific int
let add5int (x:int)= x+5

add5int 6 // works!

//function composition
let myop number = (2. * (number +3.)) ** 2. //the . is to make floats (required for exponents)
//however this does not account for order of operations!

let add3native number = number +3
//infix notation to simplify
let add3  = (+) 3.
let mult2 num = num*2.
let pow2  num = num ** 2.

let myopnew num =
    num
    |> add3
    |> mult2
    |> pow2
myopnew 1. // WORKS DOPE

// PIPE NOTATION is |> use it alot

//composition operator is also an option

let myopnew' =
    add3
    >>mult2
    >>pow2
myopnew' 1.

//to define new operaters! be careful tho

let (><>) f g =
    fun x -> x
    |> f
    |> g

/// BE GOBEIL'S TUTORIAL, 42:55 TO CONTINUE







let primetest (x:int) =
    let a = 2.
    let min1 = x-1
    let test = a ** float(min1)
    let res = test - 1.
    let final = res%float(x)
    if res%float(x) = float(0) then true
    else false





primetest 100001



let factortest (p:int) =
    let stop = p-1
    let seq = [2..stop]
    for i in seq do
        if float(p)%float(i) = 0. then printfn "%d is a divisor" i

factortest 341

factortest 5044132



let prime (x:int) =
    let pp = primetest x
    if pp = true then printfn "%d is prime" x
    else factortest x



prime 7





//WORKS :)

(*these fail
let fermatlittle (p:int) (a:int)=
    let prim = primetest p
    if prim = true then printfn "Prime confirmed"
    else printfn "P is not Prime"
    let exp = float(a) ** float(p)
    let step2 = exp - float(a)
    if step2%float(p) = 0. then "Fermat was right tbh"
    else "check fermatcorrect"

fermatlittle 301 2

let fermatcorrect (p:int) (a:int) =
    let prim = primetest p
    if prim = true then printfn "Prime confirmed"
    else printfn "P is not Prime"
    let pmin1 = p-1
    let exp = float(a) ** float(pmin1)
    if exp%float(p) = 1. then "fermat true here tho" else "bruh"

fermatcorrect 301 5*)



