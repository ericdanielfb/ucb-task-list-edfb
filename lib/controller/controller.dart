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

  setUserName(String name) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('userName', name);
    userName = name;
  }

  loadUserName() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String _name = _prefs.getString('userName');
    userName = _name;
  }

  saveTaskList() async {
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
    return tasks;
  }

  getDoneTasks() {
    var tasks = ObservableList<TaskStore>();
    _taskList.forEach((task) {
      if (task.done) {
        tasks.add(task);
      }
    });
    return tasks;
  }

  loadTaskList() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    List<String> _listStr = _prefs.getStringList("lista");

    ObservableList<TaskStore> _list = ObservableList<TaskStore>();

    if (_listStr != null) {
      _listStr
          .map((e) => _list.add(TaskStore().fromJson(jsonDecode(e))))
          .toList();
    }
    _taskList = _list;
  }

  @action
  setTaskDone(TaskStore task, bool value){
    task.setDone(value);
    saveTaskList();
  }





}
