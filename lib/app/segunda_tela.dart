import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:novoprojeto/app/componentes/menu.dart';
import 'home.dart';

class SegundaTela extends StatefulWidget {
  const SegundaTela({super.key});

  @override
  State<SegundaTela> createState() => _SegundaTelaState();
}

class _SegundaTelaState extends State<SegundaTela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(context),
      backgroundColor:const Color(0xFF28527a),
      appBar: AppBar(
        backgroundColor:Colors.blueGrey,
        title: Text("Imagem"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/CanetaAzul.jfif'),
          ],
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
