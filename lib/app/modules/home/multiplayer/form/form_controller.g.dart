// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FormController on _FormBase, Store {
  final _$playerOneNameAtom = Atom(name: '_FormBase.playerOneName');

  @override
  String get playerOneName {
    _$playerOneNameAtom.context.enforceReadPolicy(_$playerOneNameAtom);
    _$playerOneNameAtom.reportObserved();
    return super.playerOneName;
  }

  @override
  set playerOneName(String value) {
    _$playerOneNameAtom.context.conditionallyRunInAction(() {
      super.playerOneName = value;
      _$playerOneNameAtom.reportChanged();
    }, _$playerOneNameAtom, name: '${_$playerOneNameAtom.name}_set');
  }

  final _$playerTwoNameAtom = Atom(name: '_FormBase.playerTwoName');

  @override
  String get playerTwoName {
    _$playerTwoNameAtom.context.enforceReadPolicy(_$playerTwoNameAtom);
    _$playerTwoNameAtom.reportObserved();
    return super.playerTwoName;
  }

  @override
  set playerTwoName(String value) {
    _$playerTwoNameAtom.context.conditionallyRunInAction(() {
      super.playerTwoName = value;
      _$playerTwoNameAtom.reportChanged();
    }, _$playerTwoNameAtom, name: '${_$playerTwoNameAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'playerOneName: ${playerOneName.toString()},playerTwoName: ${playerTwoName.toString()}';
    return '{$string}';
  }
}
