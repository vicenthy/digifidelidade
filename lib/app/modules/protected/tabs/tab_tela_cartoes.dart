import 'package:digifidelidade/app/modules/protected/tabs/tab_tela_cartoes_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
            Expanded(
              child: ListView(
                children: <Widget>[
                  Slidable(
                    actionPane: SlidableBehindActionPane(),
                    actionExtentRatio: 0.25,
                    child: Container(
                      color: Colors.white,
                      child: ListTile(
                        leading: Image.asset(
                          "assets/img/icon-house.png",
                          width: 70,
                          height: 70,
                        ),
                        trailing: Text(
                          '03/12',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        title: Text(
                          'Loja do Joao',
                          style: TextStyle(fontSize: 24),
                        ),
                        subtitle: Text('A cada 12 compras ganha 1 brinde'),
                      ),
                    ),
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Participar',
                        color: Colors.green,
                        icon: Icons.edit,
                        onTap: () {},
                      ),
                    ],
                  ),
                  Slidable(
                    actionPane: SlidableBehindActionPane(),
                    actionExtentRatio: 0.25,
                    child: Container(
                      color: Colors.white,
                      child: ListTile(
                        leading: Image.asset(
                          "assets/img/icon-house.png",
                          width: 70,
                          height: 70,
                        ),
                        trailing: Text(
                          '03',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        title: Text(
                          'Loja do William',
                          style: TextStyle(fontSize: 24),
                        ),
                        subtitle: Text(
                            'Adiquira 10 itens na nossa loja e escolha um item ate R\$20.00'),
                      ),
                    ),
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Participar',
                        color: Colors.green,
                        icon: Icons.edit,
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        floatingActionButton: Container(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            backgroundColor: Colors.black,
            child: Icon(
              Icons.add,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
