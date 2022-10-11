import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Dropdown Menu with Search',
    home: MyHome(),
  ));
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Dropdown Menu with Search"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DropdownSearch<String>(
              mode: Mode.MENU,
              showSearchBox: true,
              showSelectedItems: true,
              items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
              dropdownSearchDecoration: InputDecoration(
                labelText: "Menu mode",
                hintText: "country in menu mode",
              ),
              popupItemDisabled: (String s) => s.startsWith('I'),
              onChanged: print,
              selectedItem: "Brazil",
            ),
            DropdownSearch<String>.multiSelection(
              mode: Mode.MENU,
              showSelectedItems: true,
              items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
              dropdownSearchDecoration: InputDecoration(
                labelText: "Menu mode",
                hintText: "country in menu mode",
              ),
              popupItemDisabled: (String s) => s.startsWith('I'),
              onChanged: print,
              selectedItems: ["Brazil"],
            ),
          ],
        ),
      ),
    );
  }
}
