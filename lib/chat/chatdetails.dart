

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote/chat/chatdetailsC.dart';
import 'package:quote/sharedC.dart';

class chatDetails extends StatelessWidget{

  var c= Get.put(chatdetailsC());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).hintColor,
        leading: Container(),

        title: Column(
          children: [
            Text("Magic".toUpperCase(),style: TextStyle(
                fontSize: 25,
                color: Theme.of(context).hintColor,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
                fontFamily: 'money'


            ),),
            Obx(() =>
                Text(Get.find<chatdetailsC>().lastseen.value.toUpperCase(),style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).hintColor,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'money'


                ),)
            )
          ],
        ),

        actions: [

        ],
      ),
      body:  SafeArea(

          child: Column(
            children: [
              Obx(() => Expanded(
                flex: 8,
                child: SingleChildScrollView(
                  reverse: true,
                  child: Column(
                      children: List.generate(Get.find<chatdetailsC>().chatsDet.value.length, (index){
                        print(Get.find<SharedPreff>().sharedpreff.read('id'));
                        print("sdsd");
                        print(Get.find<chatdetailsC>().chatsDet.value[index]['user']);
                        return Column(
                          children: [
                            SizedBox(height: 10,),
                            Align(
                              alignment:Get.find<SharedPreff>().sharedpreff.read('id')==Get.find<chatdetailsC>().chatsDet.value[index]['sender']? Alignment.centerRight:Alignment.centerLeft,
                              child: ChatBox(Get.find<chatdetailsC>().chatsDet.value[index]),
                            ),

                            SizedBox(height: 10,),
                          ],
                        );
                      },
                      )
                  ),
                ),

              ),),
              Expanded(
                flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(left: 2,right: 10),
                    width: Get.find<SharedPreff>().width,
                    height: Get.find<SharedPreff>().height/28,
                    color: Theme.of(context).primaryColor,
                    child: Row(
                      children: [


                        Flexible(
                          flex:8,
                          child: TextFormField(
                            controller: Get.find<chatdetailsC>().msg,

                            keyboardType: TextInputType.multiline,
                            decoration:  InputDecoration(




                              //labelText: "Phone Number",
                                hintText: "Type Here",
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
                        ),
                        Flexible(
                          flex:1,
                          child:  IconButton(
                            alignment: Alignment.centerLeft,
                            icon:  Icon(Icons.send,color: Colors.white,size: 28,),
                            onPressed: () async{
                              Get.find<chatdetailsC>().sendMsg();
                              // final List<Album> imageAlbums = await PhotoGallery.listAlbums();
                              // Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  )
              )
            ],
          ),

      ),
    );
  }

}
class ChatBox extends StatelessWidget{


  //String specialized;
  //int rating;
  var data;
  var t;

  ChatBox(this.data);

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    // final dt1 = DateTime.tryParse(data['created_date_time']);
    // print(data['files']);
    //
    // t=dt1!.hour.toString()+":"+dt1!.minute.toString();

    // TODO: implement build
    return  GestureDetector(
      onTap: (){


      },
      child:  Container(
        width: width/2,
        //height: height/6,
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: 10,right: 10),
        padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
        child:

        Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child:  Text(data['message'],style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).hintColor,
                  fontWeight: FontWeight.w900,
                  // fontStyle: FontStyle.italic,
                  fontFamily: 'money'


              ),),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child:  Text(data['created_time'],style: TextStyle(
                  fontSize: 10,
                  color: Theme.of(context).hintColor,
                  fontWeight: FontWeight.w900,
                  // fontStyle: FontStyle.italic,
                  fontFamily: 'money'


              ),),
            ),


          ],
        ) ,

        decoration:  BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 2,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],

        ),
      ),
    );
  }

}