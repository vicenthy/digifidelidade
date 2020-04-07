import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TabHome extends StatelessWidget {
  const TabHome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Text(
            'Titular do cartão',
            style: TextStyle(
              fontSize: 23,
            ),
          ),
        ),
        Center(
          child: Text(
            'Participantes: 5',
            style: TextStyle(
              fontSize: 23,
            ),
          ),
        ),
        Center(
          child: Text(
            'Validade: dd/MM/yyyy',
            style: TextStyle(
              fontSize: 23,
            ),
          ),
        ),
        Center(
          child: Text(
            'Ativo: Sim',
            style: TextStyle(
              fontSize: 23,
            ),
          ),
        ),
        MaterialButton(
          minWidth: MediaQuery.of(context).size.width / 1.75,
          color: ThemeData.dark().primaryColor,
          textColor: Colors.white,
          onPressed: () {
            Modular.to.pushReplacementNamed('/home');
          },
          child: Text('ABRIR CARTÃO'),
        ),
        Container(
          margin: EdgeInsets.all(12.0),
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
          ),
        ),
        Center(
          child: Text(
            'codigo',
            style: TextStyle(
              fontSize: 64,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
