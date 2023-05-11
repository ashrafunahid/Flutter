import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';

class StorageHelper {
  // Getting local path
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  // Getting a Certain File on local path
  static Future<File> _getLocalFiles(String fileName) async {
    final localPath = await _localPath;
    return File("$localPath/$fileName");
  }

  // Reading text from the file
  static Future<String> readFromFile(String fileName) async {
    try{
      final file = await _getLocalFiles(fileName);
      return file.readAsString();
    }catch(e){
      return "0";
    }
  }

  // Reading multiple data from the file
  static Future<Uint8List> readDataFromFile(String fileName) async {
    final file = await _getLocalFiles(fileName);
    return file.readAsBytes();
  }

  // Writing text on the file
  static Future<File> writeTextToFile(String fileName, String text) async {
    final file = await _getLocalFiles(fileName);
    print(file);
    return file.writeAsString(text);
  }

  // Writing multiple data on the file
  static Future<File> writeDataToFile(String fileName, Uint8List data) async {
    final file = await _getLocalFiles(fileName);
    return file.writeAsBytes(data);
  }
}
