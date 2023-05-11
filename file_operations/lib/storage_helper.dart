import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';

class StorageHelper {

  // Getting local path
  static Future<String> get _getPath async{
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  // Getting a certain file on that path
  static Future<File> _getLocalFile(String fileName) async {
    final localPath = await _getPath;
    return File("$localPath/$fileName");
  }

  // Writing text on the file
  static Future<File> writeTextToFile(String fileName, String text) async {
    final file = await _getLocalFile(fileName);
    return file.writeAsString(text);
  }

  // Writing data on the file
  static Future<File> writeDataToFile(String fileName, Uint8List data) async {
    final file = await _getLocalFile(fileName);
    return file.writeAsBytes(data);
  }

  // Reading from file
  static Future<String> readTextFromFile(String fileName) async {
    try{
      final file = await _getLocalFile(fileName);
      return file.readAsString();
    } catch (e){
      return "On Catch error";
    }
  }
}
