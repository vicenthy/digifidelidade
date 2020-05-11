import 'package:digifidelidade/app/modules/protected/carimbos/carimbos_page.dart';
import 'package:digifidelidade/app/modules/protected/form_cartao/form_cartao_page.dart';
import 'package:digifidelidade/app/modules/protected/carimbos/carimbos_controller.dart';
import 'package:digifidelidade/app/modules/protected/form_cartao/form_cartao_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home/home_controller.dart';
import 'home/home_page.dart';
import 'tabs/carimbar/tab_carimbar_controller.dart';
import 'tabs/cartoes/tab_tela_cartoes_controller.dart';
import 'tabs/home/tab_home_controller.dart';

class ProtectedModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TabHomeController()),
        Bind((i) => TabTelaCartoesController()),
        Bind((i) => TabCarimbarController()),
        Bind((i) => HomeController()),
        Bind((i) => CarimbosController()),
        Bind((i) => FormCartaoController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
        Router('/carimbar', child: (_, args) => CarimbosPage()),
        Router('/form_cartao', child: (_, args) => FormCartaoPage()),
      ];

  static Inject get to => Inject<ProtectedModule>.of();
}
