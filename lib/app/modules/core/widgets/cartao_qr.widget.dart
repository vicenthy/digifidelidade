import 'package:digifidelidade/app/modules/core/models/cartao_model.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CartaoQRWidget extends StatelessWidget {
  CartaoModel cartaoModel;
  CartaoQRWidget(this.cartaoModel);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        height: 300.0,
        width: 300.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Loja do Joao',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Image.asset(
                "assets/img/icon-house.png",
                width: 50,
                height: 50,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: QrImage(
                data: '76237',
                size: 150,
              ),
            ),
            Center(
              child: Text(
                '76237',
                style: TextStyle(
                  fontSize: 24,
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
