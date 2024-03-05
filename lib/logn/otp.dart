
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:quote/logn/loginC.dart';
import 'package:quote/logn/otpC.dart';

class Otp extends StatelessWidget{
  var c=Get.put(OtpController());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Enter Otp".toUpperCase(),style: TextStyle(
                          fontSize: 30,
                          color: Theme.of(context).hintColor,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'money'


                      ),),
                    )
                ),
                SizedBox(
                  height: Get.find<OtpController>().height*0.05,
                ),
                Center(
                    child: PinCodeTextField(
                      controller: Get.find<OtpController>().otp,
                      keyboardType: TextInputType.number,
                      appContext: context,
                      length: 6,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          inactiveFillColor: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          selectedFillColor: Colors.white,
                          selectedColor: Theme.of(context).primaryColor,
                          activeColor: Theme.of(context).primaryColor,
                          inactiveColor: Theme.of(context).primaryColor,
                          fieldHeight: 50,
                          fieldWidth: 40,
                          activeFillColor: Colors.white,
                          borderWidth: 2
                      ),
                      animationDuration: Duration(milliseconds: 300),
                      backgroundColor: Theme.of(context).canvasColor,
                      enableActiveFill: true,
                      // errorAnimationController: errorController,
                      //controller: phoneNumberOtp,
                      onCompleted: (v) {
                        print("Completed");
                      },
                      onChanged: (value) {
                        print(value);

                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    )
                ),
                const SizedBox(height:  20),
                Obx(() =>
                Get.find<OtpController>().savePress.value==false?
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

                          //Get.to(()=>Otp());
                          Get.find<OtpController>().otpCheck();

                        },
                        child: Text("verify".toUpperCase(),style: TextStyle(color:Theme.of(context).hintColor,fontFamily: 'money', fontSize: 20),)
                    )
                ):
                Center(
                    child: LoadingAnimationWidget.staggeredDotsWave(
                      color: Theme.of(context).primaryColor,
                      size: 50,
                    )
                )
                )

                // Visibility(
                //     //visible: otpEnterButtonPress,
                //     child:  Center(
                //       child: LoadingAnimationWidget.staggeredDotsWave(
                //         color: Theme.of(context).primaryColor,
                //         size: 50,
                //       ),
                //     )
                // )
              ],
            ),
          ),

        )
    )
    ;

  }



}
