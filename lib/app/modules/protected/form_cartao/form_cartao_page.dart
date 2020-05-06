import 'package:flutter/material.dart';

class FormCartaoPage extends StatefulWidget {
  final String title;
  const FormCartaoPage({Key key, this.title = "Dados do Cartão"})
      : super(key: key);

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Titulo do cartão',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Válidade do cartão',
                ),
                keyboardType: TextInputType.datetime,
              ),
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
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Descrição do cartão',
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 8,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(children: <Widget>[
                Text(
                  'Ativo?',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                Switch(
                  value: true,
                  onChanged: (value) {},
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: MaterialButton(
                color: ThemeData.dark().primaryColor,
                textColor: Colors.white,
                onPressed: () {},
                child: Text('SALVAR'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
