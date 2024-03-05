

import 'package:get/get.dart';
import 'package:quote/sharedC.dart';

class Allbindings extends Bindings{
  @override
  void dependencies() {
    //Get.lazyPut(() => LoginController());
    Get.put(() => SharedPreff());
  }

}