package Class

class Rectangle(val width: Int, val height: Int){
    val area get() = this.width*this.height
}

class Triangle(val line: Int, val heightt: Int){
    val area get() = this.line*this.heightt/2
}

fun main(){
    val rectangle = Rectangle(3, 4)
    println("Width = ${rectangle.width} height=${rectangle.height}, area=${rectangle.area}")
    val triangle = Triangle(4, 6)
    println("Width = ${triangle.line} height=${triangle.heightt}, area=${triangle.area}")

}

