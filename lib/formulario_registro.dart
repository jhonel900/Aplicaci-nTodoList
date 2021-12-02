import 'package:flutter/material.dart';

class FormularioRegistro {
  Column columnaRegistro() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Registro',
            style: TextStyle(fontSize: 24),
          ),
        ]),
        Padding(
            padding: EdgeInsets.all(10),
            child: Container(
                width: double.infinity,
                height: 100,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(children: [
                        Padding(
                          child: Text('Nombre De Usuario'),
                          padding: EdgeInsets.all(10),
                        )
                      ]),
                      TextField(
                          decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      )),
                    ]))),
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            width: double.infinity,
            height: 200,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('Contraseña'),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                      maxLength: 10,
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: Icon(Icons.password),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      )),
                ),
                ElevatedButton(
                  style: ButtonStyle(),
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: 30, top: 20, bottom: 20, left: 30),
                    child: Text(
                      'Registrarse',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
