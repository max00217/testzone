package Class

import javax.sql.rowset.FilteredRowSet

class Person2{
    var firstName: String = "A"
    var lastName: String = "b"
    var age: Int = 1231238887
    constructor(firstName : String, lastName : String, age: Int) {
        this.firstName = firstName
        this.lastName = lastName
        this.age = age
    }
    constructor(firstName: String, lastName: String) {
        this.firstName = firstName
        this.lastName = lastName
    }
}