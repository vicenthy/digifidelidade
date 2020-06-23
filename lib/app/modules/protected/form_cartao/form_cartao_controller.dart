import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digifidelidade/app/shared/models/carimbo.model.dart';
import 'package:digifidelidade/app/shared/models/cartao_model.dart';
import 'package:digifidelidade/app/shared/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'form_cartao_controller.g.dart';

class FormCartaoController = _FormCartaoControllerBase
    with _$FormCartaoController;

abstract class _FormCartaoControllerBase with Store {
  @observable
  CartaoModel cartao = CartaoModel();
  FirestoreService firestoreService = Modular.get();

  @action
  salvar() async {
    FirebaseAuth auth = Modular.get();
    String uid = (await auth.currentUser()).uid;
    cartao.uid = uid;
    firestoreService.instance.collection('cartoes').add(cartao.toMap());
  }
}
