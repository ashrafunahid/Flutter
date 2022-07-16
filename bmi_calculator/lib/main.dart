import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "BMI Calculator",
    theme: FlexThemeData.light(scheme: FlexScheme.gold),
    darkTheme: FlexThemeData.dark(scheme: FlexScheme.gold),
    themeMode: ThemeMode.system,
    home: MyHome(),
  ));
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  double? _bmi;
  String _info = "BMI Calculator";
  String _result = "Please enter your height and weight to calculate your BMI";

  void _calculate(){
    final double? height_m = double.tryParse(_heightController.value.text);
    final double? height = (height_m! * 2.54)/100.0;
    final double? weight = double.tryParse(_weightController.value.text);

    if (height == null || height <= 0 || weight == null || weight <= 0) {
      setState(() {
        _result = "Your height and weight must be positive numbers";
      });
      return;
    }

    setState(() {
      _bmi = weight / (height * height);
      if (_bmi! < 18.5) {
        _result = "You are underweight";
      } else if (_bmi! < 25) {
        _result = 'You body is fine';
      } else if (_bmi! < 30) {
        _result = 'You are overweight';
      } else {
        _result = 'You are obese';
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      // appBar: AppBar(title: Text("BMI Calculator"), centerTitle: true,),
      body: Center(
          child: SingleChildScrollView(
            // reverse: true,
            child: Container(
              alignment: Alignment.center,
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: Text(_info, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                      ),
                      SizedBox(height: 20,),
                      TextField(
                        maxLines: 1,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.height),
                          labelText: "Height (in)",
                        ),
                        controller: _heightController,
                      ),
                      SizedBox(height: 10,),
                      TextField(
                        maxLines: 1,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.monitor_weight_rounded),
                          labelText: "Weight (kg)"
                        ),
                        controller: _weightController,
                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(onPressed: (){
                        _calculate();
                      },
                          child: Text("Calculate",),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(15),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        child: Text(
                          _bmi == null ? "0" : "BMI is :: "+_bmi!.toStringAsFixed(2),
                          style: TextStyle(fontSize: (50)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        child: Text(
                          _result,
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
    );
  }
}
