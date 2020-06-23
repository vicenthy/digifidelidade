import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FirestoreService extends Disposable {
  final Firestore instance;

  FirestoreService(this.instance);

  @override
  void dispose() {}

  Future<List<DocumentSnapshot>> getCartoes() async {
    QuerySnapshot snapshot =
        await instance.collection('cartoes').getDocuments();
    return snapshot.documents;
  }

  Future<List<DocumentSnapshot>> getCartoesUserUid(String uid) async {
    QuerySnapshot snapshot = await instance
        .collection('cartoes')
        .where('uid', isEqualTo: uid)
        .getDocuments();
    return snapshot.documents;
  }

  Future<DocumentReference> getCartoesId(String id) async {
    return instance.collection('cartoes').document(id);
  }

  Future<List<DocumentSnapshot>> getCartoesNotUserUid(String uid) async {
    QuerySnapshot snapshot = await instance
        .collection('cartoes')
        .where(
          'uid',
        )
        .getDocuments();
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

  Future<List<DocumentSnapshot>> getCarimbos(
      String uidCartao, String uidInscrito) async {
    QuerySnapshot snapshot = await instance
        .collection('cartoes')
        .document(uidCartao)
        .collection('inscritos')
        .document(uidInscrito)
        .collection('carimbos')
        .getDocuments();
    return snapshot.documents;
  }
}
