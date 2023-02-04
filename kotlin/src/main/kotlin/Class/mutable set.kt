fun main(){
    val intSet = mutableSetOf(1,2,3,4)
    println("Default inSet = $intSet")
    intSet.add(7)
    println("intSet.add(7) = ${intSet}")
    intSet.remove(3)
    println("intSet.remove(3) = ${intSet}")
    intSet.removeIf({it < 3})
    println("intSet.removeIf({it < 3}) = ${intSet}")
}

