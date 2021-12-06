import 'package:flutter/material.dart';
import 'package:todolist/formulario_sesion.dart';

class FormRegistro extends StatefulWidget {
  FormRegistro({Key? key}) : super(key: key);

  @override
  _FormRegistroState createState() => _FormRegistroState();
}

class _FormRegistroState extends State<FormRegistro> {
  final myControllerT = TextEditingController();
  final myControllerP = TextEditingController();

  @override
  void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    myControllerT.dispose();
    myControllerP.dispose();
    super.dispose();
  }

  bool g = true;
  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: g,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'REGISTRO',
                style: TextStyle(fontSize: 24, letterSpacing: 4),
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
                              controller: myControllerT,
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
                          controller: myControllerP,
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
                      onPressed: () {
                        print(myControllerT.text + myControllerP.text);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: 30, top: 20, bottom: 20, left: 30),
                        child: Text(
                          'Registrarse',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
