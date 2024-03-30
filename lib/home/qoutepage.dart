


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quote/home/qoutepageC.dart';
import 'package:quote/sharedC.dart';

class Qoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return QoutePage();
  }

}

class QoutePage extends State<Qoute> with WidgetsBindingObserver{


  var c= Get.put(QoutePageC());

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        print('Back to app');
        break;
      case AppLifecycleState.paused:
        print('App minimised or Screen locked');
        //SystemNavigator.pop();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (BuildContext context) => Qoute()),
            ModalRoute.withName('/')
        );

        break;
      case AppLifecycleState.detached:
      // TODO: Handle this case.
        print('detached');
      //print('App minimised or Screen locked');
        break;

      case AppLifecycleState.inactive:
      // TODO: Handle this case.
        print('inactive');
      //print('App minimised or Screen locked');

        break;

      case AppLifecycleState.hidden:
      // TODO: Handle this case.
        print('hidden');


      //print('App minimised or Screen locked');
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Get.find<SharedPreff>().height/30,
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
           Column(
             children: [
               IconButton(onPressed:(){
                 Get.find<QoutePageC>().destroy(context);
               }, icon: Icon(Icons.delete,size: 30,)
               ),
               Flexible(child: Text("Delete my account".toUpperCase(),style: TextStyle(
                   fontSize: 15,
                   color: Theme.of(context).hintColor,
                   fontWeight: FontWeight.w900,
                   fontStyle: FontStyle.italic,
                   fontFamily: 'money'


               ),),)

             ],
           )
        ],
      ),
      body: Container(
         child: SafeArea(

             child: SingleChildScrollView(
               child: Column(
                 children: [
                   Obx(() =>

                   Column(
                       children:List.generate(Get.find<QoutePageC>().quotes.length, (index) {

                         return   QBox(Get.find<QoutePageC>().quotes[index]);
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
                          child: Text("Enter Code",style: TextStyle(
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
                              controller: Get.find<QoutePageC>().pass,
                              keyboardType: TextInputType.phone,
                              decoration:  InputDecoration(
                                  hintText: "Default code:123456",
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
                                  Get.find<QoutePageC>().verifyMagic(context);

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
class QBox extends StatelessWidget{
  var data;
  // int bgColor;
  // String vin;
  // String chat_head;
  // var function;

  QBox(this.data);

  //String specialized;
  //int rating;



  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    // TODO: implement build
    return  Container(
      child:Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Container(

            //height: height/6,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 10,right: 10),
            padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child:  Text('\''+data['quote']+'\'',style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w900,
                  // fontStyle: FontStyle.italic,
                  fontFamily: 'money'


              ),),
            ),
            decoration:  BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor,width: 2),
              color:  Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15)),


            ),
          ),
          Container(
            child:  Align(
              alignment: Alignment.center,
              child:  Text("-"+data['by'],style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w900,
                  // fontStyle: FontStyle.italic,
                  fontFamily: 'money'


              ),),
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ) ,
    );
  }

}
