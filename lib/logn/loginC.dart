import 'dart:convert';


import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote/apiFunc.dart';
import 'package:quote/logn/otp.dart';
import 'package:quote/sharedC.dart';

class LoginController extends GetxController{
  late BuildContext context;
  final countryPicker =FlCountryCodePicker();
  var countryCode= CountryCode(name: "Canada", code: "CA", dialCode: "+1").obs;
  TextEditingController mail=TextEditingController();
  var savePress=false.obs ;



  double width = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width.toDouble();
  double height = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.height.toDouble();

  LoginController();

  @override
  void onInit() {
    print("sd");
    //magicVerificationCreate();
  }

  void reqOtp(){
    Get.find<SharedPreff>().mail=mail.text.toString();
    if(Get.find<SharedPreff>().mail.length<3){
      Get.snackbar(

        "Attention",
        "Check Your Network".toUpperCase(),
        backgroundColor: Get.theme.hintColor,
        snackPosition: SnackPosition.BOTTOM,

      );
    }
    else{
      Get.find<LoginController>().savePress.value=true;
      print(Get.find<SharedPreff>().mail);
      print(Get.find<SharedPreff>().mail);
      sendMail(Get.find<SharedPreff>().mail).then((value) {
        if(value.statusCode==200){
          String body = value.body.toString();
          var d=jsonDecode(body);
          print(d);

          Get.find<LoginController>().savePress.value=false;
          Get.to(()=>Otp());

        }
        else{
          Get.snackbar(

            "Attention",
            "Something went wrong".toUpperCase(),
            backgroundColor: Get.theme.hintColor,
            snackPosition: SnackPosition.BOTTOM,

          );
        }





      });


    }


  }
  void magicVerificationCreate(){
    magicCreate("123456").then((value) {
      String body = value.body.toString();
      var d=jsonDecode(body);
      print(d);
    });
  }
}