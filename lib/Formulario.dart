import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              ElevatedButton(
                style: ButtonStyle(),
                onPressed: () {},
                child: Padding(
                  padding:
                      EdgeInsets.only(right: 50, top: 20, bottom: 20, left: 50),
                  child: Text(
                    'hola',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(),
                onPressed: () {},
                child: Padding(
                  padding:
                      EdgeInsets.only(right: 50, top: 20, bottom: 20, left: 50),
                  child: Text(
                    'hola',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ])
      ],
    );
  }
}
