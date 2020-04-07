import 'package:flutter/material.dart';

class CarimbosPage extends StatefulWidget {
  final String title;
  const CarimbosPage({Key key, this.title = "Carimbos"}) : super(key: key);

  @override
  _CarimbosPageState createState() => _CarimbosPageState();
}

class _CarimbosPageState extends State<CarimbosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
