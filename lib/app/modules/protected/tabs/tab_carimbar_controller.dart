import 'package:mobx/mobx.dart';

part 'tab_carimbar_controller.g.dart';

class TabCarimbarController = _TabCarimbarControllerBase
    with _$TabCarimbarController;

abstract class _TabCarimbarControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
