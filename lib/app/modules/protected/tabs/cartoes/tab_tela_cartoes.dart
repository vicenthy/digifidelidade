import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'tab_tela_cartoes_controller.dart';

class TabTelaCartoes extends StatefulWidget {
  const TabTelaCartoes({Key key}) : super(key: key);

  @override
  _TabTelaCartoesState createState() => _TabTelaCartoesState();
}

class _TabTelaCartoesState
    extends ModularState<TabTelaCartoes, TabTelaCartoesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          color: Colors.black,
          child: Text(
            'Sair',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Modular.get<FirebaseAuth>().signOut();
            Modular.to.pushReplacementNamed('/');
          },
        ),
      ),
    );
  }
}
