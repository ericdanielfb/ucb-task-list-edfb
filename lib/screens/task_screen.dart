import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:task_list_ucb_edfb/controller/controller.dart';
import 'package:task_list_ucb_edfb/stores/task_store.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final _formKey = GlobalKey<FormState>();
  Controller _controller;

  String _title;
  String _description;
  DateTime _endDate;

  TaskStore _editedTask;

  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  DateTime _endDateController;

  void _save() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      _editedTask.setTitle(_title);
      _editedTask.setDescription(_description);
      _editedTask.setEndDate(_endDate);
      print(_editedTask);

      _controller.addTask(_editedTask);
      _controller.clearEditedTask();
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    _controller = Provider.of<Controller>(context);
    _editedTask = _controller.editedTask ?? TaskStore();

    if (_editedTask != null) {
      _titleController.text = _editedTask.title;
      _descriptionController.text = _editedTask.description;
      _endDateController = _editedTask.endDate;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_controller.userName),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              _controller.editedTask == null
                  ? "Nova Tarefa"
                  : "Editar Tarefa",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Título"),
                    controller: _titleController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor, digite o título.';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      this._title = value;
                    },
                  ),
                ),
                Divider(color: Colors.transparent),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(labelText: "Descrição"),
                    maxLines: 5,
                    controller: _descriptionController,
                    onSaved: (value) {
                      this._description = value;
                    },
                  ),
                ),
                Divider(color: Colors.transparent),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: DateTimeField(
                    initialValue: _endDateController,
                    decoration: InputDecoration(labelText: "Prazo"),
                    format: DateFormat("dd/MM/yyyy, HH:mm"),
                    onShowPicker: (context, currentValue) async {
                      final date = await showDatePicker(
                          context: context,
                          firstDate: DateTime(DateTime.now().year),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100));
                      if (date != null) {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(
                            currentValue ?? DateTime.now(),
                          ),
                        );
                        DateTime value = DateTimeField.combine(date, time);
                        return value;
                      } else {
                        return currentValue;
                      }
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Por favor, selecione a data.';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      this._endDate = value;
                    },
                  ),
                ),
                Divider(color: Colors.transparent),
                RaisedButton(
                  child: Text("Salvar"),
                  onPressed: _save,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
