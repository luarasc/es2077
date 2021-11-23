//# declaração de variáves
let value = 30
/*
#escopo shadowing
.
.
.
*/
let value = ""

//# value prime
let value' = ""

let valueFloat = 1.1
let valueInt = 30

//#conversão de tipos
let valueF = 2.1
let valueI = 8

let convertToInt = valueF->Belt.Float.toInt
let convertToFloat = valueI->Belt.Int.toFloat
let res = convertToInt + convertToFloat->Belt.Float.toInt

//# Strings
let valueString = "1dsfsdfg"
let valueChar = 'a' // aspas simples apenas para um character
let convertCharToString = String.make(1, valueChar)
Js.log(convertCharToString)

let backTips = `12345 ${valueString} ${valueI->Belt.Int.toString}`

//# booleans
let isTrue = true
let isFalse = !(!true) && false

//# Arrays
let arr: array<int> = [1, 2, 3] // nao pode misturar tipos, deve ser homogeneo
let myTuple = (1, 2, 3)
let (a, b, c) = (3, 4, 5)

//#Mutabilidade
let myRef = ref(2)
myRef.contents = 12

//# User defined types
open ProfileTypes // ?
// ! semelhante a importar módulo.
let userProfilee : ProfileTypes.userProfile = {
  name: "Raul",
  age: 29,
}
type profileSource<'source> = {
  name: string,
  age: int,
  source: 'source,
}

type intProfile = profileSource<int>

let userProfile: intProfile = {
  name: "Raul",
  age: 29,
  source: 8,
}

let anotherUserProfile: AnotherProfileTypes.userProfile = {
  name: "Another",
  age: "30",
}

//# parametrização de tipos

// Todo tipo paramétrico:
// tem quer ter uma 'aspasimples .
// nao deve ser _Maiusculo
let userProfileA: AnotherProfileTypes.userProfile = {
  name: "Raul",
  age: "29",
}

//# spreed Operator
// Não funciona em arrays.
let spreedProfile: AnotherProfileTypes.userProfile = {
  ...userProfileA,
  age: "13",
}

//# Phantom type

type t

//# ADT, Algebric Data Types, "Variants"

let raul = User({
  name: "R",
  age: 29,
})

type person2 = User2(userProfile) | Admin2(userProfile) | Person2(userProfile)

let raul2 = User2({
  name: "R",
  age: 29,
})

type person3 = User3(profileSource<int>) | Admin3(userProfile) | Person3(userProfile)

let raul3 = User3({
  name: "R",
  age: 29,
  source: 30,
})

let fn = (person: ProfileTypes.person) => {
  switch person {
  | User({name}) => `Hello, ${name}`
  | Admin({name}) => `Hello, ${name}`
  | Person({name}) => `Hello, ${name}`
  }
}

// #Polyvariants

// type role = [ #admin | #user | #masteradmin ]

// let myPolyProfileRole: role = #admin
let myPolyProfileRole = #admin
let myPolyProfileUserRole = #user

let hello = role => {
  switch role {
  | #admin => "Hello, admin"
  | #user => "Hello, user"
  }
}

let _ = hello(myPolyProfileUserRole)

//# Funções + Argumentos nomeados

let hello = (~person: ProfileTypes.person, ~isSpecial) => {
  switch person {
  | User({name: "Raul"}) if isSpecial => `Hello, Raul SPECIAL`
  | User({name: "Raul"}) => `Hello, Raul`
  | User({name}) => `Hello, ${name}`
  | Admin({name}) => `Hello, ${name}`
  | Person({name}) => `Hello, ${name}`
  }
}

//menos error-prone
//#curry
let msg = hello(~person=raul)
let complemento = msg(~isSpecial=true)


//#Argumentos nomeados com valor padrao
let hello2 = (~person: ProfileTypes.person, ~isSpecial=true,  ()) => {
  switch person {
  | User({name: "Raul"}) if isSpecial => `Hello, Raul SPECIAL`
  | User({name: "Raul"}) => `Hello, Raul`
  | User({name}) => `Hello, ${name}`
  | Admin({name}) => `Hello, ${name}`
  | Person({name}) => `Hello, ${name}`
  }
}


let msg2 = hello2(~person=raul, ())

//#Pipe : data-first

let sumX = (str, ~isSpecial) => isSpecial ? `${str}-special` : `${str}-non-special`
let sumY = str => `${str}-y`
let sumZ = str => `${str}-z`

let str = "Raul"
//let result = sumZ( sumY( sumX( str,~isSpecial=false ) ) )
//===
let result = str 
-> sumX(~isSpecial=true) 
-> sumY 
-> sumZ


//#Pattern Matching

let hello2 = (~person: ProfileTypes.person, coords ) => {
  switch (person, coords) {
  | (User({name: "Raul"}), (30, 30)) => `Hello, Raul SPECIAL`
  | (User({name: "Raul"}), (20,20)) => `Hello, Raul`
  | (User({name}), (40, 50)) => `Hello, ${name}`
  | (Admin({name}), (80, 50)) => `Hello, ${name}`
  | (Person({name}), (30, 50)) => `Hello, ${name}`
  //catch-all
  |_ => `Hello`
  }
}

//# NUll : optional
let userProfilee: ProfileTypes.myUserProfile2 = {
  name: None,
  age: 29,
}