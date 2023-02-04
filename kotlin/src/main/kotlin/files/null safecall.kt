fun main(){
    var a: String = "abc" //Regular initialization means non null by default
    var b: String? = "abc" // can be set to null
    b = null //ok
    println(a?.length) //Unnecessary sage calls
    println(b?.length)
}