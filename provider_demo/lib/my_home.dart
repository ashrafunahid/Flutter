import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/providers/my_home_provider.dart';

class MyHome extends StatelessWidget {
  MyHome({Key? key}) : super(key: key);

  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider <MyHomeProvider>(
        create: (context) => MyHomeProvider(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: Text("Provider Demo"), centerTitle: true,),
            body: Container(
              padding: EdgeInsets.all(20),
              child: Form(
                child: Consumer <MyHomeProvider>(
                  builder: (context, provider, child){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: provider.isAdult ? Colors.green : Colors.blue,
                          ),
                        ),
                        TextFormField(
                          controller: ageController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: (){
                              final int age = int.parse(ageController.text.trim());
                              provider.checkAge(age);
                            },
                            child: Text("Check"),
                        ),
                        Text(provider.message),
                      ],
                    );
                  },
                )
              ),
            ),
          );
        },
      ),
    );
  }
}
