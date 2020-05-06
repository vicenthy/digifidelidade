import 'package:mobx/mobx.dart';

part 'form_cartao_controller.g.dart';

class FormCartaoController = _FormCartaoControllerBase
    with _$FormCartaoController;

abstract class _FormCartaoControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
