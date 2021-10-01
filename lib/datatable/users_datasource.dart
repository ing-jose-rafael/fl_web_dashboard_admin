import 'package:admin_dashboard/models/usuario_model.dart';
import 'package:flutter/material.dart';

class UsersDTS extends DataTableSource {
  final List<Usuario> users;
  UsersDTS(this.users);
  @override
  DataRow? getRow(int index) {
    final usuario = users[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text('avatar $index')),
        DataCell(Text('${usuario.nombre}')),
        DataCell(Text('${usuario.correo}')),
        DataCell(Text('${usuario.uid}')),
        DataCell(Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.edit_outlined)),
            IconButton(onPressed: () {}, icon: Icon(Icons.delete_outline, color: Colors.red.withOpacity(0.8))),
          ],
        )),
      ],
    );
  }

  // isRowCountApproximate => false; cuando el dato es exacto
  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => this.users.length;

  @override
  int get selectedRowCount => 0;
}
