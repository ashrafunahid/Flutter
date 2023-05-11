import 'package:file_operations/storage_helper.dart';
import 'package:flutter/material.dart';

class AppHome extends StatefulWidget {
  const AppHome({Key? key}) : super(key: key);

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {

  String displayText = 'This is a dummy text';
  TextEditingController textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter File Operations"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: textEditingController,
          ),
          ElevatedButton(
              onPressed: (){
                StorageHelper.writeTextToFile("textfile.txt", textEditingController.value.text).then((value) {
                  textEditingController.clear();
                });
              },
              child: Text("Save to File")
          ),
          ElevatedButton(
              onPressed: (){
                StorageHelper.readTextFromFile('textfile.txt').then((value) {
                  setState(() {
                    displayText = value;
                  });
                });
              },
              child: Text("Read From File"),
          ),
          Text(displayText),
        ],
      ),
    );
  }
}
