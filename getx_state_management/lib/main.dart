import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/student.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

//   // If we want to make any targeted property of a class to make it as Reactive / Observable
// var student = Student();

// If we want to make the whole class Reactive / Observable
final student = Student(name:"Ashraf", age: 31).obs;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("GetX State Management"),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() => Text("Name is ${student.value.name} and age is ${student.value.age}")),
              ElevatedButton(
                  onPressed: (){
                    // // If we want to make any targeted property of a class to make it as Reactive / Observable
                    // student.name.value = student.name.value.toUpperCase();
                    // student.age.value = 30;

                    // If we want to make the whole class Reactive / Observable
                    student.update( (student) {
                      student!.name = student!.name.toString().toUpperCase();
                      student.age = 28;
                    });
                  },
                  child: Text("Change State"))
            ],
          ),
        ),
      ),
    );
  }
}
