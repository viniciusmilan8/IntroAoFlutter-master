import 'package:flutter/material.dart';
import 'package:novoprojeto/app/tela_login.dart';
import '../tela_calculadora.dart';
import '../tela_imagem.dart';

void _emptyFunction(BuildContext context) {
  // Função vazia que não faz nada
}

Widget Menu(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blueGrey,
          ),
          child: Text(
            'Menu',
            style: const TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
        ListTile(
          title: Text(
            'Calculadora',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ActivityPage()),
            );
          },
        ),
        ListTile(
          title: const Text(
            'Sobre',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SegundaTela()),
            );
          },
        ),
        ListTile(
          title: Text(
            'Sair',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
      ],
    ),
  );
}
