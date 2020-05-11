import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FirebaseAuthService extends Disposable {
  FirebaseAuth instance;

  FirebaseAuthService(this.instance);

  Future<AuthResult> login(String email, String password) async {
    try {
      return await this
          .instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on Exception catch (error) {
      print('error caught: $error');
      return null;
    }
  }

  Future<AuthResult> cadastrar(String email, String password) async {
    try {
      return await instance.createUserWithEmailAndPassword(
          email: email, password: password);
    } on Exception catch (error) {
      print('error caught: $error');
      return null;
    }
  }

  @override
  void dispose() {}
}
