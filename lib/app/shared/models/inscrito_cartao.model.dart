import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digifidelidade/app/shared/models/firebase_base_model.dart';

class InscritoCartaoModel extends FirebaseBaseModel {
  DocumentReference _documentReference;
  String uid;
  String uidInscrito;

  @override
  DocumentReference get documentReference => this._documentReference;

  InscritoCartaoModel.fromFirebaseDocument(DocumentSnapshot document) {
    this._documentReference = document.reference;
    this.uid = document.data['uid'];
    this.uidInscrito = document.data['uid-inscrito'];
  }

  @override
  toMap() {
    var map = Map<String, dynamic>();
    map['uid'] = this.uid;
    map['uid-inscrito'] = this.uid;

    return map;
  }

  @override
  delete() {
    this._documentReference.delete();
  }

  @override
  save() {
    this._documentReference.updateData(toMap());
  }
}
