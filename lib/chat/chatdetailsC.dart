

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote/apiFunc.dart';
import 'package:quote/chat/chatlistC.dart';
import 'package:quote/sharedC.dart';

class chatdetailsC extends GetxController{
  var chatsDet=[].obs;
  var chatTemp=[];
  var lastseen="".obs;
  var sendmsgW=false.obs;
  var lastmsgId="".obs;
  TextEditingController msg=TextEditingController();
  Timer? timer;
  void onInit(){
      print('eijjjjj'+Get.find<chatlistC>().selectedJahannam);
      getAllMsg();


      timer=Timer.periodic(Duration(seconds: 2), (Timer t) {
        //getAllMsg();
        getquickMSG();
      });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    lastSeen();
    timer?.cancel();
  }

  void getAllMsg(){
    getAllmsg(Get.find<SharedPreff>().sharedpreff.read('access').toString(),Get.find<chatlistC>().selectedJahannam).then((value) {
      if(value.statusCode==200){
        String body = value.body.toString();
        var d=jsonDecode(body);
        //print(d);
        lastseen.value=d["last_seen"];
        chatsDet.value= (d != null ? List.from(d["chats"]) : null)!;
        print(chatsDet.value[chatsDet.value.length-1]['id']);
        lastmsgId.value=chatsDet.value[chatsDet.value.length-1]['id'].toString();

      }
      else{
        String body = value.body.toString();
        var d=jsonDecode(body);
        print(d);
        Get.snackbar(

          "Attention",
          "Something went wrong".toUpperCase(),
          backgroundColor: Colors.white,
          snackPosition: SnackPosition.BOTTOM,

        );
      }
    });


  }
  void getquickMSG(){
    getQuickMsg(Get.find<SharedPreff>().sharedpreff.read('access').toString(),Get.find<chatlistC>().selectedJahannam,lastmsgId.value.toString()).then((value) {
      if(value.statusCode==200){
        String body = value.body.toString();
        var d=jsonDecode(body);
        print(d);
        //lastseen.value=d["last_seen"];
        //chatsDet.value= (d != null ? List.from(d["chats"]) : null)!;
        chatTemp=(d != null ? List.from(d["chats"]) : null)!;
        if (chatTemp.length>0){
          lastmsgId.value=chatTemp[chatTemp.length-1]['id'].toString();
          chatsDet.value.add(chatTemp);
        }
      }
      else{
        String body = value.body.toString();
        var d=jsonDecode(body);
        print(d);
        Get.snackbar(

          "Attention",
          "Something went wrong".toUpperCase(),
          backgroundColor: Colors.white,
          snackPosition: SnackPosition.BOTTOM,

        );
      }
    });

  }

  void sendMsg(){
    String s=msg.text.toString();
    msg.text="";
    sendmsgW.value=true;
    sendmsg(Get.find<SharedPreff>().sharedpreff.read('access').toString(),s,Get.find<chatlistC>().selectedReceiver, Get.find<chatlistC>().selectedJahannam).then((value) {
      if(value.statusCode==200){
        String body = value.body.toString();
        var d=jsonDecode(body);
        print(d);


        getAllMsg();
        sendmsgW.value=false;
      }
      else{
        String body = value.body.toString();
        var d=jsonDecode(body);
        print(d);
        msg.text="";
        Get.snackbar(

          "Attention",
          "Something went wrong".toUpperCase(),
          backgroundColor: Colors.white,
          snackPosition: SnackPosition.BOTTOM,

        );
        sendmsgW.value=false;
      }
    });
  }
  void lastSeen(){
    getLastSeen(Get.find<SharedPreff>().sharedpreff.read('access').toString()).then((value) {
      if(value.statusCode==200){
        String body = value.body.toString();
        var d=jsonDecode(body);
        print(d);



      }
      else{
        String body = value.body.toString();
        var d=jsonDecode(body);
        print(d);
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