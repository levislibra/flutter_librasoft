import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Librasoft App Login',
      theme: ThemeData(
        dividerColor: Colors.black,
        primarySwatch: Colors.blueGrey,
        buttonTheme: ButtonThemeData(height: 50, buttonColor: Colors.blueAccent),
        textTheme: TextTheme(
          button: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      home: LoginPage(),
    );
  }
}
