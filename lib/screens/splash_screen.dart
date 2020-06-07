import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2))
        .then((value) => Navigator.of(context).pushReplacementNamed("login"));
  }

  @override
  Widget build(BuildContext context) {

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
