import 'package:digifidelidade/app/modules/core/services/firebase_auth_service.dart';
import 'package:digifidelidade/app/modules/public/cadastro/cadastro_controller.dart';
import 'package:digifidelidade/app/modules/public/cadastro/cadastro_page.dart';
import 'package:digifidelidade/app/modules/public/login/login_controller.dart';
import 'package:digifidelidade/app/modules/public/login/login_page.dart';
import 'package:digifidelidade/app/modules/public/splash_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PublicModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SplashPage(), lazy: true),
        Bind((i) => CadastroController()),
        Bind((i) => LoginController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => to.get<SplashPage>()),
        Router('/login', child: (_, args) => LoginPage()),
        Router('/cadastro', child: (_, args) => CadastroPage()),
      ];

  static Inject get to => Inject<PublicModule>.of();
}
