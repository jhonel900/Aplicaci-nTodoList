import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Tareas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PanelTareas(
        storageTareas: Tareas(),
      ),
    );
  }
}

class PanelTareas extends StatefulWidget {
  const PanelTareas({Key? key, required this.storageTareas}) : super(key: key);

  final Tareas storageTareas;
  @override
  _PanelTareas createState() => _PanelTareas();
}

class _PanelTareas extends State<PanelTareas> {
  String vl = '';
  final myControllerTarea = TextEditingController();

  final myControllerTareaE = TextEditingController();
  int cont = 1;
  List<DataRow> lista = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      width: MediaQuery.of(context).size.width,
      child: Column(children: [
        DataTable(
            sortColumnIndex: 2,
            sortAscending: false,
            columns: [
              DataColumn(label: Text('id'), numeric: true),
              DataColumn(label: Text('tarea')),
              DataColumn(
                label: Text('Accion'),
              ),
            ],
            rows: lista),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Nueva Tarea'),
                      content: Expanded(
                          child: TextField(
                        controller: myControllerTarea,
                      )),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancelar'),
                          child: const Text('Cancelar'),
                        ),
                        TextButton(
                          onPressed: () {
                            if (myControllerTarea.text.isNotEmpty) {
                              insertarTarea(myControllerTarea.text);
                              myControllerTarea.clear();
                            }
                            return Navigator.pop(context, 'agregar');
                          },
                          child: const Text('agregar'),
                        ),
                      ],
                    ),
                  );
                },
                child: Text('Nueva Tarea'))
          ],
        ),
      ]),
    )));
  }

  List<DataRow> getlist() {
    return lista;
  }

  void insertarTarea(
    String tarea,
  ) {
    setState(() {
      lista.add(
        DataRow(cells: [
          DataCell(
            Text((lista.length + 1).toString()),
          ),
          DataCell(Text(tarea)),
          DataCell(filabotones((lista.length + 1).toString()))
        ]),
      );
    });
  }

  ElevatedButton botonEditar(String c) {
    return ElevatedButton(
        onPressed: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Editar Tarea'),
              content: Expanded(
                  child: TextField(
                controller: myControllerTareaE,
              )),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancelar'),
                  child: const Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      if (myControllerTareaE.text.isNotEmpty) {
                        print(lista.removeAt(int.parse(c) - 1));
                        print(lista.length);
                        lista.insert(
                          (int.parse(c) - 1),
                          DataRow(cells: [
                            DataCell(
                              Text((lista.length + 1).toString()),
                            ),
                            DataCell(Text(myControllerTareaE.text)),
                            DataCell(filabotones((lista.length + 1).toString()))
                          ]),
                        );
                        myControllerTareaE.clear();
                      } else {
                        print('object salida');
                      }
                      return Navigator.pop(context, 'Editar');
                    });
                  },
                  child: const Text('Editar'),
                ),
              ],
            ),
          );
        },
        child: Text('editar'));
  }

  ElevatedButton botonBorrar(String c) {
    Text txt = Text('ss');

    return ElevatedButton(
      onPressed: () {
        print('res');
        setState(() {
          for (int i = 0; i < lista.length; i++) {
            print(lista[i].cells[0].child);
            var f = lista[i].cells[0].child.toString();
            var d = f.substring(6, f.length - 2);
            print(d);
            if (d.toString() == c) {
              print('eliminado');
              lista.removeAt(i);
            }
          }
        });
      },
      child: Text('borrar'),
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
    );
  }

  Row filabotones(String c) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsets.all(5),
          child: botonEditar(c),
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: botonBorrar(c),
        )
      ],
    );
  }
}

class TareasUser {
  String tar;
  TareasUser(this.tar);
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$tar.txt');
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
