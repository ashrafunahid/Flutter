import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'DataTable Widget',
  home: Scaffold(
    appBar: AppBar(
      title: Text("DataTable Widget"),
      centerTitle: true,
    ),
    body: MyBody(),
  ),
));

class MyBody extends StatefulWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: DataTable(
            columns: [
              DataColumn(label: Text("ID")),
              DataColumn(label: Text("Name")),
              DataColumn(label: Text("Email")),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text("1")),
                DataCell(Text("Ashraf")),
                DataCell(Text("ashrafunahid@gmail.com")),
              ]),
              DataRow(cells: [
                DataCell(Text("2")),
                DataCell(Text("Aftab")),
                DataCell(Text("aftabunahin@gmail.com")),
              ]),
            ]
        ),
      );
  }
}
