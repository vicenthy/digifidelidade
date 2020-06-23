import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digifidelidade/app/shared/models/firebase_base_model.dart';

class CartaoModel extends FirebaseBaseModel {
  DocumentReference _documentReference;
  DateTime validade;
  int qtdDeCarimbo;
  String descricaoPremio;
  bool ativo;
  String titulo;
  String uid;

  CartaoModel(
      {this.ativo,
      this.descricaoPremio,
      this.titulo,
      this.validade,
      this.qtdDeCarimbo,
      this.uid});

  @override
  DocumentReference get documentReference => this._documentReference;

  CartaoModel.fromFirebaseDocument(DocumentSnapshot document) {
    this._documentReference = document.reference;
    this.validade = (document.data['validade'] as Timestamp).toDate();
    this.qtdDeCarimbo = document.data['qtdDeCarimbo'];
    this.descricaoPremio = document.data['descricaoPremio'];
    this.ativo = document.data['ativo'];
    this.titulo = document.data['titulo'];
    this.uid = document.data['uid'];
  }

  @override
  toMap() {
    var map = new Map<String, dynamic>();
    map['validade'] = Timestamp.fromDate(this.validade);
    map['qtdDeCarimbo'] = this.qtdDeCarimbo;
    map['ativo'] = this.ativo;
    map['descricaoPremio'] = this.descricaoPremio;
    map['titulo'] = this.titulo;
    map['uid'] = this.uid;
    return map;
  }

  @override
  String toString() {
    return "uid: $uid, ativo: $ativo, titulo: $titulo, qtdCarimbo: $qtdDeCarimbo, descricao: $descricaoPremio, validade: $validade";
  }
}
