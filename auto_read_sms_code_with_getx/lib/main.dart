import 'package:auto_read_sms_code_with_getx/home_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';

void main() async {

  runApp(
    GetMaterialApp(
      title: "Application",
      // initialRoute: AppPages.INITIAL,
      // getPages: AppPages.routes,
      home: HomeView(),
      debugShowCheckedModeBanner: false,
    ),
  );
}