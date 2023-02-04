package Class

open class Shape{
    open fun draw() {/*...*/}
    fun fill() {/*...*/ }
}

class Circle() : Shape() {
    override fun draw() {/*...*/}
}


open class Shape0 {
    open val vertexCount: Int = 0
}