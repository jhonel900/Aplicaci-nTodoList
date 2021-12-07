import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tareas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PanelTareas(),
    );
  }
}

class PanelTareas extends StatefulWidget {
  @override
  _PanelTareas createState() => _PanelTareas();
}

class _PanelTareas extends State<PanelTareas> {
  final myControllerTarea = TextEditingController();
  int cont = 1;
  List<DataRow> lista = [
    DataRow(cells: [
      DataCell(
        Text('1'),
      ),
      DataCell(Text('Lavar Choche')),
      DataCell(Text('nulo'))
    ]),
    DataRow(cells: [
      DataCell(
        Text('1'),
      ),
      DataCell(Text('Lavar Choche')),
      DataCell(Text('nulo'))
    ])
  ];
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
                          onPressed: () => Navigator.pop(context, 'agregar'),
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
          DataCell(Text('Lavar Choche')),
          DataCell(Text('nulo'))
        ]),
      );
    });
  }

  ElevatedButton botonEditar() {
    return ElevatedButton(onPressed: () {}, child: Text('editar'));
  }

  ElevatedButton botonBorrar() {
    return ElevatedButton(onPressed: () {}, child: Text('borrar'));
  }

  Row filabotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        botonEditar(),
        botonBorrar(),
      ],
    );
  }
}
