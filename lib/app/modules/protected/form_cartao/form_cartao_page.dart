import 'package:flutter/material.dart';

class FormCartaoPage extends StatefulWidget {
  final String title;
  const FormCartaoPage({Key key, this.title = "FormCartao"}) : super(key: key);

  @override
  _FormCartaoPageState createState() => _FormCartaoPageState();
}

class _FormCartaoPageState extends State<FormCartaoPage> {
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
