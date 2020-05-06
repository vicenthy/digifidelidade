import 'package:digifidelidade/app/modules/public/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Center(
                  child: Text(
                    "DigiFidelidade",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 127,
                    height: 32,
                    margin: EdgeInsets.only(top: 20),
                    child: Center(
                      child: Text(
                        "Cartão de fidelidade digital",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 60),
                child: Center(
                  child: Text(
                    "Acesso ao sistema",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Observer(builder: (_) {
                  return TextField(
                    onChanged: (value) {
                      controller.email = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Observer(builder: (_) {
                  return TextField(
                    onChanged: (value) {
                      controller.password = value;
                      print(controller.password);
                    },
                    decoration: InputDecoration(
                      hintText: 'Senha',
                    ),
                    obscureText: true,
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Observer(builder: (_) {
                  return MaterialButton(
                    color: ThemeData.dark().primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      controller.login();
                      final snackBar =
                          SnackBar(content: Text('Yay! A SnackBar!'));
                      _scaffoldKey.currentState.showSnackBar(snackBar);
                    },
                    child: Text('ENTRAR'),
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: OutlineButton(
                  onPressed: () {
                    Modular.to.pushNamed('/cadastro');
                  },
                  child: Text('CADASTRA-SE'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
