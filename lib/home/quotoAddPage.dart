

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote/home/qoutepageC.dart';

class QuotoAdd extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).hintColor,
        leading: Container(),
        title: Text("Quotes".toUpperCase(),style: TextStyle(
            fontSize: 30,
            color: Theme.of(context).hintColor,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
            fontFamily: 'money'


        ),),
        actions: [

        ],
      ),
      body: Container(
        child: SafeArea(

          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: Get.find<QoutePageC>().quot,
                  keyboardType: TextInputType.phone,

                  decoration:  InputDecoration(

                    // prefixIcon: Icon(Icons.call,color: Theme.of(context).primaryColor,),



                      hintText: "Quoto",
                      labelStyle: TextStyle(
                          color: Theme.of(context).hintColor,
                          fontFamily: 'money'
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(20)),

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
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: Get.find<QoutePageC>().by,
                  keyboardType: TextInputType.phone,

                  decoration:  InputDecoration(

                    // prefixIcon: Icon(Icons.call,color: Theme.of(context).primaryColor,),



                      hintText: "confirm new password",
                      labelStyle: TextStyle(
                          color: Theme.of(context).hintColor,
                          fontFamily: 'money'
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(20)),

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


                ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: StadiumBorder(),
                      shadowColor: Colors.black,


                    ),
                    onPressed: () async{

                      Get.find<QoutePageC>().saveQouto();
                      Get.back();

                    },
                    child: Text("ok",style: TextStyle(color:Theme.of(context).hintColor,fontFamily: 'money', fontSize: 20),)
                )

              ],
            ),
          ),
        ),
      ),


    );
  }

}