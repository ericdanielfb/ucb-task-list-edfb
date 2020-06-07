import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_list_ucb_edfb/controller/controller.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Controller _controller;
  

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2))
        .then((value) => Navigator.of(context).pushReplacementNamed("login"));
  }

  @override
  Widget build(BuildContext context) {
    _controller = Provider.of<Controller>(context);
    _controller.loadUserName();
    _controller.loadTaskList();

    return Scaffold(
      body: Center(
        child: Container(
          child: Image.asset("./assets/images/logo.png"),
          height: 300,
          width: 300,
        ),
      ),
    );
  }
}
