

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote/apiFunc.dart';
import 'package:quote/chat/chatdetails.dart';
import 'package:quote/sharedC.dart';

class chatlistC extends GetxController{
  var chats=[].obs;
  TextEditingController mail=TextEditingController();
  var selectedJahannam;
  var selectedReceiver;
  var selectedSender;
  Timer? timer;

  void onInit() {


    getAllChatlist();

    timer=Timer.periodic(Duration(seconds: 2), (Timer t) {
      getAllChatlist();
    });

  }
  void getAllChatlist(){
   getAllchat(Get.find<SharedPreff>().sharedpreff.read('access').toString()).then((value) {
     if(value.statusCode==401){

     }
     else{
       String body = value.body.toString();
       var d=jsonDecode(body);
       //fetch.valu
       print(d);
       chats.value= (d != null ? List.from(d["chat_rooms"]) : null)!;
     }


    });
  }

  void newJahannam(){
    createJahannam(Get.find<SharedPreff>().sharedpreff.read('access').toString(),mail.text.toString()).then((value) {
      if(value.statusCode==200){
        var d=jsonDecode(value.body.toString());
        print(d);
        getAllChatlist();
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



  void deleteJahannam(String roomID){

    delChat(Get.find<SharedPreff>().sharedpreff.read('access').toString(),roomID).then((value) {
      if(value.statusCode==200){
        var d=jsonDecode(value.body.toString());
        print(d);
        getAllChatlist();
        Get.snackbar(

          "Attention",
          "Deleted".toUpperCase(),
          backgroundColor: Colors.white,
          snackPosition: SnackPosition.BOTTOM,

        );
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

  void toSpecJahnnam(String roomID,String rec){
    selectedJahannam=roomID;
    selectedReceiver=rec;
    Get.to(()=>chatDetails());
  }
}