import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todolist/Formulario.dart';

class Inicio_Sesion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.all(30),
            padding: EdgeInsets.all(20),
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: new LinearGradient(colors: [
                  Color.fromRGBO(4, 250, 216, 1.0),
                  Color.fromRGBO(14, 229, 210, 1.0),
                ], begin: Alignment(0.0, 0.5), end: Alignment(0.0, 1.0)),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFF101000),
                      offset: Offset(5, 5),
                      blurRadius: 2)
                ]),
            width: 600,
            height: double.infinity,
            child: Formulario()));

/*
    return SafeArea(
        child: Container(
      margin: EdgeInsets.all(30),
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: new LinearGradient(
          colors: [
            Color(0xFFFF422C),
            Color(0xFFFF9003),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.25, 0.90],
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF101012),
            offset: Offset(-12, 12),
            blurRadius: 8,
          ),
        ],
      ),
      alignment: Alignment.centerLeft, //to align its child
      padding: EdgeInsets.all(20),
      child: Text(
        'Challenge',
        style: TextStyle(
          fontSize: 46,
          color: Colors.white,
          fontWeight: FontWeight.w200,
          fontStyle: FontStyle.italic,
        ),
      ),
    ));
*/
  }
}
