// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GameController on _GameBase, Store {
  final _$_gameMatrixAtom = Atom(name: '_GameBase._gameMatrix');

  @override
  List<List<int>> get _gameMatrix {
    _$_gameMatrixAtom.context.enforceReadPolicy(_$_gameMatrixAtom);
    _$_gameMatrixAtom.reportObserved();
    return super._gameMatrix;
  }

  @override
  set _gameMatrix(List<List<int>> value) {
    _$_gameMatrixAtom.context.conditionallyRunInAction(() {
      super._gameMatrix = value;
      _$_gameMatrixAtom.reportChanged();
    }, _$_gameMatrixAtom, name: '${_$_gameMatrixAtom.name}_set');
  }

  final _$turnAtom = Atom(name: '_GameBase.turn');

  @override
  int get turn {
    _$turnAtom.context.enforceReadPolicy(_$turnAtom);
    _$turnAtom.reportObserved();
    return super.turn;
  }

  @override
  set turn(int value) {
    _$turnAtom.context.conditionallyRunInAction(() {
      super.turn = value;
      _$turnAtom.reportChanged();
    }, _$turnAtom, name: '${_$turnAtom.name}_set');
  }

  final _$actualPlayerNameAtom = Atom(name: '_GameBase.actualPlayerName');

  @override
  String get actualPlayerName {
    _$actualPlayerNameAtom.context.enforceReadPolicy(_$actualPlayerNameAtom);
    _$actualPlayerNameAtom.reportObserved();
    return super.actualPlayerName;
  }

  @override
  set actualPlayerName(String value) {
    _$actualPlayerNameAtom.context.conditionallyRunInAction(() {
      super.actualPlayerName = value;
      _$actualPlayerNameAtom.reportChanged();
    }, _$actualPlayerNameAtom, name: '${_$actualPlayerNameAtom.name}_set');
  }

  final _$_GameBaseActionController = ActionController(name: '_GameBase');

  @override
  dynamic setPlayer(dynamic x, dynamic y) {
    final _$actionInfo = _$_GameBaseActionController.startAction();
    try {
      return super.setPlayer(x, y);
    } finally {
      _$_GameBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String icon(int x, int y) {
    final _$actionInfo = _$_GameBaseActionController.startAction();
    try {
      return super.icon(x, y);
    } finally {
      _$_GameBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic occupePosition(int x, int y) {
    final _$actionInfo = _$_GameBaseActionController.startAction();
    try {
      return super.occupePosition(x, y);
    } finally {
      _$_GameBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'turn: ${turn.toString()},actualPlayerName: ${actualPlayerName.toString()}';
    return '{$string}';
  }
}
