import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digifidelidade/app/shared/models/cartao_model.dart';
import 'package:digifidelidade/app/shared/services/firestore_service.dart';
import 'package:digifidelidade/config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'tab_home_controller.g.dart';

class TabHomeController = _TabHomeControllerBase with _$TabHomeController;

abstract class _TabHomeControllerBase with Store {
  FirestoreService firestoreService = Modular.get();
  @observable
  ObservableList<CartaoModel> cartoes = ObservableList();

  @action
  loadCartoesUsuarioLogado() async {}

  @action
  loadTodos() async {
    List<DocumentSnapshot> documentos =
        await this.firestoreService.getCartoes();
    this.cartoes = documentos
        .map((cartao) => CartaoModel.fromFirebaseDocument(cartao))
        .toList()
        .asObservable();
  }

  @action
  loadExternos() async {}

  @action
  loadMeusCartoes() async {
    List<DocumentSnapshot> documentos =
        await this.firestoreService.getCartoesUserUid(Config.currentUser.uid);
    this.cartoes = documentos
        .map((cartao) => CartaoModel.fromFirebaseDocument(cartao))
        .toList()
        .asObservable();
    print(cartoes);
  }
}
