import 'package:digifidelidade/app/app_controller.dart';
import 'package:digifidelidade/app/modules/protected/protected_module.dart';
import 'package:digifidelidade/app/modules/public/public_module.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:digifidelidade/app/app_widget.dart';

import 'modules/core/services/firebase_auth_service.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FirebaseAuth.instance),
        Bind((i) => FirebaseAuthService(i.get<FirebaseAuth>())),
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: PublicModule()),
        Router('/home', module: ProtectedModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
