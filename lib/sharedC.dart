import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
class SharedPreff extends GetxService{
  var id="";
  var role="";

  var mail="";
  var name="".obs;
  final sharedpreff = GetStorage();
  double width = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width.toDouble();
  double height = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.height.toDouble();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("hhhjh");
  }
}