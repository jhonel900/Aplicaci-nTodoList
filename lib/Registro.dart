import 'package:flutter/material.dart';

class Registro extends StatelessWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _Registro(),
    );
  }
}

class _Registro extends StatefulWidget {
  _Registro({Key? key}) : super(key: key);

  @override
  __RegistroState createState() => __RegistroState();
}

class __RegistroState extends State<_Registro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
      )),
    );
  }
}
