// class Note{
//   int _id;
//   String _title;
//   String _description;
//   String _date;
//   int _priority;
//
//   Note(this._title, this._date, this._priority, [this._description]);
//   Note.withId(this._id, this._title, this._date, this._priority, [this._description]);
//
//   int get id => _id;
//
//   String get title => _title;
//
//   String get description => _description;
//
//   int get priority => _priority;
//
//   String get date => _date;
//
//   set title(String newTitle) {
//     if(newTitle.length <= 255){
//       this._title = newTitle;
//     }
//   }
//
//   set description(String newDescription) {
//     if(newDescription.length <= 255){
//       _description = newDescription;
//     }
//   }
//
//   set priority(int newPriority){
//     if(newPriority >= 1 && newPriority <= 2){
//       _priority = newPriority;
//     }
//   }
//
//   set date(String newDate) {
//     _date = newDate;
//   }
//
//
//   // Convert user input values into Map Object
//   Map<String, dynamic> toMap() {
//       var map = Map<String, dynamic>();
//
//       if(id !- null){
//         map['id'] = _id;
//       }
//
//       map['title'] = _title;
//       map['description'] = _description;
//       map['priority'] = _priority;
//       map['date'] = _date;
//
//       return map;
//   }
//
//   // Extract Note Object from a Map Object
//   Note.fromMapObject(Map<String, dynamic> map){
//     this._id = map['id'];
//     this._title = map['title'];
//     this._description = map['description'];
//     this._priority = map['priority'];
//     this._date = map['date'];
//
//   }
//
// }
import 'package:flutter/cupertino.dart';

class Note {
  final int? id;
  final String title;
  final String description;

  Note({this.id, required this.title, required this.description});

  factory Note.fromMap(Map<String, dynamic> json) => new Note(
        id: json['id'],
        title: json['title'],
        description: json['description'],
      );

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }
}
