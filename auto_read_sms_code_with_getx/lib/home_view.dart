import 'package:auto_read_sms_code_with_getx/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:timer_count_down/timer_count_down.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var controller = new HomeController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter SMS Code Autofill"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => PinFieldAutoFill(
              textInputAction: TextInputAction.done,
              decoration: UnderlineDecoration(
                textStyle: TextStyle(fontSize: 20, color: Colors.blueAccent),
                colorBuilder: FixedColorBuilder(Colors.transparent),
                bgColorBuilder: FixedColorBuilder(Colors.blueGrey.withOpacity(0.2)),
              ),
              controller: controller.textEditingController,
              currentCode: controller.messageOTPCode.value,
              onCodeSubmitted: (code){

              },
              onCodeChanged: (code){
                controller.messageOTPCode.value = code!;
                controller.countdownController.pause();
              },
            )),
            SizedBox(height: 30,),
            Countdown(
                seconds: 10,
                interval: Duration(milliseconds: 1000),
                build: (context, currentRemainingTime){
                  if(currentRemainingTime == 0.0){
                    return GestureDetector(
                      onTap: (){},
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            border: Border.all(color: Colors.blue, width: 1),
                            color: Colors.blue),
                        child: Text("Resend OTP"),
                      ),
                    );
                  }else{
                    return Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(20),
                      width: context.width,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        border: Border.all(color: Colors.blue, width: 1),
                      ),
                      child: Text("Please Wait |${currentRemainingTime.toString().length == 4 ? " ${currentRemainingTime.toString().substring(0, 2)}" : " ${currentRemainingTime.toString().substring(0, 1)}"}"),
                    );
                  }
                }
            ),
          ],
        ),
      ),
    );
  }
}
