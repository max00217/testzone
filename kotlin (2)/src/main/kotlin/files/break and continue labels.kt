fun main(){
    for(i in 1..3){
        for(j in 1..5) {
            if (j==3) break
            println("1 = $1 and j = $j")
        }
    }

    println("---------------")

    //outloop는 이름 설정 가능, 이줄 for문에 사용
    outloop@ for (i in 1..3) {
        for (j in 1..5){
            if (j == 3) break@outloop
            println("i = $i and j + $j")
        }
    }

    println("---------------")

    for (i in 1..3){
        for (j in 1..5){
            if (j == 3) continue
            println("i = $i and j = $j")
        }
    }

    println("---------------")

    outloop@ for (i in 1..3){
        for (j in 1..5){
            if (j == 3) continue@outloop
            println("i = $i and j = $j")
            
        }
    }
}