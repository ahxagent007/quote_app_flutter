
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote/chat/chatlistC.dart';
import 'package:quote/sharedC.dart';


class chatlist extends StatelessWidget{
  var c= Get.put(chatlistC());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).hintColor,
        leading: Container(),
        title: Text("Magic".toUpperCase(),style: TextStyle(
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
                Obx(() =>

                    Column(
                        children:List.generate(Get.find<chatlistC>().chats.length, (index) {

                          return   chat(Get.find<chatlistC>().chats[index]);
                        })

                    )

                ),

              ],
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
          child: Center(
            child: Icon(Icons.add),
          ),
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Theme.of(context).canvasColor,
          elevation: 2,
          highlightElevation: 5,
          onPressed: (){
            showDialog(
                context: context,
                barrierColor: Colors.grey.shade400.withOpacity(0.8),
                builder: (context1) {


                  return AlertDialog(
                      backgroundColor: Theme.of(context).canvasColor,
                      clipBehavior: Clip.antiAlias,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      title: const Center(
                          child: Text("Enter Mail",style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(255, 153,132,1),
                              fontWeight: FontWeight.w900,
                              // fontStyle: FontStyle.italic,
                              fontFamily: 'money'


                          ),)),
                      content:Container(
                        height: Get.find<SharedPreff>().height/15,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: Get.find<chatlistC>().mail,
                              keyboardType: TextInputType.emailAddress,
                              decoration:  InputDecoration(
                                  hintText: "mail",
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
                                  Navigator.of(context).pop();
                                  Get.find<chatlistC>().newJahannam();

                                },
                                child: Text("ok",style: TextStyle(color:Theme.of(context).hintColor,fontFamily: 'money', fontSize: 20),)
                            )
                          ],
                        ),

                      )
                  );
                });
          }
      ),
    );
  }

}




class chat extends StatelessWidget{
  var data;

  chat(this.data);

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    // TODO: implement build
    return  GestureDetector(
      onTap: (){
        Get.find<chatlistC>().toSpecJahnnam(data['room_id'],data['chat_user']['id'].toString() );
      },
      child: Container(
        padding: EdgeInsets.only(left: 10,right: 10),
        child:Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Icon(Icons.account_circle_outlined,color: Theme.of(context).primaryColor,size: width/6),
                Expanded(child: Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 10,right: 10),
                  padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child:  Text(data['chat_user']['email'],style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w900,
                      // fontStyle: FontStyle.italic,



                    ),),
                  ),
                  decoration:  BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor,width: 2),
                    color:  Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),


                  ),
                )),
                IconButton(onPressed: (){
                  showDialog(
                      context: context,
                      barrierColor: Colors.grey.shade400.withOpacity(0.8),
                      builder: (context) {
                        TextEditingController distance=TextEditingController();
                        String distancetype="miles";
                        return AlertDialog(
                            backgroundColor: Theme.of(context).canvasColor,
                            clipBehavior: Clip.antiAlias,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            title: const Center(
                                child: Text(
                                  'ARE YOU SURE?',
                                  textAlign: TextAlign.center,
                                )),
                            content:Container(
                              // height: height/4,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [

                                  ElevatedButton(

                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Theme.of(context).primaryColor,
                                        shape: StadiumBorder(),
                                        shadowColor: Colors.black,


                                      ),
                                      onPressed: () async{
                                        Navigator.pop(context);
                                        Get.find<chatlistC>().deleteJahannam(data['room_id']);

                                      },
                                      child: Text("Yes",style: TextStyle(color:Theme.of(context).hintColor,fontFamily: 'money', fontSize: 20),)
                                  ),
                                  ElevatedButton(

                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Theme.of(context).primaryColor,
                                        shape: StadiumBorder(),
                                        shadowColor: Colors.black,


                                      ),
                                      onPressed: () async{
                                        Navigator.pop(context);

                                      },
                                      child: Text("No",style: TextStyle(color:Theme.of(context).hintColor,fontFamily: 'money', fontSize: 20),)
                                  )


                                ],
                              ),
                            )
                        );
                      });

                }, icon: Icon(Icons.delete,color: Theme.of(context).primaryColor,size: width/10))
                ,
              ],
            ),


            SizedBox(
              height: 5,
            ),
          ],
        ) ,
      ),
    );
  }

}
