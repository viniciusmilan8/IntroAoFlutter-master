import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:novoprojeto/app/componentes/bot%C3%A3o.dart';
import 'package:novoprojeto/app/componentes/constant.dart';
import 'package:novoprojeto/app/componentes/menu.dart';

class ActivityPage extends StatefulWidget {
  ActivityPage({Key? key}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  var userInput = '';
  var result = '';
  bool isDarkModeEnabled = false;
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(context),
      backgroundColor:const Color(0xFF28527a),
      appBar: AppBar(
        backgroundColor:Colors.blueGrey,
        centerTitle: true,
        title: Text(
          'Calculadora',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 50,
              width: 75,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.bottomRight,
                color: isDarkModeEnabled ? blackDarkMode : whiteDarkShareColorC,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  child: SingleChildScrollView(
                    child: TextField(
                      controller: _textEditingController,
                      style: TextStyle(
                          fontSize: 50,
                          color: isDarkModeEnabled ? offWhite : Colors.black),
                      readOnly: true,
                      textAlign: TextAlign.right,
                      autofocus: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color:
                    isDarkModeEnabled ? black2ndVersionDarkMode : whiteColorC,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          MyButton(
                            title: 'C',
                            onPress: () {
                              userInput = '';
                              result = '';
                              _textEditingController.text = '';
                            },
                            colorText: blueOperatorsColorC,
                          ),
                          MyButton(
                            title: '7',
                            onPress: () {
                              userInput += '7';
                              _textEditingController.text = userInput;
                            },
                            colorText:
                                isDarkModeEnabled ? offWhite : blackColorC,
                          ),
                          MyButton(
                            title: '4',
                            onPress: () {
                              userInput += '4';
                              _textEditingController.text = userInput;
                            },
                            colorText:
                                isDarkModeEnabled ? offWhite : blackColorC,
                          ),
                          MyButton(
                            title: '1',
                            onPress: () {
                              userInput += '1';
                              _textEditingController.text = userInput;
                            },
                            colorText:
                                isDarkModeEnabled ? offWhite : blackColorC,
                          ),
                          MyButton(
                            title: '%',
                            onPress: () {
                              userInput += '%';
                              _textEditingController.text = userInput;
                            },
                            colorText: blueOperatorsColorC,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          MyButton(
                            title: '/',
                            onPress: () {
                              userInput += '/';
                              _textEditingController.text = userInput;
                            },
                            colorText: blueOperatorsColorC,
                          ),
                          MyButton(
                            title: '8',
                            onPress: () {
                              userInput += '8';
                              _textEditingController.text = userInput;
                            },
                            colorText:
                                isDarkModeEnabled ? offWhite : blackColorC,
                          ),
                          MyButton(
                            title: '5',
                            onPress: () {
                              userInput += '5';
                              _textEditingController.text = userInput;
                            },
                            colorText:
                                isDarkModeEnabled ? offWhite : blackColorC,
                          ),
                          MyButton(
                            title: '2',
                            onPress: () {
                              userInput += '2';
                              _textEditingController.text = userInput;
                            },
                            colorText:
                                isDarkModeEnabled ? offWhite : blackColorC,
                          ),
                          MyButton(
                            title: '0',
                            onPress: () {
                              userInput += '0';
                              _textEditingController.text = userInput;
                            },
                            colorText:
                                isDarkModeEnabled ? offWhite : blackColorC,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          MyButton(
                            title: 'x',
                            onPress: () {
                              userInput += '*';
                              _textEditingController.text = userInput;
                            },
                            colorText: blueOperatorsColorC,
                          ),
                          MyButton(
                            title: '9',
                            onPress: () {
                              userInput += '9';
                              _textEditingController.text = userInput;
                            },
                            colorText:
                                isDarkModeEnabled ? offWhite : blackColorC,
                          ),
                          MyButton(
                            title: '6',
                            onPress: () {
                              userInput += '6';
                              _textEditingController.text = userInput;
                            },
                            colorText:
                                isDarkModeEnabled ? offWhite : blackColorC,
                          ),
                          MyButton(
                            title: '3',
                            onPress: () {
                              userInput += '3';
                              _textEditingController.text = userInput;
                            },
                            colorText:
                                isDarkModeEnabled ? offWhite : blackColorC,
                          ),
                          MyButton(
                            title: '.',
                            onPress: () {
                              userInput += '.';
                              _textEditingController.text = userInput;
                            },
                            colorText:
                                isDarkModeEnabled ? offWhite : blackColorC,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          MyButton(
                            title: 'DEL',
                            onPress: () {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                              _textEditingController.text = userInput;
                            },
                            colorText: blueOperatorsColorC,
                          ),
                          MyButton(
                            title: '-',
                            onPress: () {
                              userInput += '-';
                              _textEditingController.text = userInput;
                            },
                            colorText: blueOperatorsColorC,
                          ),
                          MyButton(
                            title: '+',
                            onPress: () {
                              userInput += '+';
                              _textEditingController.text = userInput;
                            },
                            colorText: blueOperatorsColorC,
                          ),
                          Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  MyButton(
                                      title: '=',
                                      onPress: () {
                                        equalPressed();
                                        _textEditingController.text = result;
                                        userInput = _textEditingController.text;
                                      },
                                      color: blueOperatorsColorC,
                                      colorText: whiteColorC,
                                      width: 140),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void equalPressed() {
    Parser p = Parser();
    Expression expression = p.parse(userInput);
    ContextModel contextModel = ContextModel();
    try {
      double eval = expression.evaluate(EvaluationType.REAL, contextModel);
      
      if (eval.isInfinite || eval.isNaN) {
        result = 'Erro ao dividir por zero';
      } else {
        result = eval.toString();
      }
    } catch (e) {
      result = 'Erro';
    }
  }
}