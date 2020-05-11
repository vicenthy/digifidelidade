import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FirestoreService extends Disposable {
  Firestore instance;

  FirestoreService(this.instance);

  @override
  void dispose() {}

  CollectionReference getCartoesCollection(String uid) {
    return instance
        .collection('fidelidade_doc')
        .document(uid)
        .collection('cartoes');
  }
}
