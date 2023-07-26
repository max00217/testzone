function Fizzbuzz() {
    for (var i = 1; i <= 100; i++) {
        if (i % 15 == 0) {
            console.log("FizzBuzz");
        } else if (i % 3 == 0) {
            console.log("Fizz");
        } else if (i % 5 == 0) {
            console.log("Buzz");
        } else {
            console.log(i + "");
        }
    }
}

Fizzbuzz();

var Bottle = 99;
function Bottle99() {
    while (Bottle > -1) {
        if (Bottle > 1) {
            console.log(Bottle + " bottles of beer on the wall, " + Bottle + " bottles of beer.");
            Bottle -= 1;
            console.log("Take one down and pass it around, " + Bottle + " bottles of beer on the wall.\n");
        } else if (Bottle >= 1) {
            console.log(Bottle + " bottle of beer on the wall, " + Bottle + " bottle of beer.");
            Bottle -= 1;
            console.log("Take one down and pass it around, No more bottle of beer on the wall.\n");
        } else if (Bottle == 0) {
            console.log("No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.");
            Bottle -= 1;
        }
    }
}