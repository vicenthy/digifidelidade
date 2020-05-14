// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tab_home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TabHomeController on _TabHomeControllerBase, Store {
  final _$cartoesAtom = Atom(name: '_TabHomeControllerBase.cartoes');

  @override
  ObservableList<CartaoModel> get cartoes {
    _$cartoesAtom.context.enforceReadPolicy(_$cartoesAtom);
    _$cartoesAtom.reportObserved();
    return super.cartoes;
  }

  @override
  set cartoes(ObservableList<CartaoModel> value) {
    _$cartoesAtom.context.conditionallyRunInAction(() {
      super.cartoes = value;
      _$cartoesAtom.reportChanged();
    }, _$cartoesAtom, name: '${_$cartoesAtom.name}_set');
  }

  final _$loadCartoesUsuarioLogadoAsyncAction =
      AsyncAction('loadCartoesUsuarioLogado');

  @override
  Future loadCartoesUsuarioLogado() {
    return _$loadCartoesUsuarioLogadoAsyncAction
        .run(() => super.loadCartoesUsuarioLogado());
  }

  final _$loadTodosAsyncAction = AsyncAction('loadTodos');

  @override
  Future loadTodos() {
    return _$loadTodosAsyncAction.run(() => super.loadTodos());
  }

  final _$loadExternosAsyncAction = AsyncAction('loadExternos');

  @override
  Future loadExternos() {
    return _$loadExternosAsyncAction.run(() => super.loadExternos());
  }

  @override
  String toString() {
    final string = 'cartoes: ${cartoes.toString()}';
    return '{$string}';
  }
}
