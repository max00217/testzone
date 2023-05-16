package Android

import android.os.Bundle
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity
import androidx.constraintlayout.widget.ConstraintLayout
import androidx.constraintlayout.widget.ConstraintSet
import kotlin.random.Random

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val buttons = arrayOf(
            findViewById<Button>(R.id.button1),
            findViewById<Button>(R.id.button2),
            findViewById<Button>(R.id.button3),
            findViewById<Button>(R.id.button4),
            findViewById<Button>(R.id.button5),
            findViewById<Button>(R.id.button6)
        )

        val constraintLayout = findViewById<ConstraintLayout>(R.id.constraintLayout)

        buttons.forEach { button ->
            button.setOnClickListener {
                shuffleButtonsPosition(buttons, constraintLayout)
            }
        }
    }

    private fun shuffleButtonsPosition(buttons: Array<Button>, constraintLayout: ConstraintLayout) {
        val constraintSet = ConstraintSet()
        constraintSet.clone(constraintLayout)

        buttons.forEach { button ->
            val randomX = Random.nextInt(0, constraintLayout.width - button.width)
            val randomY = Random.nextInt(0, constraintLayout.height - button.height)

            constraintSet.connect(button.id, ConstraintSet.START, ConstraintSet.PARENT_ID, ConstraintSet.START, randomX)
            constraintSet.connect(button.id, ConstraintSet.TOP, ConstraintSet.PARENT_ID, ConstraintSet.TOP, randomY)
        }

        constraintSet.applyTo(constraintLayout)
    }
}
