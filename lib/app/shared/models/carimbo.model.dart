import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digifidelidade/app/shared/models/firebase_base_model.dart';

class CarimboModel extends FirebaseBaseModel {
  CarimboModel();

  DocumentReference _documentReference;
  DateTime dataHoraCarimbo;

  @override
  DocumentReference get documentReference => this._documentReference;

  CarimboModel.fromFirebaseDocument(DocumentSnapshot document) {
    this._documentReference = document.reference;
    this.dataHoraCarimbo = document.data['dataHoraCarimbo'];
  }

  @override
  toMap() {
    var map = new Map<String, dynamic>();
    map['dataHoraCarimbo'] = this.dataHoraCarimbo;
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
