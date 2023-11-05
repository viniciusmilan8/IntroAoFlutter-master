import 'package:flutter/material.dart';
import 'package:novoprojeto/app/tela_calculadora.dart';
import 'package:novoprojeto/app/tela_login.dart';
import 'app/tela_cadastro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void _navigateToHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ActivityPage()),
    );
  }

  void _navigateToCadastro(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CadastroPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(
        navigateToHome: _navigateToHome,
        navigateToCadastro: _navigateToCadastro,
      ),
      initialRoute: '/',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
    );
  }
}
