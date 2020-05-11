import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'tab_carimbar_controller.dart';

class TabCarimbar extends StatefulWidget {
  const TabCarimbar({Key key}) : super(key: key);

  @override
  _TabCarimbarState createState() => _TabCarimbarState();
}

class _TabCarimbarState
    extends ModularState<TabCarimbar, TabCarimbarController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Codigo do cartão',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.barcode),
                  onPressed: () async {
                    try {
                      String barcode = await BarcodeScanner.scan();
                    } on PlatformException catch (e) {
                      if (e.code == BarcodeScanner.CameraAccessDenied) {
                        print("Acesso a camera não concedido");
                      } else {}
                    } on FormatException {
                      print("erro FormatException");
                    } catch (e) {
                      print("erro desconhecido");
                    }
                  },
                  iconSize: 50,
                  color: Colors.black.withOpacity(0.5),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Número de carimbos',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: MaterialButton(
                color: ThemeData.dark().primaryColor,
                textColor: Colors.white,
                onPressed: () {},
                child: Text('CARIMBAR'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
