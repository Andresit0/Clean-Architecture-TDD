part of presentation.screens;

class CustomTable extends StatelessWidget {
  final List<String> titleColumn;
  final List<List<String>> bodyColumn;
  const CustomTable(
      {super.key, required this.titleColumn, required this.bodyColumn});
  Widget table() {
    List<Widget> column = [];
    List<Widget> rowList = [
      for (int i = 0; i < titleColumn.length; i++)
        CustomLabelPrincipal(text: titleColumn[i])
    ];
    column.add(Row(children: rowList));
    for (int i = 0; i < bodyColumn.length; i++) {
      rowList = [];
      for (int j = 0; j < bodyColumn[i].length; j++) {
        rowList.add(CustomLabelSecundary(text: bodyColumn[i][j]));
      }
      column.add(Row(children: rowList));
    }
    return Column(
      children: column,
    );
  }

  @override
  Widget build(BuildContext context) {
    return table();
  }
}
