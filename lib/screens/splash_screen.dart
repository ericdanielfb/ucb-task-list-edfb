import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_list_ucb_edfb/controller/controller.dart';
import 'package:task_list_ucb_edfb/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Controller _controller;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then(
      (_) => Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(seconds: 1),
          pageBuilder: (_, __, ___) => LoginScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _controller = Provider.of<Controller>(context);
    _controller.loadUserName();
    _controller.loadTaskList();

    return Scaffold(
      body: Center(
        child: Container(
          child: Hero(
            tag: "logo",
            child: Image.asset("./assets/images/logo.png"),
          ),
          height: 300,
          width: 300,
        ),
      ),
    );
  }
}
