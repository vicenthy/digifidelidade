import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digifidelidade/app/shared/models/cartao_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FirestoreService extends Disposable {
  final Firestore instance;

  FirestoreService(this.instance);

  @override
  void dispose() {}

  Stream<QuerySnapshot> getCartoesCollection() {
    return instance.collection('fidelidade_doc').snapshots();
  }

  Stream<QuerySnapshot> getCartoesExternosCollection(String uid) {
    return instance
        .collection('fidelidade_doc')
        .where((element) => element.documentID != uid)
        .snapshots();
  }

  Stream<QuerySnapshot> getMeusCartoes(String uid) {
    return instance
        .collection('fidelidade_doc')
        .where((element) => element.documentID == uid)
        .snapshots();
  }

  Future<List<DocumentSnapshot>> getCartoes() async {
    QuerySnapshot snapshot =
        await instance.collection('cartoes').getDocuments();
    return snapshot.documents;
  }

  Future<List<DocumentSnapshot>> getIncritos(String uidCartao) async {
    QuerySnapshot snapshot = await instance
        .collection('cartoes')
        .document(uidCartao)
        .collection('inscritos')
        .getDocuments();
    return snapshot.documents;
  }

  save() {}
}
