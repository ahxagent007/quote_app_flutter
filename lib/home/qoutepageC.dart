
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote/apiFunc.dart';
import 'package:quote/chat/chatlist.dart';
import 'package:quote/home/quotoAddPage.dart';
import 'package:quote/sharedC.dart';

class QoutePageC extends GetxController{

  var quotes=[].obs;
  TextEditingController pass=TextEditingController();
  TextEditingController quot=TextEditingController();
  TextEditingController by=TextEditingController();
  void onInit() {

    //print(Get.find<SharedPreff>().phn);

    //print(Get.find<HomeController>().tab.value);


    getAllq();


  }
  void getAllq(){
    getQuote(Get.find<SharedPreff>().sharedpreff.read('access').toString()).then((value) {
      if(value.statusCode==401){

      }
      else{
        String body = value.body.toString();
        var d=jsonDecode(body);
        //fetch.value=true;
         print(d);
        quotes.value= (d != null ? List.from(d["quotes"]) : null)!;
      }

      print(quotes.value[0]['quote']);

    });
  }
  void saveQouto(){
    sendQ(Get.find<SharedPreff>().sharedpreff.read('access').toString(),quot.text.toString(),by.text.toString()).then((value) {
      if(value.statusCode==200){
        String body = value.body.toString();
        var d=jsonDecode(body);

        Get.snackbar(

          "Attention",
          "Added".toUpperCase(),
          backgroundColor: Colors.white,
          snackPosition: SnackPosition.BOTTOM,

        );

        getAllq();
        //savePress.value=false;

        // getAllchat(Get.find<SharedPreff>().sharedpreff.read('access').toString()).then((value) {
        //   String body = value.body.toString();
        //   var d=jsonDecode(body);
        //   print(d);
        // });
        //Get.to(()=>QoutePage());

      }
      else{
        String body = value.body.toString();
        var d=jsonDecode(body);
        print('eijjjjjjjjjjjjjjjjjjjjjjjjj'+d.toString());
        Get.snackbar(

          "Attention",
          "Something went wrong".toUpperCase(),
          backgroundColor: Colors.white,
          snackPosition: SnackPosition.BOTTOM,

        );
      }
    });
  }
  void verifyMagic(BuildContext context){
    magicVerification(Get.find<SharedPreff>().sharedpreff.read('access').toString(),pass.text).then((value) {
      if(value.statusCode==200){
        pass.text="";
        String body = value.body.toString();
        var d=jsonDecode(body);
        print('eijjjjjjjjjjjjjjjjjjjjjjjjj'+d['page']);
        //savePress.value=false;
        if(d['page']=='magic'){
          Get.to(()=>chatlist());
        }
        else if(d['page']=='quote'){

          Get.to(()=>QuotoAdd());
        }
        else{
          Get.snackbar(
            "Attention",
            "Wrong pass".toUpperCase(),
            backgroundColor: Colors.white,
            snackPosition: SnackPosition.BOTTOM,

          );
        }

        // getAllchat(Get.find<SharedPreff>().sharedpreff.read('access').toString()).then((value) {
        //   String body = value.body.toString();
        //   var d=jsonDecode(body);
        //   print(d);
        // });
        //Get.to(()=>QoutePage());

      }
      else{
        String body = value.body.toString();
        var d=jsonDecode(body);
        print('eijjjjjjjjjjjjjjjjjjjjjjjjj'+d.toString());
        Get.snackbar(
          "Attention",
          "Something went wrong".toUpperCase(),
          backgroundColor: Colors.white,
          snackPosition: SnackPosition.BOTTOM,

        );
      }
    });
  }
}