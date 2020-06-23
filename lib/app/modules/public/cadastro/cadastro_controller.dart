import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../config.dart';

part 'cadastro_controller.g.dart';

class CadastroController = _CadastroControllerBase with _$CadastroController;

abstract class _CadastroControllerBase with Store {
  FirebaseAuth auth = Modular.get();

  @action
  Future<AuthResult> criarCadastro(String email, String senha) {
    return this
        .auth
        .createUserWithEmailAndPassword(email: email, password: senha);
  }
}
