import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class FormRegistro extends StatefulWidget {
  const FormRegistro({Key? key, required this.storage}) : super(key: key);

  final CounterStorage storage;

  @override
  _FormRegistroState createState() => _FormRegistroState();
}

class _FormRegistroState extends State<FormRegistro> {
  String usuario = '';
  String aux = '';
  final myControllerT = TextEditingController();
  final myControllerP = TextEditingController();

  @override
  void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    myControllerT.dispose();
    myControllerP.dispose();
    super.dispose();
  }

  void _agregarUsuario() {
    setState(() {
      usuario = myControllerT.text + "," + myControllerP.text;
      var a = widget.storage.readCounter().then((value) {
        usuario = value + usuario + ',';
        print(usuario);
        widget.storage.writeCounter(usuario);
      });
    });
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
                        _agregarUsuario();
                        myControllerP.clear();
                        myControllerT.clear();
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

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/usuario.txt');
  }

  Future<String> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return "";
    }
  }

  Future<File> writeCounter(String? counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }
}
