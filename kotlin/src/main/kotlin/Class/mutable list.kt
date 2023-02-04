fun main(){
    val intList = mutableListOf(1,2,3,4)
    intList.remove(2)
    intList.add(5)
    println("Modified List = $intList")
    intList.addAll(listOf(6,7))
    println("added List = $intList")
    intList.removeAt(0)
    println("removed List = $intList")
    intList[0] = 0
    println("intList[0] = 0 = $intList")
    intList.shuffle()
    println(intList)
}

