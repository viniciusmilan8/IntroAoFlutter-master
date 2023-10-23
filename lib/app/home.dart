import 'package:flutter/material.dart';
import 'package:novoprojeto/app/componentes/custom_button.dart';
import 'componentes/menu.dart';

class ActivityPage extends StatefulWidget {
  ActivityPage({Key? key}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
    String history = '';
    String textToDisplay = '';
    String? res;
    String? operation;
    String? prevOperator;
    var firstNum;
    var secondNum;

  void btnOnClick(String btnVal) {
    if (btnVal == "C") {
      textToDisplay = "";
      res = '';
      operation = '';
    } else if (btnVal == "AC") {
      textToDisplay = "";
      res = '';
      operation = '';
      history = "";
      prevOperator = '';
    } else if (btnVal == "+/-") {
      if (textToDisplay != '') {
        if (textToDisplay[0] != '-') {
          textToDisplay = '-' + textToDisplay;
        } else {
          textToDisplay = textToDisplay.substring(1);
        }
      }
    } else if (btnVal == "<") {
      if (textToDisplay.isNotEmpty) {
        textToDisplay = textToDisplay.substring(0, textToDisplay.length - 1);
      }
    } else if (btnVal == "+" ||
        btnVal == "-" ||
        btnVal == "x" ||
        btnVal == "/") {
      if (prevOperator != '') {
        prevOperator = '';
        if (textToDisplay.isNotEmpty) {
          operation = btnVal;
          textToDisplay += btnVal;
        }
      } else if (textToDisplay.isNotEmpty) {
        prevOperator = btnVal;
        operation = '';
        textToDisplay += btnVal;
      }
    } else if (btnVal == "=") {
      if (textToDisplay.isNotEmpty && prevOperator != '') {
        List<String> parts = textToDisplay.split(prevOperator!);
        if (parts.length == 2) {
          double num1 = double.parse(parts[0]);
          double num2 = double.parse(parts[1]);
          double result;
          if (prevOperator == "+") {
            result = num1 + num2;
          } else if (prevOperator == "-") {
            result = num1 - num2;
          } else if (prevOperator == "x") {
            result = num1 * num2;
          } else if (prevOperator == "/") {
            if (num2 != 0) {
              result = num1 / num2;
            } else {
              result = 0.0; // You can handle division by zero as you like.
            }
          } else {
            result = 0.0;
          }
          textToDisplay = result.toString();
          history = '$num1 $prevOperator $num2';
        }
      }
    } else {
      textToDisplay += btnVal;
    }

    setState(() {});
  }

  void calculateResult() {
    if (firstNum != null && secondNum != null && operation != null) {
      double result;
      switch (operation) {
        case "+":
          result = firstNum + secondNum;
          break;
        case "-":
          result = firstNum - secondNum;
          break;
        case "x":
          result = firstNum * secondNum;
          break;
        case "/":
          if (secondNum != 0) {
            result = firstNum / secondNum;
          } else {
            result = 0.0; // Lidar com divisão por zero
          }
          break;
        default:
          result = 0.0;
      }
      textToDisplay = result.toString();
      history = '$firstNum $operation $secondNum';
      firstNum = result;
      secondNum = null;
      operation = null;
      res = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        drawer: Menu(context),
        backgroundColor: const Color(0xFF28527a),
        appBar: AppBar(
          title: const Text('Basic Calculator'),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    history,
                    style: const TextStyle(
                      fontSize: 30,
                      color: Color(0x66fffffff),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    textToDisplay,
                    style: const TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              // Primeira linha de botões
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    text: 'AC',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 20,
                    callback: btnOnClick,
                  ),
                  CustomButton(
                    text: 'C',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: btnOnClick,
                  ),
                  CustomButton(
                    text: '<',
                    fillColor: 0xFFf4d160,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: btnOnClick,
                  ),
                  CustomButton(
                    text: '/',
                    fillColor: 0xFFf4d160,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: btnOnClick,
                  ),
                ],
              ),
              // Segunda linha de botões
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    text: '7',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: btnOnClick,
                  ),
                  CustomButton(
                    text: '8',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: btnOnClick,
                  ),
                  CustomButton(
                    text: '9',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: btnOnClick,
                  ),
                  CustomButton(
                    text: 'x',
                    fillColor: 0xFFf4d160,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: btnOnClick,
                  ),
                ],
              ),
              // Terceira linha de botões
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    text: '4',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: btnOnClick,
                  ),
                  CustomButton(
                    text: '5',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: btnOnClick,
                  ),
                  CustomButton(
                    text: '6',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: btnOnClick,
                  ),
                  CustomButton(
                    text: '-',
                    fillColor: 0xFFf4d160,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: btnOnClick,
                  ),
                ],
              ),
              // Quarta linha de botões
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    text: '1',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: btnOnClick,
                  ),
                  CustomButton(
                    text: '2',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: btnOnClick,
                  ),
                  CustomButton(
                    text: '3',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: btnOnClick,
                  ),
                  CustomButton(
                    text: '+',
                    fillColor: 0xFFf4d160,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: btnOnClick,
                  ),
                ],
              ),
              // Quinta linha de botões
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    text: '+/-',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: btnOnClick,
                  ),
                  CustomButton(
                    text: '0',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: btnOnClick,
                  ),
                  CustomButton(
                    text: '00',
                    fillColor: 0xFF8ac4d0,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: btnOnClick,
                  ),
                  CustomButton(
                    text: '=',
                    fillColor: 0xFFf4d160,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callback: btnOnClick,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
