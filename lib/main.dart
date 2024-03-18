import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote/bindings.dart';
import 'package:quote/home/qoutepage.dart';
import 'package:quote/logn/login.dart';
import 'package:quote/sharedC.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  runApp( MyAPP());

}
class MyAPP extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyApp();
  }

}
class MyApp extends State<MyAPP>  {
  var c=Get.put(SharedPreff());

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

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
      (Get.find<SharedPreff>().sharedpreff.read('access')==null)?
      Login():
      Qoute()

    );
  }

}