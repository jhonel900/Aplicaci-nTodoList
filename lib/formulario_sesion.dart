import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todolist/formulario_registro.dart';
import 'segundoPanel/tareas.dart';

class FormularioSesion extends StatefulWidget {
  bool visibilidadFormSesion = true;
  static bool v = true;
  FormularioSesion(bool visibilidadFormSesion) {
    this.visibilidadFormSesion = visibilidadFormSesion;
  }
  @override
  _Formulario createState() => _Formulario(v);
}

class _Formulario extends State<FormularioSesion> {
  bool visibilidadFormSesion = true;
  bool visibleFormRegistroIn = false;

  _Formulario(bool visib) {
    this.visibilidadFormSesion = visib;
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
                      'Usuario :',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )
                  ]),
                  TextField(),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text('Constraseña',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold))
                    ],
                  ),
                  TextField(),
                ])
              : FormRegistro(),
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Tareas();
                        }));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: 42, top: 20, bottom: 20, left: 42),
                        child: Text(
                          'Ingresar',
                          style: TextStyle(fontSize: 20),
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
                          style: TextStyle(fontSize: 20),
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
}
