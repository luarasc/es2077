type userProfile = {
    name: string,
    age: string,
}

type person3 = | User3(userProfile) | Admin3(userProfile) | Person3(userProfile)
