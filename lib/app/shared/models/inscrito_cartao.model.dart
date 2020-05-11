import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digifidelidade/app/shared/models/firebase_base_model.dart';

class InscritoCartaoModel extends FirebaseBaseModel {
  DocumentReference _documentReference;
  String uid;
  Timestamp datahora;
  CollectionReference carimbos;
  Firestore store;

  InscritoCartaoModel(this.store);

  @override
  DocumentReference get documentReference => this._documentReference;

  InscritoCartaoModel.fromFirebaseDocument(DocumentSnapshot document) {
    this._documentReference = document.reference;
    this.uid = document.data['uid'];
    this.datahora = document['datahora'];
    this.carimbos = this._documentReference.collection("carimbos");
  }

  @override
  toMap() {
    var map = Map<String, dynamic>();
    map['uid'] = this.uid;
    map['datahora'] = this.datahora;
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
