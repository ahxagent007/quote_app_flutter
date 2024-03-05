
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:quote/logn/loginC.dart';

class Login extends StatelessWidget{
  var c=Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: Get.find<LoginController>().height,
        color: Theme.of(context).canvasColor,
        child: SafeArea(
          child: Container(

            padding: EdgeInsets.all(10),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Flexible(
                      flex: 6,
                      child:  SizedBox(
                        height: Get.find<LoginController>().height/40,
                        child: TextFormField(
                          controller: Get.find<LoginController>().mail,
                          keyboardType: TextInputType.text,
                          decoration:  InputDecoration(

                              prefixIcon: Icon(Icons.mail,color: Theme.of(context).primaryColor,),


                              // labelText: "Phone Number",
                              hintText: "Email".toUpperCase(),
                              labelStyle: TextStyle(
                                  color: Theme.of(context).hintColor,
                                  fontFamily: 'money'
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2.0),
                                borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)),

                              ),
                              hintStyle: TextStyle(
                                  color: Theme.of(context).hintColor
                              ),
                              border:  OutlineInputBorder(
                                borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2.0),
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                              filled: true,
                              fillColor: Colors.white
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(() =>  Get.find<LoginController>().savePress==false?
                SizedBox(

                    width: double.infinity,
                    //height: c.height/60,
                    child:  ElevatedButton(

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,

                          shape: StadiumBorder(),
                          shadowColor: Colors.black,


                        ),
                        onPressed: () async{
                          FocusManager.instance.primaryFocus?.unfocus();
                          //print(c.phn.text);

                          //Get.find<LoginController>().checkAccount();
                          //Get.find<LoginController>().savePress.value=false;
                          //Navigator.of(context).pop();
                          //Get.delete<LoginController>();
                          //Get.to(()=>Password());
                          //Get.to(()=>Registration());
                          //Get.to(()=>Otp());
                          Get.find<LoginController>().reqOtp();

                        },
                        child: Text("verify".toUpperCase(),style: TextStyle(color:Theme.of(context).hintColor,fontFamily: 'money', fontSize: 20),)
                    )
                ):
                LoadingAnimationWidget.staggeredDotsWave(
                  color: Theme.of(context).primaryColor,
                  size: 50,
                ),)


              ],
            ),
          ),
        ),
      ),

    );
  }

}