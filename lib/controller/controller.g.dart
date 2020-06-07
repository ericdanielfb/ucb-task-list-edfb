// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Controller on _ControllerBase, Store {
  final _$_taskListAtom = Atom(name: '_ControllerBase._taskList');

  @override
  ObservableList<TaskStore> get _taskList {
    _$_taskListAtom.reportRead();
    return super._taskList;
  }

  @override
  set _taskList(ObservableList<TaskStore> value) {
    _$_taskListAtom.reportWrite(value, super._taskList, () {
      super._taskList = value;
    });
  }

  final _$userNameAtom = Atom(name: '_ControllerBase.userName');

  @override
  String get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  final _$_ControllerBaseActionController =
      ActionController(name: '_ControllerBase');

  @override
  dynamic setTaskDone(TaskStore task, bool value) {
    final _$actionInfo = _$_ControllerBaseActionController.startAction(
        name: '_ControllerBase.setTaskDone');
    try {
      return super.setTaskDone(task, value);
    } finally {
      _$_ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userName: ${userName}
    ''';
  }
}
