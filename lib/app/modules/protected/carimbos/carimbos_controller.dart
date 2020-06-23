import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digifidelidade/app/shared/services/firestore_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'carimbos_controller.g.dart';

class CarimbosController = _CarimbosControllerBase with _$CarimbosController;

abstract class _CarimbosControllerBase with Store {
  FirestoreService firestoreService = Modular.get();

  void carimbar(String codigo) async {
    DocumentReference documentReference =
        await firestoreService.getCartoesId(codigo);
  }
}
