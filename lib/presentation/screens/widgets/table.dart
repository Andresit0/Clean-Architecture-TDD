import 'package:flutter/material.dart';

import 'label.dart';

Widget table({
  required List<String> titleColumn,
  required List<List<String>> bodyColumn,
}) {
  List<Widget> column = [];
  List<Widget> rowList = [
    for (int i = 0; i < titleColumn.length; i++)
      labelPrincipal(text: titleColumn[i])
  ];

  column.add(Row(children: rowList));

  for (int i = 0; i < bodyColumn.length; i++) {
    rowList = [];
    for (int j = 0; j < bodyColumn[i].length; j++) {
      rowList.add(labelSecundary(text: bodyColumn[i][j]));
    }
    column.add(Row(children: rowList));
  }

  return Column(
    children: column,
  );
}
