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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      width: MediaQuery.of(context).size.width,
      child: DataTable(
        sortColumnIndex: 2,
        sortAscending: false,
        columns: [
          DataColumn(label: Text('id'), numeric: true),
          DataColumn(label: Text('tarea')),
          DataColumn(
            label: Text('Accion'),
          ),
        ],
        rows: [
          DataRow(selected: true, cells: [
            DataCell(
              Text('1'),
            ),
            DataCell(Text('Lavar Choche')),
            DataCell(Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                ElevatedButton(onPressed: () {}, child: Text('editar')),
                ElevatedButton(onPressed: () {}, child: Text('Borrar'))
              ],
            ))
          ]),
          DataRow(cells: [
            DataCell(Text('2')),
            DataCell(Text('renovar Dni')),
            DataCell(Text('nulo'))
          ]),
          DataRow(cells: [
            DataCell(Text('3')),
            DataCell(Text('Limpiar Casa')),
            DataCell(Text('nullo'))
          ])
        ],
      ),
    )));
  }
}
