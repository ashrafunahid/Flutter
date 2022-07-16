import 'package:flutter/material.dart';

class Result extends StatelessWidget {

  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultValue{
    String resultText;
    if(resultScore <= 20){
      resultText = 'Result is less poor';
    } else if (resultScore <= 30){
      resultText = 'Result is average';
    }else if (resultScore <= 60){
      resultText = 'Result is good';
    }else{
      resultText = 'result is bad';
    }
    return resultText;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(resultValue, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
        ),
        TextButton(
            onPressed: resetHandler,
            child: Text("Restart Quiz")
        ),
      ],
    );
  }
}
