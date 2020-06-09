import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_list_ucb_edfb/stores/task_store.dart';
part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {
  @observable
  ObservableList<TaskStore> _taskList = ObservableList();

  @observable
  String userName;

  @observable
  int toDoLength;

  @observable
  int doneLength;

  Future<void> reset() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  Future<void> setUserName(String name) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('userName', name);
    userName = name;
  }

  Future<void> loadUserName() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String _name = _prefs.getString('userName');
    userName = _name;
  }

  Future<void> saveTaskList() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setStringList(
      'task_list',
      _taskList.map((task) => jsonEncode(task.toJson())).toList(),
    );
  }

  ObservableList<TaskStore> getToDoTasks() {
    var tasks = ObservableList<TaskStore>();
    _taskList.forEach((task) {
      if (!task.done) {
        tasks.add(task);
      }
    });
    toDoLength = tasks.length;
    return tasks;
  }

  ObservableList<TaskStore> getDoneTasks() {
    var tasks = ObservableList<TaskStore>();
    _taskList.forEach((task) {
      if (task.done) {
        tasks.add(task);
      }
    });
    doneLength = tasks.length;
    return tasks;
  }

  Future<void> loadTaskList() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    List<String> _listStr = _prefs.getStringList("task_list");
    ObservableList<TaskStore> _list = ObservableList<TaskStore>();

    if (_listStr != null) {
      _listStr.map((e) {
        _list.add(TaskStore().fromJson(jsonDecode(e)));
      }).toList();
    }
    _taskList = _list;
  }

  @action
  void setTaskDone(TaskStore task, bool value) {
    task.setDone(value);
    saveTaskList();
  }

  @action
  void addTask(TaskStore task) {
    _taskList.add(task);
    saveTaskList();
  }

  @action
  Future<void> updateTask(TaskStore task) async {
    removeTask(task);
    addTask(task);
    saveTaskList();
  }

  @action
  void removeTask(TaskStore task) {
    _taskList.removeWhere(
      (value) => value.id == task.id,
    );
    saveTaskList();
  }

  @observable
  TaskStore editedTask;
  @action
  void setEditedTask(TaskStore task) => editedTask = task;

  @action
  void clearEditedTask() => editedTask = null;
}
