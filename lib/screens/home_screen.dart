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
  Controller _controller;

  @override
  Widget build(BuildContext context) {
    _controller = Provider.of<Controller>(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_controller.userName),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.check_box_outline_blank),
                text: "A concluir",
              ),
              Tab(
                icon: Icon(Icons.check),
                text: "Concluídas",
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
          onPressed: (() => {Navigator.of(context).pushNamed("task")}),
        ),
      ),
    );
  }

  Widget _taskListToDo() {
    Function tasks = _controller.getToDoTasks;
    _controller.loadTaskList();
    return Observer(
      builder: (context) {
        if (tasks().length != null) {
          return Center(
            child: Text(
              "Não há tarefas a concluir",
              style: TextStyle(color: Colors.grey, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          );
        } else {
          return ListView.builder(
            itemCount: tasks().length,
            itemBuilder: (_, index) {
              TaskStore task = tasks()[index];
              return taskTile(task);
            },
          );
        }
      },
    );
  }

  Widget _taskListDone() {
    Function tasks = _controller.getToDoTasks;
    _controller.loadTaskList();
    return Observer(
      builder: (context) {
        if (tasks().length != null) {
          return Center(
            child: Text(
              "Não há tarefas concluídas",
              style: TextStyle(color: Colors.grey, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          );
        } else {
          return ListView.builder(
            itemCount: tasks().length,
            itemBuilder: (_, index) {
              TaskStore task = tasks()[index];
              return taskTile(task);
            },
          );
        }
      },
    );
  }

  Widget taskTile(TaskStore task) {
    return Observer(
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 15, 0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(offset: Offset(2, 2)),
              ],
            ),
            child: ListTile(
              title: Text(
                task.title,
                style: TextStyle(color: Colors.black),
              ),
              subtitle: Text(
                "Prazo: " + DateFormat('dd/MM, HH:mm').format(task.endDate),
                style: TextStyle(color: Colors.black),
              ),
              leading: Checkbox(
                value: task.done,
                onChanged: (value){
                  _controller.setTaskDone(task, value);
                },
                activeColor: Colors.red,
              ),
            ),
          ),
        );
      },
    );
  }
}
