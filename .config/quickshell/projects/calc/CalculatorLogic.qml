import QtQuick

QtObject {
    property string currentNumber: ""
    property string operator: ""
    property real firstNumber: 0
    property bool newNumber: true

    signal displayUpdated(string value)

    function updateDisplay(value) {
        displayUpdated(value);
    }

    function numberPressed(num) {
        if (newNumber) {
            currentNumber = num;
            newNumber = false;
        } else {
            currentNumber += num;
        }
        updateDisplay(currentNumber);
    }

    function operatorPressed(op) {
        firstNumber = parseFloat(currentNumber);
        operator = op;
        newNumber = true;
    }

    function calculate() {
        var secondNumber = parseFloat(currentNumber);
        var result = 0;

        switch (operator) {
        case "+":
            result = firstNumber + secondNumber;
            break;
        case "-":
            result = firstNumber - secondNumber;
            break;
        case "*":
            result = firstNumber * secondNumber;
            break;
        case "/":
            result = secondNumber !== 0 ? firstNumber / secondNumber : 0;
            break;
        }

        currentNumber = result.toString();
        updateDisplay(currentNumber);
        newNumber = true;
        operator = "";
    }

    function clear() {
        currentNumber = "0";
        firstNumber = 0;
        operator = "";
        newNumber = true;
        updateDisplay("0");
    }
}
