import 'package:digifidelidade/app/modules/protected/carimbos/carimbos_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CarimbosPage extends StatefulWidget {
  final String title;
  const CarimbosPage({Key key, this.title = "Carimbos"}) : super(key: key);

  @override
  _CarimbosPageState createState() => _CarimbosPageState();
}

class _CarimbosPageState
    extends ModularState<CarimbosPage, CarimbosController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              children: List.generate(12, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: (index % 3 == 2) ? Colors.grey : null,
                      border: Border.all(),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.green,
                      size: 70,
                    ),
                  ),
                );
              }),
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
        ),
      ),
    );
  }
}
