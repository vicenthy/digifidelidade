// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_cartao_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FormCartaoController on _FormCartaoControllerBase, Store {
  final _$cartaoAtom = Atom(name: '_FormCartaoControllerBase.cartao');

  @override
  CartaoModel get cartao {
    _$cartaoAtom.context.enforceReadPolicy(_$cartaoAtom);
    _$cartaoAtom.reportObserved();
    return super.cartao;
  }

  @override
  set cartao(CartaoModel value) {
    _$cartaoAtom.context.conditionallyRunInAction(() {
      super.cartao = value;
      _$cartaoAtom.reportChanged();
    }, _$cartaoAtom, name: '${_$cartaoAtom.name}_set');
  }

  final _$salvarAsyncAction = AsyncAction('salvar');

  @override
  Future salvar() {
    return _$salvarAsyncAction.run(() => super.salvar());
  }

  @override
  String toString() {
    final string = 'cartao: ${cartao.toString()}';
    return '{$string}';
  }
}
