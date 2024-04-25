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
        primaryColor: Color.fromRGBO(145, 236, 70,1),
        canvasColor: Color.fromRGBO(21, 22, 26,1),
        hintColor: Color.fromRGBO(0, 0,0,1),
        cardColor: Color.fromRGBO(247, 247, 247,1),
      ),

      home:
      (Get.find<SharedPreff>().sharedpreff.read('access')==null)?
      Login():
      Qoute()

    );
  }

}