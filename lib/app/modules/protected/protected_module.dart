import 'package:digifidelidade/app/modules/protected/carimbos/carimbos_controller.dart';
import 'package:digifidelidade/app/modules/protected/form_cartao/form_cartao_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home/home_controller.dart';
import 'home/home_page.dart';

class ProtectedModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CarimbosController()),
        Bind((i) => FormCartaoController()),
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<ProtectedModule>.of();
}
