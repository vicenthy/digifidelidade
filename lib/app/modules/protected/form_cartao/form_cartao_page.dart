import 'package:digifidelidade/app/modules/protected/form_cartao/form_cartao_controller.dart';
import 'package:digifidelidade/app/shared/models/cartao_model.dart';
import 'package:intl/intl.dart';
import '../../core/extensions/string_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FormCartaoPage extends StatefulWidget {
  final String title;
  const FormCartaoPage({Key key, this.title = "Dados do Cartão"})
      : super(key: key);

  @override
  _FormCartaoPageState createState() => _FormCartaoPageState();
}

class _FormCartaoPageState
    extends ModularState<FormCartaoPage, FormCartaoController> {
  final _formKey = GlobalKey<FormState>();

  final tituloTextController = TextEditingController();
  final validadeTextController = TextEditingController();
  final numeroCarimbosTextController = TextEditingController(text: "5");
  final descricaoTextController = TextEditingController();
  final dateFormat = DateFormat("dd/MM/yyyy");
  bool ativo = true;
  final defaultValidate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  validator: (value) {
                    return value.isBlank ? "Digite o titulo do cartao!" : null;
                  },
                  controller: tituloTextController,
                  decoration: InputDecoration(
                    hintText: 'Titulo do cartão',
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: validadeTextController,
                  validator: (value) {
                    return value.isBlank
                        ? "Selecione a data de validade!"
                        : null;
                  },
                  readOnly: true,
                  onTap: () async {
                    final validade = await showDatePicker(
                        context: context,
                        initialDate: defaultValidate,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2101));

                    validadeTextController.text =
                        validade != null ? dateFormat.format(validade) : null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Válidade do cartão',
                    suffixIcon: Icon(
                      Icons.calendar_today,
                    ),
                  ),
                  keyboardType: TextInputType.datetime,
                  textInputAction: TextInputAction.next,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: numeroCarimbosTextController,
                  maxLength: 2,
                  decoration: InputDecoration(
                    hintText: 'Número de carimbos',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: descricaoTextController,
                  decoration: InputDecoration(
                    hintText: 'Descrição do premio do cartão',
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
                    value: ativo,
                    onChanged: (value) {
                      setState(() {
                        this.ativo = value;
                      });
                    },
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: MaterialButton(
                  color: ThemeData.dark().primaryColor,
                  textColor: Colors.white,
                  onPressed: () {
                    if (this._formKey.currentState.validate()) {
                      controller.cartao = createCartao();
                      controller.salvar();
                      Modular.to.pop();
                    }
                  },
                  child: Text('SALVAR'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  createCartao() {
    return CartaoModel(
      ativo: this.ativo,
      descricaoPremio: descricaoTextController.text,
      qtdDeCarimbo: int.parse(numeroCarimbosTextController.text),
      titulo: tituloTextController.text,
      validade: dateFormat.parse(validadeTextController.text),
    );
  }
}
