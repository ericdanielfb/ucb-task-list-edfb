import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:task_list_ucb_edfb/controller/controller.dart';
import 'package:task_list_ucb_edfb/screens/home_screen.dart';
import 'package:task_list_ucb_edfb/screens/login_screen.dart';
import 'package:task_list_ucb_edfb/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<Controller>(
      create: (context) => Controller(),
      child: MaterialApp(
        title: 'Controle de Tarefas',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            hintStyle: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: [const Locale('pt', 'BR')],
        initialRoute: "splash",
        routes: {
          "splash": (context) => SplashScreen(),
          "login": (context) => LoginScreen(),
          "home": (context) => HomeScreen(),
          // "task": (context) => TaskScreen()
        },
      ),
    );
  }
}
