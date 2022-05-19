import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqlite_database_crud/todo_list.dart';
import 'package:sqlite_database_crud/utils/database_helper.dart';
import 'models/note.dart';

class EditTodo extends StatefulWidget {

  String appBarTitle;
  int noteId;
  EditTodo(this.appBarTitle, this.noteId);

  @override
  State<EditTodo> createState() => _EditTodoState(this.appBarTitle, this.noteId);
}

class _EditTodoState extends State<EditTodo> {

  static var _priorityOption = ["High", "Low"];

  String appTitle;
  int noteId;
  _EditTodoState(this.appTitle, this.noteId);

  final TextEditingController _titleController = TextEditingController(text: 'sdfsdf');
  final TextEditingController _descriptionController = TextEditingController(text: '');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future<List<Note>> note = DatabaseHelper.instance.getNotes();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle? _textStyle = Theme.of(context).textTheme.titleMedium;
    return Scaffold(
      appBar: AppBar(title: Text(appTitle), centerTitle: true,),
      body: Padding(
        padding: EdgeInsets.only(right: 10, bottom: 5, left: 10, top: 5),
        child: ListView(
          children: [
            ListTile(
              title: DropdownButton(
                items: _priorityOption.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                      child: Text(dropDownStringItem),
                    value: dropDownStringItem,
                  );
                }).toList(),
                style: _textStyle,
                value: "Low",
                onChanged: (valueSelectedByUser){
                  setState(() {
                    debugPrint("User Selected $valueSelectedByUser");
                  });
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 5),
              child: TextField(
                  controller: _titleController,
                style: _textStyle,
                onChanged: (value){
                    debugPrint("Something changed on Text Field");
                },
                decoration: InputDecoration(
                  labelText: "Title",
                  labelStyle: _textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 5),
              child: TextField(
                controller: _descriptionController,
                style: _textStyle,
                onChanged: (value){
                  debugPrint("Something changed on Text Field");
                },
                decoration: InputDecoration(
                  labelText: "Description",
                  labelStyle: _textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            
            Padding(
                padding: EdgeInsets.only(top: 30, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        await DatabaseHelper.instance.add(
                          Note(title: _titleController.text, description: _descriptionController.text),
                        );
                        setState(() {
                          _titleController.clear();
                          _descriptionController.clear();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MyHome()));
                        });
                      },
                      child: Icon(Icons.save_outlined),
                  ),
                  ElevatedButton(
                      onPressed: (){
                        setState(() {
                          _titleController.clear();
                          _descriptionController.clear();
                        });
                      },
                      child: Icon(Icons.format_clear),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
