import 'package:flutter/widgets.dart';
import 'package:todolist/fondo_formulario.dart';

class Fondo_Pantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.topCenter,
        decoration: const BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment(0.0, 0.5),
              end: Alignment(0.0, 1.0),
              colors: const <Color>[
                Color.fromRGBO(179, 0, 0, 1.0),
                Color.fromRGBO(166, 0, 0, 1.0)
              ],
              tileMode: TileMode.clamp),
        ),
        child: FondoFormularioT());
  }
}
