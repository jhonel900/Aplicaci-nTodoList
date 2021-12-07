import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todolist/formulario_registro.dart';
import 'package:todolist/segundoPanel/tareas.dart';

class FormularioSesion extends StatefulWidget {
  late RegistroUsers usuariosR;
  bool visibilidadFormSesion = true;
  static bool v = true;
  FormularioSesion(bool visibilidadFormSesion, RegistroUsers counterStorage) {
    this.visibilidadFormSesion = visibilidadFormSesion;
    usuariosR = counterStorage;
  }
  @override
  _Formulario createState() => _Formulario(v);
}

class _Formulario extends State<FormularioSesion> {
  final userC = TextEditingController();
  final passC = TextEditingController();
  var textU;
  String nom = '';
  String pass = '';
  var comple;
  var div;
  bool visibilidadFormSesion = true;
  bool visibleFormRegistroIn = false;

  _Formulario(bool visib) {
    this.visibilidadFormSesion = visib;
    textU = RegistroUsers();
  }
  Column? columnaTotal;
  Column? columnaBotones;

  bool visibilidadBotonesTotal = false;

  bool _visibleButtonIngresar = true;
  bool _buttonRegistrar = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          visibilidadFormSesion
              ? Column(children: [
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'TODO LISTA',
                        style: TextStyle(
                            letterSpacing: 6,
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(69, 69, 69, 0.9),
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 4,
                                color: Color.fromRGBO(226, 223, 222, 0.5),
                              )
                            ]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(children: [
                    Text(
                      'USUARIO :',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                    )
                  ]),
                  TextField(
                    controller: userC,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text('CONTRASEÑA',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2))
                    ],
                  ),
                  TextField(
                    controller: passC,
                    obscureText: true,
                  ),
                ])
              : FormRegistro(
                  storage: widget.usuariosR,
                ),
          SizedBox(
            height: 20,
          ),
          columnaBotones = Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Visibility(
                    visible: _visibleButtonIngresar,
                    child: ElevatedButton(
                      style: ButtonStyle(),
                      onPressed: () {
                        widget.usuariosR.readCounter().then((value) {
                          comple = value.toString();
                          List a = comple.split(',');
                          a.removeLast();
                          print(a);
                          print(a.length);
                          print(a.contains(userC.text));
                          if (a.contains(userC.text) == true) {
                            print('contiene');
                            if (a.contains(passC.text)) {
                              limpiar();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Tareas()));
                            } else {
                              limpiar();
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text(
                                      'Alerta usuario o contraseña invalidos'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          } else {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text(
                                    'Alerta usuario o contraseña invalidos'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: 42, top: 20, bottom: 20, left: 42),
                        child: Text(
                          'Ingresar',
                          style: TextStyle(fontSize: 20, letterSpacing: 3),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                Visibility(
                    visible: _buttonRegistrar,
                    child: ElevatedButton(
                      style: ButtonStyle(),
                      onPressed: () {
                        setState(() {
                          visibilidadFormSesion = false;
                          _visibleButtonIngresar = false;
                          _buttonRegistrar = false;
                          visibleFormRegistroIn = true;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: 30, top: 20, bottom: 20, left: 30),
                        child: Text(
                          'Registrarse',
                          style: TextStyle(fontSize: 20, letterSpacing: 3),
                        ),
                      ),
                    )),
                Visibility(
                    visible: visibleFormRegistroIn,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            visibilidadFormSesion = true;
                            _visibleButtonIngresar = true;
                            _buttonRegistrar = true;
                            visibleFormRegistroIn = false;
                          });
                        },
                        child: Text(
                          'Iniciar Sesión',
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.red),
                          elevation: MaterialStateProperty.all(0.0),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(side: BorderSide.none)),
                        ))),
              ]),
        ]));
  }

  void limpiar() {
    userC.clear();
    passC.clear();
  }
}
