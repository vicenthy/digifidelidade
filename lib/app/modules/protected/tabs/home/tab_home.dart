import 'package:digifidelidade/app/shared/models/cartao_model.dart';
import 'package:digifidelidade/app/shared/widgets/cartao_qr.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'tab_home_controller.dart';

class TabHome extends StatefulWidget {
  const TabHome({
    Key key,
  }) : super(key: key);

  @override
  _TabHomeState createState() => _TabHomeState();
}

class _TabHomeState extends ModularState<TabHome, TabHomeController> {
  int selectedIndex = 0;

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
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: CupertinoSegmentedControl(
                  borderColor: Colors.black,
                  unselectedColor: Colors.white,
                  selectedColor: Colors.black,
                  children: const <int, Widget>{
                    0: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Todos',
                      ),
                    ),
                    1: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text('Meus cartões'),
                    ),
                    2: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text('Cartões externos'),
                    ),
                  },
                  groupValue: selectedIndex,
                  onValueChanged: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  }),
            ),
            Expanded(child: Observer(builder: (_) {
              controller.load();
              List<CartaoModel> cartoes = controller.cartoes;
              return ListView.builder(
                itemCount: cartoes.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    leading: Image.asset(
                      "assets/img/icon-house.png",
                      width: 70,
                      height: 70,
                    ),
                    trailing: Text(
                      cartoes[index].qtdDeCarimbo.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    title: Text(
                      cartoes[index].documentReference.documentID,
                      style: TextStyle(fontSize: 18),
                    ),
                    subtitle: Text(cartoes[index].descricaoPremio),
                  );
                },
              );
            }))
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
            onPressed: () {
              Modular.to.pushNamed("/protected/form_cartao");
            },
          ),
        ),
      ),
    );
  }

  Widget getList() {
    return ListView(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (_) => CartaoQRWidget(CartaoModel()));
          },
          child: Slidable(
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
                caption: 'Editar',
                color: Colors.red,
                icon: Icons.edit,
                onTap: () {},
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Modular.to.pushNamed("/protected/carimbar");
          },
          child: Slidable(
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
                icon: FontAwesomeIcons.userTag,
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
