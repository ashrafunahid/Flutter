import 'package:flutter/material.dart';
import 'package:sqlite_database_crud/edit_todo.dart';
import 'package:sqlite_database_crud/utils/database_helper.dart';
import 'models/note.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  int? selectedId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter SQFLite CRUD"), centerTitle: true),
      body: Center(
        child: Card(
          elevation: 1,
          child: FutureBuilder<List<Note>>(
            future: DatabaseHelper.instance.getNotes(),
            builder: (BuildContext context, AsyncSnapshot<List<Note>> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: Text("Loading..."),
                );
              }
              return snapshot.data!.isEmpty
                  ? Center(
                      child: Text("Currently you don't have a list"),
                    )
                  : ListView(
                      children: snapshot.data!
                          .map((note) => Center(
                                child: ListTile(
                                  onTap: (){
                                    navigateToEditTodo("Edit Note", note.id!);
                                  },
                                  title: Text(note.title),
                                  subtitle: Text(note.description),
                                  trailing: IconButton(
                                    onPressed: (){
                                      setState(() {
                                        DatabaseHelper.instance.remove(note.id!);
                                      });
                                    },
                                    icon: Icon(Icons.delete),
                                  ),
                                ),
                              ))
                          .toList(),
                    );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // debugPrint("Floating Action Button Pressed");
          // Navigator.push(context, MaterialPageRoute(builder: (context){
          //   return EditTodo();
          // }));
          navigateToEditTodo("Add Note", 1);
        },
        child: Icon(Icons.add),
        tooltip: "Add New Todo",
      ),
    );
  }

  // ListView getToDoList() {
  //   TextStyle? titleStyle = Theme.of(context).textTheme.subtitle1;
  //
  //   return ListView.builder(
  //     itemCount: _count,
  //       itemBuilder: (BuildContext context, int position){
  //       return Card(
  //         color: Colors.white54,
  //         elevation: 2,
  //         child: ListTile(
  //           leading: CircleAvatar(backgroundColor: Colors.green, child: Icon(Icons.arrow_right_sharp),),
  //           title: Text("Title", style: titleStyle,),
  //           subtitle: Text("Sub Title"),
  //           trailing: Icon(Icons.delete_sharp, color: Colors.grey,),
  //           onTap: (){
  //             // debugPrint("Delete Button Pressed");
  //             // Navigator.push(context, MaterialPageRoute(builder: (context) => EditTodo()));
  //             navigateToEditTodo("Edit Note");
  //           },
  //         ),
  //       );
  //       }
  //   );
  // }
  //
  navigateToEditTodo(String title, noteId) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => EditTodo(title, noteId)));
  }
}
