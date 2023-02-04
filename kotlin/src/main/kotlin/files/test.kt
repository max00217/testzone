fun main(){
    val dollar = '$'
    val x1 = "\$100.00"
    val x2 = "${"$"}100.00"
    val x3 = """${"$"}100.00"""
    val x4 = "${dollar}100.00"
    val x5 = """${dollar}100.00"""
    val x6 = "$100.00"

    println(x1)
    println(x2)
    println(x3)
    println(x4)
    println(x5)
    println(x6)


}