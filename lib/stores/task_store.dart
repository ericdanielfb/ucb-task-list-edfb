import 'package:mobx/mobx.dart';
part 'task_store.g.dart';

class TaskStore = _TaskStoreBase with _$TaskStore;

abstract class _TaskStoreBase with Store {
  _TaskStoreBase(
      {this.title, this.description, this.endDate, this.done = false});

  @observable
  String title;
  @action
  setTitle(String value) => title = value;

  @observable
  String description;
  @action
  setDescription(String value) => description = value;

  @observable
  DateTime endDate;
  @action
  setEndDate(DateTime value) => endDate = value;

  @observable
  bool done;
  @action
  setDone(bool value) => done = value;

  TaskStore fromJson(Map<String, dynamic> json) {
    return TaskStore(
        title: json['title'],
        description: json['description'],
        endDate: DateTime.fromMicrosecondsSinceEpoch(json['endDate']),
        done: json['done']);
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'endDate': endDate.millisecondsSinceEpoch,
        'done': done
      };

  String toString() {
    return 'Title: $title, Description: $description, EndDate: ${endDate.toString()}, Done: $done ';
  }
}