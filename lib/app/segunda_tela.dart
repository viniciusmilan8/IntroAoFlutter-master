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
      drawer: 
      Menu(context),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Segunda Tela"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/CanetaAzul.jfif'),
            Image.asset('assets/images/CanetaAzul.jfif'),
            Image.asset('assets/images/CanetaAzul.jfif'),
            Image.asset('assets/images/CanetaAzul.jfif'),
            Image.asset('assets/images/CanetaAzul.jfif'),
            Image.asset('assets/images/CanetaAzul.jfif'),
            Image.asset('assets/images/CanetaAzul.jfif'),
            Image.asset('assets/images/CanetaAzul.jfif'),
          ],
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
