import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_list_ucb_edfb/controller/controller.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Controller _controller;

  final _formKey = GlobalKey<FormState>();

  String name;

  TextEditingController _textEditingController = TextEditingController();

  void _save() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      _controller.setUserName(name);
      Navigator.of(context).pushNamed("home");
    }
  }

  @override
  Widget build(BuildContext context) {
    _controller = Provider.of<Controller>(context);
    _textEditingController.text = _controller.userName;

    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 100, 0, 20),
            child: Center(
              child: Container(
                width: 100,
                height: 100,
                child: Hero(
                  tag: "logo",
                  child: Image.asset("./assets/images/logo.png"),
                ),
              ),
            ),
          ),
          Container(
            child: Container(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        controller: _textEditingController,
                        decoration:
                            InputDecoration(labelText: 'Digite seu nome'),
                        validator: (value) {
                          if (value.trim() == '') {
                            return 'Por favor, digite seu nome.';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          this.name = value;
                        },
                      ),
                    ),
                    RaisedButton(
                      child: Text(
                        'Entrar',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Theme.of(context).primaryColor,
                      onPressed: _save,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
