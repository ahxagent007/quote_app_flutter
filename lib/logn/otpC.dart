

import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote/apiFunc.dart';
import 'package:quote/home/qoutepage.dart';
import 'package:quote/sharedC.dart';

class OtpController extends GetxController{
  TextEditingController otp=TextEditingController();
  var savePress=false.obs ;
  double width = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width.toDouble();
  double height = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.height.toDouble();

  OtpController();

  @override
  void onInit() {
    print("sd");
  }

  void otpCheck(){
    savePress.value=true;
    print(Get.find<SharedPreff>().mail);
    sendMailOtp(Get.find<SharedPreff>().mail, otp.text.toString()).then((value){
      if(value.statusCode==200){
        String body = value.body.toString();
        var d=jsonDecode(body);
        print('eijjjjjjjjjjjjjjjjjjjjjjjjj'+d.toString());
        savePress.value=false;
        if(d['msg']=='Wrong OTP'){
          Get.snackbar(
            "Attention",
            "Wrong Otp".toUpperCase(),
            backgroundColor: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
          );

        }
        else{
          Get.find<SharedPreff>().sharedpreff.write('access', d['access']);
          Get.find<SharedPreff>().sharedpreff.write('id', d['user']['id']);
          Get.to(()=>QoutePage());
        }


      }
      else{
        Get.snackbar(

          "Attention",
          "Something went wrong".toUpperCase(),
          backgroundColor: Colors.white,
          snackPosition: SnackPosition.BOTTOM,

        );
      }


    });


  }

  // void otpCheck(){
  //   savePress.value=true;
  //   //print(Get.find<SharedPreff>().phn);
  //   Get.to(()=>QoutePage());
  //
  // }

}