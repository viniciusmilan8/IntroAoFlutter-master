import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final void Function(BuildContext) navigateToHome;
  final void Function(BuildContext) navigateToCadastro;

  const LoginPage({Key? key, required this.navigateToHome, required this.navigateToCadastro}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _iconAnimationController;
  late Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = AnimationController(
        vsync: this, duration: const Duration(microseconds: 300));

    _iconAnimation =
        CurvedAnimation(parent: _iconAnimationController, curve: Curves.easeIn);
    _iconAnimation.addListener(() => setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: const Color(0xFF28527a),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              Form(
                child: Theme(
                  data: ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.amber,
                      inputDecorationTheme: const InputDecorationTheme(
                        labelStyle: TextStyle(color: Colors.black),
                      )),
                  child: Container(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        TextField(
                          decoration: const InputDecoration(labelText: 'Email'),
                          obscureText: true,
                        ),
                        TextField(
                          decoration: const InputDecoration(labelText: 'Senha'),
                          obscureText: true,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20.0),
                        ),
                        MaterialButton(
                          onPressed: () => widget.navigateToHome(context),
                          color: const Color(0xFF8ac4d0),
                          textColor: Colors.black,
                          splashColor: const Color(0xFFf4d160),
                          child: const Text("Entrar"),
                          minWidth: 300,
                        ),
                        const SizedBox(height: 10.0),
                        MaterialButton(
                          onPressed: () => widget.navigateToCadastro(context),
                          color: const Color(0xFF8ac4d0),
                          textColor: Colors.black,
                          splashColor: const Color(0xFFf4d160),
                          child: const Text("Cadastrar"),
                          minWidth: 300,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
