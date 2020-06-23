import 'package:digifidelidade/app/modules/public/cadastro/cadastro_controller.dart';
import 'package:digifidelidade/app/shared/widgets/clear_container.widget.dart';
import 'package:digifidelidade/app/shared/widgets/dafult_alert.widget.dart';
import 'package:digifidelidade/app/shared/widgets/loading.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../config.dart';
import '../../core/extensions/string_util.dart';

class CadastroPage extends StatefulWidget {
  final String title;
  const CadastroPage({Key key, this.title = "Cadastro"}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState
    extends ModularState<CadastroPage, CadastroController> {
  final _formKey = GlobalKey<FormState>();
  final emailTextController = TextEditingController(text: "");
  final passwordTextController = TextEditingController(text: "");
  final checkPasswordTextController = TextEditingController(text: "");
  bool showLoading = false;
  final emailRegx = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          showForm(),
          showLoading ? ShowLoading() : ClearContainer()
        ],
      ),
    );
  }

  showForm() {
    return SafeArea(
        child: SingleChildScrollView(
      child: Form(
        key: _formKey,
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
                  "Cadastro",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 36,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: emailTextController,
                validator: (value) {
                  if (value.isBlank) {
                    return "Digite o email!";
                  }
                  if (!emailRegx.hasMatch(value)) {
                    return "Email invalido";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: passwordTextController,
                validator: (value) {
                  return value.isBlank ? "Digite a senha!" : null;
                },
                decoration: InputDecoration(
                  hintText: 'Senha',
                ),
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                validator: (value) {
                  if (passwordTextController.text != value) {
                    return "Senhas diferentes tente novamente!";
                  }
                  return null;
                },
                controller: checkPasswordTextController,
                decoration: InputDecoration(
                  hintText: 'Confirmar Senha',
                ),
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: OutlineButton(
                onPressed: () async {
                  setState(() {
                    this.showLoading = true;
                  });
                  await Future.delayed(Duration(seconds: 1));
                  if (_formKey.currentState.validate()) {
                    controller
                        .criarCadastro(emailTextController.text,
                            passwordTextController.text)
                        .then((value) {
                      Config.currentUser = value.user;
                      Modular.to.pushReplacementNamed('/protected');
                    }).catchError((onError) {
                      if (onError is PlatformException) {
                        final PlatformException error = onError;
                        showMyDialog(context, "ERROR", error.message);
                      }
                    });
                  }

                  setState(() {
                    this.showLoading = false;
                  });
                },
                child: Text('CADASTRE-SE'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: FlatButton(
                onPressed: () {
                  Modular.to.pop();
                },
                child: Text('VOLTAR'),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
