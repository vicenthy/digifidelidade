import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TabHome extends StatelessWidget {
  const TabHome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 100,
        ),
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
          child: Text('EDITAR CARTÃO'),
        ),
        QrImage(
          data: 'codigo',
          size: 250,
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
