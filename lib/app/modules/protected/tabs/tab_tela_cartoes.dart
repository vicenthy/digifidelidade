import 'package:digifidelidade/app/modules/protected/tabs/tab_tela_cartoes_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TabTelaCartoes extends StatefulWidget {
  const TabTelaCartoes({Key key}) : super(key: key);

  @override
  _TabTelaCartoesState createState() => _TabTelaCartoesState();
}

class _TabTelaCartoesState
    extends ModularState<TabTelaCartoes, TabTelaCartoesController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Pesquisar',
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Cartão 0001",
                          style: TextStyle(fontSize: 34),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Sub titulo",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: <Widget>[
                      FlatButton(
                        child: Text(
                          "Abrir",
                          style: TextStyle(
                            color: Colors.lightBlue,
                          ),
                        ),
                        onPressed: () {
                          Modular.to.pushNamed('/home/carimbar');
                        },
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
