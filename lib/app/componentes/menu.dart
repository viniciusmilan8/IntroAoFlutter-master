import 'package:flutter/material.dart';

import '../home.dart';
import '../segunda_tela.dart';

Widget Menu(BuildContext context){
  return Drawer(
    child:  ListView(
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text('Drawer Header'),
        ),

        ListTile(
          title: const Text('Calculadora'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => 
              ActivityPage()),
            );
          },
        ),

        ListTile(
          title: const Text('Sobre'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
              const SegundaTela()),
            );
          },
        ),
      ],
    ),
  );
}