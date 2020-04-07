import 'package:mobx/mobx.dart';

part 'carimbos_controller.g.dart';

class CarimbosController = _CarimbosControllerBase with _$CarimbosController;

abstract class _CarimbosControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
