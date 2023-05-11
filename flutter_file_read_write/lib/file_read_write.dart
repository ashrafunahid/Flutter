import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart';
import 'dart:io';
class FileOperationsScreen extends StatefulWidget {
  FileOperationsScreen() : super();

  final String title = "File Operations";

  @override
  _FileOperationsScreenState createState() => _FileOperationsScreenState();
}

class _FileOperationsScreenState extends State<FileOperationsScreen> {
  String fileContents = "No Data";
  final name_controller = TextEditingController();
  final msg_controller = TextEditingController();
  List listFiles=List.empty(growable: true);
  var  _scaffold_key=GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FileUtils.getFiles().then((value) => {
      setState(() {
        listFiles=value;
      })
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold_key,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(

              keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,

          decoration: new InputDecoration(
              contentPadding:
              EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
              hintText: "File Name"),
              controller: name_controller,
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              decoration: new InputDecoration(
                  contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: "File data"),
              controller: msg_controller,
            ),
            ElevatedButton(
              child: Text("Save File"),
              onPressed: () {
                if(name_controller.text.length<=0)
                  {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Enter File name")));
                    return;
                  }
                if(msg_controller.text.length<=10)
                {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Enter File Data")));
                  return;
                }
                FileUtils.saveToFile(name_controller.text,msg_controller.text).then((value) => {
                  FileUtils.getFiles().then((value) => {
                    setState(() {
                      listFiles=value;
                    })
                  })

                });

              },
            ),
            Card(child: Container(width:double.infinity,padding:EdgeInsets.all(10),child: Center(child: Text("List Of Files",style: TextStyle(color: Colors.green,fontSize: 20),)))),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: listFiles.length,
                  itemBuilder: (context,index){
                    String path=listFiles[index].path;
                   String file_name= path.substring(path.lastIndexOf("/")+1);
                return Card(
                  elevation: 10,
                  margin: EdgeInsets.all(10),
                  child: ListTile(title: Text(file_name),onTap: (){

                    FileUtils.readFromFile(file_name).then((contents) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("File Content ${contents}")));
                    });
                  },),
                );
              }),
            ),

          ],
        ),
      ),
    );
  }
}

class FileUtils {
  static String folderName="MyFiles";
  static Future<String> get getFilePath async {
    final directory = await getApplicationDocumentsDirectory();
    final Directory _appDocDirFolder= Directory('${directory.path}/${folderName}/');

    if(await _appDocDirFolder.exists()){ //if folder already exists return path
      return _appDocDirFolder.path;
    }else{//if folder not exists create folder and then return its path
      final Directory _appDocDirNewFolder=await _appDocDirFolder.create(recursive: true);
      return _appDocDirNewFolder.path;
    }

  }

  static  Future<List> getFiles()
  async {
    final directory = await getApplicationDocumentsDirectory();
    final Directory _appDocDirFolder= Directory('${directory.path}/${folderName}/');
    if(await _appDocDirFolder.exists()){ //if folder already exists return path
      return _appDocDirFolder.listSync();
    }
    return List.empty(growable: true);
  }

  static Future<File>  getFile(String name) async {
    final path = await getFilePath;

    return File('$path/$name');
  }

  static Future<File> saveToFile(String name,data) async {
    final file = await getFile(name);
    return file.writeAsString(data);
  }

  static Future<String> readFromFile(name) async {
    try {
      final file = await getFile(name);
      String fileContents = await file.readAsString();
      return fileContents;
    } catch (e) {
      return "";
    }
  }

  static Future<String> createFolderInAppDocDir(String folderName) async {

    //Get this App Document Directory
    final Directory _appDocDir = await getApplicationDocumentsDirectory();
    //App Document Directory + folder name
    final Directory _appDocDirFolder =  Directory('${_appDocDir.path}/$folderName/');

    if(await _appDocDirFolder.exists()){ //if folder already exists return path
      return _appDocDirFolder.path;
    }else{//if folder not exists create folder and then return its path
      final Directory _appDocDirNewFolder=await _appDocDirFolder.create(recursive: true);
      return _appDocDirNewFolder.path;
    }
  }
}
