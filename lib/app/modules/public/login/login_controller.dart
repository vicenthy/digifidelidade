import 'package:digifidelidade/app/shared/services/firebase_auth_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  FirebaseAuthService firebsaeauth = Modular.get<FirebaseAuthService>();
  @observable
  int value = 0;

  @observable
  String email;

  @observable
  String password;

  @observable
  String errorMsg;

  @action
  void increment() {
    value++;
  }

  @action
  login() {
    if (isValid) {
      firebsaeauth.login(this.email, this.password).then((result) {
        if (result != null) {
          Modular.to.pushReplacementNamed('/protected');
        }
      }).catchError((onError) {
        print(onError);
      });
    }
  }

  @computed
  bool get isValid {
    return !(this.email == null || this.email.isEmpty) &&
        !(this.password == null || this.password.isEmpty);
  }
}
