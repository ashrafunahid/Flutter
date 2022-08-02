import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:timer_count_down/timer_controller.dart';

class HomeController extends GetxController{

  CountdownController countdownController = CountdownController();
  TextEditingController textEditingController = TextEditingController();

  var messageOTPCode = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print(SmsAutoFill().getAppSignature);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    countdownController.start();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    textEditingController.dispose();
    SmsAutoFill().unregisterListener();
  }

}