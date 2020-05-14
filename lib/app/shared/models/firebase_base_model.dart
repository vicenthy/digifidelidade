import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirebaseBaseModel {
  FirebaseBaseModel();
  FirebaseBaseModel.fromFirebaseDocument(DocumentSnapshot document);
  DocumentReference get documentReference;
  toMap();
  save();
  add();
  delete();
}
