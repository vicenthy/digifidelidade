import 'package:digifidelidade/app/modules/protected/tabs/tab_carimbar.dart';
import 'package:digifidelidade/app/modules/protected/tabs/tab_home.dart';
import 'package:digifidelidade/app/modules/protected/tabs/tab_tela_cartoes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "DigiFidelidade"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
        ),
        bottomNavigationBar: Container(
          height: 75,
          color: Colors.black,
          child: TabBar(
            tabs: <Widget>[
              Tab(
                child: Text(
                  'Meus Cartão',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Carimbar Cartão',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Cartões que participo',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            indicatorPadding: EdgeInsets.all(5),
            indicatorColor: Colors.yellow,
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            TabHome(),
            TabCarimbar(),
            TabTelaCartoes(),
          ],
        ),
      ),
    );
  }
}
