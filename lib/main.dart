import 'package:flutter/material.dart';
import 'fondo_pantalla.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'aplicacion Todo List',
        theme: ThemeData(primarySwatch: Colors.red),
        home: Scaffold(
          body: Lamina(),
        ));
  }
}

class Lamina extends StatefulWidget {
  @override
  Estado createState() => Estado();
}

class Estado extends State<Lamina> {
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Fondo_Pantalla();
  }
}
