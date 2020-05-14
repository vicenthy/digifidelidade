import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digifidelidade/app/shared/models/firebase_base_model.dart';

class CartaoModel extends FirebaseBaseModel {
  CartaoModel();

  DocumentReference _documentReference;
  Timestamp validade;
  int qtdDeCarimbo;
  String descricaoPremio;
  bool ativo;
  String titulo;

  @override
  DocumentReference get documentReference => this._documentReference;

  CartaoModel.fromFirebaseDocument(DocumentSnapshot document) {
    this._documentReference = document.reference;
    this.validade = document.data['validade'];
    this.qtdDeCarimbo = document.data['qtdDeCarimbo'];
    this.descricaoPremio = document.data['descricaoPremio'];
    this.ativo = document.data['ativo'];
    this.titulo = document.data['titulo'];
  }

  @override
  toMap() {
    var map = new Map<String, dynamic>();
    map['validade'] = this.validade;
    map['qtdDeCarimbo'] = this.qtdDeCarimbo;
    map['ativo'] = this.ativo;
    map['descricaoPremio'] = this.descricaoPremio;
    map['titulo'] = this.titulo;
    return map;
  }

  @override
  delete() {
    return this._documentReference.delete();
  }

  @override
  add() {
    return this._documentReference.collection('cartoes').add(this.toMap());
  }

  @override
  save() {
    return this._documentReference.updateData(this.toMap());
  }
}
