import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:task_list_ucb_edfb/controller/controller.dart';
import 'package:task_list_ucb_edfb/stores/task_store.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Controller _controller;

  @override
  Widget build(BuildContext context) {
    _controller = Provider.of<Controller>(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(_controller.userName),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.check_box_outline_blank),
              ),
              Tab(
                icon: Icon(Icons.check),
              )
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            _taskListToDo(),
            _taskListDone(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (() {
            _controller.clearEditedTask();
            Navigator.of(context).pushNamed("task");
          }),
        ),
      ),
    );
  }

  Widget _taskListToDo() {
    Function tasks = _controller.getToDoTasks;
    _controller.loadTaskList();
    return Observer(builder: (context) {
      return ListView.builder(
        itemCount: tasks().length,
        itemBuilder: (_, index) {
          TaskStore task = tasks()[index];
          return taskTile(task);
        },
      );
    });
  }

  Widget _taskListDone() {
    Function tasks = _controller.getDoneTasks;
    _controller.loadTaskList();
    return Observer(builder: (context) {
      return ListView.builder(
        itemCount: tasks().length,
        itemBuilder: (_, index) {
          TaskStore task = tasks()[index];
          return taskTile(task);
        },
      );
    });
  }

  Widget taskTile(TaskStore task) {
    return Observer(
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 15, 0),
          child: Dismissible(
            background: Container(
              color: Colors.red,
              child: Align(
                alignment: Alignment(-0.9, 0.0),
                child: Icon(Icons.delete, color: Colors.white),
              ),
            ),
            direction: DismissDirection.startToEnd,
            key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
            onDismissed: (direction) {
              removeTask(task);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(),
                borderRadius: BorderRadius.circular(3),
                boxShadow: [
                  BoxShadow(offset: Offset(2, 2)),
                ],
              ),
              child: ListTile(
                title: Text(
                  task.title,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "${task.description}\n" +
                      "Prazo: " +
                      DateFormat('dd/MM, HH:mm').format(task.endDate),
                  style: TextStyle(color: Colors.black),
                ),
                isThreeLine: true,
                leading: Checkbox(
                  value: task.done,
                  onChanged: (value) {
                    _controller.setTaskDone(task, value);
                  },
                  activeColor: Colors.red,
                ),
                onTap: () {
                  // _controller.clearEditedTask();
                  _controller.setEditedTask(task);
                  Navigator.of(context).pushNamed("task");
                },
              ),
            ),
          ),
        );
      },
    );
  }

  removeTask(TaskStore task) {
    _controller.setEditedTask(task);
    _controller.removeTask(task);
    showSnackBar();
  }

  void showSnackBar() {
    Duration _duration = Duration(seconds: 2);
    final snack = SnackBar(
      content: Text("Tarefa removida!"),
      duration: _duration,
      action: SnackBarAction(
        label: "desfazer",
        onPressed: () {
          _controller.addTask(_controller.editedTask);
          _controller.clearEditedTask();
        },
      ),
      onVisible: () {
        Future.delayed(_duration).then((_) => _controller.clearEditedTask());
      },
    );
    _scaffoldKey.currentState.hideCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(snack);
  }
}
