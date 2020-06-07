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

  final _$toDoLengthAtom = Atom(name: '_ControllerBase.toDoLength');

  @override
  int get toDoLength {
    _$toDoLengthAtom.reportRead();
    return super.toDoLength;
  }

  @override
  set toDoLength(int value) {
    _$toDoLengthAtom.reportWrite(value, super.toDoLength, () {
      super.toDoLength = value;
    });
  }

  final _$doneLengthAtom = Atom(name: '_ControllerBase.doneLength');

  @override
  int get doneLength {
    _$doneLengthAtom.reportRead();
    return super.doneLength;
  }

  @override
  set doneLength(int value) {
    _$doneLengthAtom.reportWrite(value, super.doneLength, () {
      super.doneLength = value;
    });
  }

  final _$editedTaskAtom = Atom(name: '_ControllerBase.editedTask');

  @override
  TaskStore get editedTask {
    _$editedTaskAtom.reportRead();
    return super.editedTask;
  }

  @override
  set editedTask(TaskStore value) {
    _$editedTaskAtom.reportWrite(value, super.editedTask, () {
      super.editedTask = value;
    });
  }

  final _$updateTaskAsyncAction = AsyncAction('_ControllerBase.updateTask');

  @override
  Future<void> updateTask(TaskStore task) {
    return _$updateTaskAsyncAction.run(() => super.updateTask(task));
  }

  final _$_ControllerBaseActionController =
      ActionController(name: '_ControllerBase');

  @override
  void setTaskDone(TaskStore task, bool value) {
    final _$actionInfo = _$_ControllerBaseActionController.startAction(
        name: '_ControllerBase.setTaskDone');
    try {
      return super.setTaskDone(task, value);
    } finally {
      _$_ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTask(TaskStore task) {
    final _$actionInfo = _$_ControllerBaseActionController.startAction(
        name: '_ControllerBase.addTask');
    try {
      return super.addTask(task);
    } finally {
      _$_ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTask(TaskStore task) {
    final _$actionInfo = _$_ControllerBaseActionController.startAction(
        name: '_ControllerBase.removeTask');
    try {
      return super.removeTask(task);
    } finally {
      _$_ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEditedTask(TaskStore task) {
    final _$actionInfo = _$_ControllerBaseActionController.startAction(
        name: '_ControllerBase.setEditedTask');
    try {
      return super.setEditedTask(task);
    } finally {
      _$_ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearEditedTask() {
    final _$actionInfo = _$_ControllerBaseActionController.startAction(
        name: '_ControllerBase.clearEditedTask');
    try {
      return super.clearEditedTask();
    } finally {
      _$_ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userName: ${userName},
toDoLength: ${toDoLength},
doneLength: ${doneLength},
editedTask: ${editedTask}
    ''';
  }
}
