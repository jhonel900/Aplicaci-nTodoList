import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'segundoPanel/tareas.dart';

class Formulario extends StatefulWidget {
  @override
  _Formulario createState() => _Formulario();
}

class _Formulario extends State<Formulario> {
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Column(
      children: [
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
                  color: Color.fromRGBO(50, 10, 43, 0.5),
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 4,
                      color: Color.fromRGBO(223, 123, 12, 0.5),
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
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )
        ]),
        Expanded(child: TextField()),
        Row(
          children: [
            Text('Constraseña',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
          ],
        ),
        Expanded(child: TextField()),
        Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              ElevatedButton(
                style: ButtonStyle(),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Tareas()));
                },
                child: Padding(
                  padding:
                      EdgeInsets.only(right: 42, top: 20, bottom: 20, left: 42),
                  child: Text(
                    'Ingresar',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(),
                onPressed: () {},
                child: Padding(
                  padding:
                      EdgeInsets.only(right: 30, top: 20, bottom: 20, left: 30),
                  child: Text(
                    'Registrarse',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ])
      ],
    );
  }
}
