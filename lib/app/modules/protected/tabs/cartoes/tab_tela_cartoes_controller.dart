import 'package:mobx/mobx.dart';

part 'tab_tela_cartoes_controller.g.dart';

class TabTelaCartoesController = _TabTelaCartoesControllerBase
    with _$TabTelaCartoesController;

abstract class _TabTelaCartoesControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
