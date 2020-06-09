// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TaskStore on _TaskStoreBase, Store {
  final _$idAtom = Atom(name: '_TaskStoreBase.id');

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$titleAtom = Atom(name: '_TaskStoreBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$descriptionAtom = Atom(name: '_TaskStoreBase.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$endDateAtom = Atom(name: '_TaskStoreBase.endDate');

  @override
  DateTime get endDate {
    _$endDateAtom.reportRead();
    return super.endDate;
  }

  @override
  set endDate(DateTime value) {
    _$endDateAtom.reportWrite(value, super.endDate, () {
      super.endDate = value;
    });
  }

  final _$doneAtom = Atom(name: '_TaskStoreBase.done');

  @override
  bool get done {
    _$doneAtom.reportRead();
    return super.done;
  }

  @override
  set done(bool value) {
    _$doneAtom.reportWrite(value, super.done, () {
      super.done = value;
    });
  }

  final _$_TaskStoreBaseActionController =
      ActionController(name: '_TaskStoreBase');

  @override
  void setId(int value) {
    final _$actionInfo = _$_TaskStoreBaseActionController.startAction(
        name: '_TaskStoreBase.setId');
    try {
      return super.setId(value);
    } finally {
      _$_TaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTitle(String value) {
    final _$actionInfo = _$_TaskStoreBaseActionController.startAction(
        name: '_TaskStoreBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_TaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDescription(String value) {
    final _$actionInfo = _$_TaskStoreBaseActionController.startAction(
        name: '_TaskStoreBase.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_TaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEndDate(DateTime value) {
    final _$actionInfo = _$_TaskStoreBaseActionController.startAction(
        name: '_TaskStoreBase.setEndDate');
    try {
      return super.setEndDate(value);
    } finally {
      _$_TaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDone(bool value) {
    final _$actionInfo = _$_TaskStoreBaseActionController.startAction(
        name: '_TaskStoreBase.setDone');
    try {
      return super.setDone(value);
    } finally {
      _$_TaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
title: ${title},
description: ${description},
endDate: ${endDate},
done: ${done}
    ''';
  }
}
