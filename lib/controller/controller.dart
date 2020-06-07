import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_list_ucb_edfb/stores/task_store.dart';
part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {
  @observable
  ObservableList<TaskStore> taskList = ObservableList();

  @observable
  String userName;

  setUserName(String name) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('userName', name);
  }

  getUserNameSP() async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String _name = _prefs.getString('userName');
    userName = _name;
  }

  saveListSP() async{
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  _prefs.setStringList(
      'task_list',
      taskList.map((task) => jsonEncode(task.toJson())).toList(),
    );
  }
}