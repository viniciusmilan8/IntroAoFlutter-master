enum Operator { Addition, Subtraction, Multiplication, Division }

class CalculatorLogic {
  double textToDisplay = 0.0;
  double history = 0.0;
  double operationResult = 0;
  double num1 = 0;
  double num2 = 0;
  Operator? currentOperator;
  bool isDecimalMode = false; // Controla se a vírgula decimal está ativa.
  int decimalPlaces = 0; // Rastreia o número de casas decimais digitadas.

  void btnOnClick(double buttonValue) {
    if (buttonValue == 0) {
      clearAll();
    } else if (buttonValue == -2) {
      // Lógica de vírgula decimal
      if (!isDecimalMode) {
        isDecimalMode = true;
        decimalPlaces = 0;
        textToDisplay = textToDisplay * 10;
      }
    } else if (buttonValue == -3) {
      handleDeletion();
    } else if (isOperator(buttonValue)) {
      handleOperator(buttonValue);
    } else if (buttonValue == -4) {
      handleClearEntry();
    } else {
      handleDigitPress(buttonValue);
    }
  }

  bool isOperator(double val) {
    return val == -5 || val == -6 || val == -7 || val == -8;
  }

  void handleOperator(double val) {
    if (currentOperator != null) {
      performCalculation();
      num1 = operationResult;
    } else {
      num1 = textToDisplay;
    }
    currentOperator = operatorFromValue(val);
    textToDisplay = 0.0;
    isDecimalMode = false;
  }

  Operator operatorFromValue(double val) {
    switch (val) {
      case -5:
        return Operator.Addition;
      case -6:
        return Operator.Subtraction;
      case -7:
        return Operator.Multiplication;
      case -8:
        return Operator.Division;
      default:
        throw ArgumentError("Operador não suportado");
    }
  }

  void performCalculation() {
    if (num1 != 0 && num2 != 0 && currentOperator != null) {
      switch (currentOperator) {
        case Operator.Addition:
          operationResult = num1 + num2;
          break;
        case Operator.Subtraction:
          operationResult = num1 - num2;
          break;
        case Operator.Multiplication:
          operationResult = num1 * num2;
          break;
        case Operator.Division:
          if (num2 != 0) {
            operationResult = num1 / num2;
          } else {
            operationResult = 0.0; // Lidar com a divisão por zero
          }
          break;
        case null:
          // TODO: Handle this case.
      }
    }
  }

  void handleDigitPress(double buttonValue) {
    if (operationResult != 0) {
      textToDisplay = buttonValue;
      operationResult = 0;
      isDecimalMode = false;
      decimalPlaces = 0;
    } else if (isDecimalMode) {
      if (decimalPlaces < 15) {
        double decimalFactor = 1.0;
        for (int i = 0; i <= decimalPlaces; i++) {
          decimalFactor /= 10.0;
        }
        textToDisplay += buttonValue * decimalFactor;
        decimalPlaces++;
      }
    } else {
      textToDisplay = textToDisplay * 10 + buttonValue;
    }
  }

  void handleClearEntry() {
    textToDisplay = 0.0;
    isDecimalMode = false;
    decimalPlaces = 0;
  }

  void handleDeletion() {
    if (!isDecimalMode) {
      textToDisplay = (textToDisplay ~/ 10).toDouble();
    } else {
      if (decimalPlaces > 0) {
        textToDisplay = (textToDisplay * 10).toDouble();
        decimalPlaces--;
      } else {
        isDecimalMode = false;
      }
    }
  }

  void clearAll() {
    textToDisplay = 0.0;
    history = 0.0;
    operationResult = 0;
    num1 = 0;
    num2 = 0;
    currentOperator = null;
    isDecimalMode = false;
    decimalPlaces = 0;
  }
}
