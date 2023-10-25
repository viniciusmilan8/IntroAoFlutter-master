import 'package:flutter/material.dart';
import 'componentes/custom_button.dart';
import 'componentes/menu.dart';
import 'logica_calculadora.dart';

class ActivityPage extends StatefulWidget {
  ActivityPage({Key? key}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  CalculatorLogic calculatorLogic = CalculatorLogic();

  // Restante do código da sua classe

  Widget buildButton(String buttonText) {
    int fillColor = 0xFF8ac4d0;
    int textColor = 0xFF000000;
    double textSize = 24;

    // Mapeia o botão para valores específicos de símbolos
    switch (buttonText) {
      case "=":
        fillColor = 0xFFf4d160;
        textColor = 0xFF000000;
        return CustomButton(
          text: buttonText,
          fillColor: fillColor,
          textColor: textColor,
          textSize: textSize,
          callback: () {
            calculatorLogic.btnOnClick(-1); // Símbolo "="
          },
        );
      case "C":
        fillColor = 0xFF8ac4d0;
        textColor = 0xFF000000;
        return CustomButton(
          text: buttonText,
          fillColor: fillColor,
          textColor: textColor,
          textSize: textSize,
          callback: () {
            calculatorLogic.btnOnClick(-2); // Símbolo "C"
          },
        );
      case "<":
        fillColor = 0xFFf4d160;
        textColor = 0xFF000000;
        return CustomButton(
          text: buttonText,
          fillColor: fillColor,
          textColor: textColor,
          textSize: textSize,
          callback: () {
            calculatorLogic.btnOnClick(-3); // Símbolo de exclusão
          },
        );
      default:
        return CustomButton(
          text: buttonText,
          fillColor: fillColor,
          textColor: textColor,
          textSize: textSize,
          callback: () {
            calculatorLogic.btnOnClick(double.parse(buttonText)); // Valor numérico
          },
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Prova Vagner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        drawer: Menu(context),
        backgroundColor: const Color(0xFF28527a),
        appBar: AppBar(
          title: const Text('Calculadora Básica'),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Restante do código da interface do usuário

              // Botões para números e símbolos
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton('7'),
                  buildButton('8'),
                  buildButton('9'),
                  buildButton('/'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton('4'),
                  buildButton('5'),
                  buildButton('6'),
                  buildButton('x'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton('1'),
                  buildButton('2'),
                  buildButton('3'),
                  buildButton('-'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton('.'),
                  buildButton('0'),
                  buildButton('00'),
                  buildButton('+'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton('C'),
                  buildButton('<'),
                  buildButton('='),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
