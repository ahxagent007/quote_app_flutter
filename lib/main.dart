import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote/bindings.dart';
import 'package:quote/logn/login.dart';
import 'package:quote/sharedC.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  runApp( MyApp());
}

class MyApp extends StatelessWidget{
  var c=Get.put(SharedPreff());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetMaterialApp(
      initialBinding:  Allbindings(),
      theme: ThemeData(
        primaryColor: Color.fromRGBO(255, 153,132,1),
        canvasColor: Color.fromRGBO(18, 19,19,1),
        hintColor: Color.fromRGBO(0, 0,0,1),
      ),

      home:
      ///(Get.find<SharedPreff>().sharedpreff.read('access')==null)?
      Login()

    );
  }

}