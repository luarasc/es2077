// 1- Arquivos .res são modulos
// 2- Arquivos .res (Módulos) devem possuir um nome único
// 4- Sistemas de módulos do Rescript não trabaha com imports
// 5- O Sistema de módulos "não se preocupa" com a localização dos arquivos/módulos

let result = Math.sum(2,2)
Js.log(result)

let result2 = Math2.sum(Math.sum(2,1),3)
Js.log(result2)

let multResult = Math2.mult(result2, 3)
Js.log(multResult)


open Math
// open Math2

Js.log(sum(4,4))

// Alias para módulos
module MathTwo = Math2
open MathTwo
Js.log(mult(5,5))

// 3- É possível ter módulos dentro de módulos
 
 Js.log(Math3.Sum.sum(7,7))