fun main(){
    var a: String = "abc" //Regular initialization means non null by default
    var b: String? = "abc" // can be set to null
    b = null //ok
    val blx = if (b !=null) b.length else -1
    val blc = b?.length ?:-1

    println(a?.length) //Unnecessary sage calls
    println(b?.length)
    println(blx)
    println(blc)
}