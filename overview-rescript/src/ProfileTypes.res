type userProfile = {
    name: string,
    age: int
}
type myUserProfile2 = {
    name: option<string>,
    age: int
}

type person = | User(userProfile) | Admin(userProfile) | Person(userProfile)
type person3 = | User3(userProfile) | Admin3(userProfile) | Person3(userProfile)

