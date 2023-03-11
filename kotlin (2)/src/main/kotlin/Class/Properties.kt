package Class

class Person{
    var firstName: String = "A"
    var lastName: String = "B"
    var age: Int = 1231311
}

fun neighbor(person:Person):Person{
    var result = Person()
    result.firstName = person.firstName
    result.lastName = person.lastName
    result.age = person.age
    return result
}