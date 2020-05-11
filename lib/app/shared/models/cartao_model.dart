import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digifidelidade/app/shared/models/firebase_base_model.dart';

class CartaoModel extends FirebaseBaseModel {
  CartaoModel();

  DocumentReference _documentReference;
  CollectionReference inscritos;
  Timestamp validade;
  int qtdDeCarimbo;
  String descricaoPremio;
  bool ativo;

  @override
  DocumentReference get documentReference => this._documentReference;

  CartaoModel.fromFirebaseDocument(DocumentSnapshot document) {
    this._documentReference = document.reference;
    this.inscritos = document.reference.collection("inscritos");
    this.validade = document.data['validade'];
    this.qtdDeCarimbo = document.data['qtdDeCarimbo'];
    this.descricaoPremio = document.data['descricaoPremio'];
    this.ativo = document.data['ativo'];
  }

  @override
  toMap() {
    var map = new Map<String, dynamic>();
    map['validade'] = this.validade;
    map['qtdDeCarimbo'] = this.qtdDeCarimbo;
    map['ativo'] = this.ativo;
    map['descricaoPremio'] = this.descricaoPremio;
    return map;
  }

  @override
  delete() {
    this._documentReference.delete();
  }

  @override
  getAll() {}

  @override
  save() {
    this._documentReference.updateData(toMap());
  }
}
