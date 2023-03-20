import 'package:flutter/material.dart';

class AppBody extends StatefulWidget {
  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  int _currentStep = 0;
  bool hide = false;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      steps: stepList,
      currentStep: _currentStep,
      elevation: 5.0,
      type: StepperType.vertical,
      controlsBuilder: (BuildContext ctx, ControlsDetails dtl){
        return Row(
          children: <Widget>[
            TextButton(
              onPressed: _currentStep < stepList.length - 1 ? dtl.onStepContinue : null,
              child: Text(hide == true ? '' : 'NEXT'),
            ),
            TextButton(
              onPressed: dtl.onStepCancel,
              child: Text(hide == true ? '' :'CANCEL'),
            ),
          ],
        );
      },
      onStepCancel: () {
        setState(() {
          _currentStep = 0;
        });
      },
      onStepContinue: () {
        setState(() {
          _currentStep++;
        });
      },
      onStepTapped: (currentStep) {
        setState(() {
          _currentStep = currentStep;
        });
      },
    );
  }

  List<Step> stepList = <Step>[
    Step(
      title: Text("Title - 1"),
      subtitle: Text("Subtitle - 1"),
      content: Text("Content - 1"),
      state: StepState.editing,
      isActive: true,
    ),
    Step(
      title: Text("Title - 2"),
      subtitle: Text("Subtitle - 2"),
      content: Text("Content - 2"),
      state: StepState.editing,
      isActive: true,
    ),
    Step(
      title: Text("Title - 3"),
      subtitle: Text("Subtitle - 3"),
      content: Text("Content - 3"),
      state: StepState.editing,
      isActive: true,
    ),
    Step(
      title: Text("Title - 4"),
      subtitle: Text("Subtitle - 4"),
      content: Text("Content - 4"),
      state: StepState.complete,
      isActive: true,
    ),
  ];
}
