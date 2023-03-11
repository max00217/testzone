package Class

class Person1(
    var firstName : String,
    var lastName : String,
    var age: Int
){
    val schoolName:String = "School"
    init{
        println("$schoolName")
    }
    fun getInfo() = println(" $firstName, $lastName, $age")
}
fun main(){
    val p1 = Person1("r", "a", 12)
    p1.getInfo()
}