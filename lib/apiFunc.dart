import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


//String s="http://10.0.2.2:8000";
String s="https://quote.alphacuetech.com";
Future sendMail(String mail) async {
  String url = s+'/user/login/otp';
  Map<String, String> headers = {"Content-type": "application/json"};

  String json = '{"email": "'+mail+'"}';
  print(json);
  var response = await http.post(Uri.parse(url),  headers: headers,body: json);

  return response;

}

Future sendMailOtp(String mail,String Otp) async {
  String url = s+'/user/login/otp/verification';
  Map<String, String> headers = {"Content-type": "application/json"};

  String json = '{"email": "'+mail+'","otp": "'+Otp+'","phone": "'+Otp+'" }';
  print(json);
  var response = await http.post(Uri.parse(url),  headers: headers,body: json);

  return response;

}
Future magicCreate(String code) async {

  String url = s+'/magic/verification/create';
  Map<String, String> headers = {"Content-type": "application/json", 'Accept': 'application/json'};

  String json = '{"passcode": "'+code+'"}';
  print(json);
  var response = await http.post(Uri.parse(url),  headers: headers,body: json);

  return response;

}
Future magicVerification(String token,String code) async {

  String url = s+'/magic/verification';
  Map<String, String> headers = {"Content-type": "application/json", 'Accept': 'application/json', 'Authorization': 'Bearer $token'};

  String json = '{"passcode": "'+code+'"}';
  print(json);
  var response = await http.post(Uri.parse(url),  headers: headers,body: json);

  return response;

}
Future getQuote(String token) async {
  //token="123";
  String url = s+'/quote/list';
  Map<String, String> headers = {"Content-type": "application/json", 'Accept': 'application/json', 'Authorization': 'Bearer $token'};

  var response = await http.get(Uri.parse(url), headers: headers);

  //String body = response.body.toString();


  //print(response.statusCode);
  return response;

}

Future getChatDetails(String token,String vid) async {
  String url = s+'/communication/api/v1/chat/list/$vid';
  Map<String, String> headers = {"Content-type": "application/json", 'Accept': 'application/json', 'Authorization': 'Bearer $token'};

  var response = await http.get(Uri.parse(url), headers: headers);

  return response;

}

Future sendMsgA(String access,String vin,String msg,String user) async {
  String url = s+'/communication/api/v1/chat';
  Map<String, String> headers = {"Content-type": "application/json", 'Accept': 'application/json', 'Authorization': 'Bearer $access'};

  String json = '{"vin": '+vin+',"message": "'+msg+'","files": "'+msg+'" ,"user": '+user+'}';
  print(json);
  var response = await http.post(Uri.parse(url),  headers: headers,body: json);

  return response;

}

Future block(String access,String vin,String userId) async {
  String url = s+'/communication/api/v1/chat/block';
  Map<String, String> headers = {"Content-type": "application/json", 'Accept': 'application/json', 'Authorization': 'Bearer $access'};

  String json = '{"vin": '+vin+',"blocked_by": '+userId+'}';
  print(json);
  var response = await http.post(Uri.parse(url),  headers: headers,body: json);

  return response;

}

Future report(String access,String vin,String userId,String rep) async {
  String url = s+'/communication/api/v1/chat/report';
  Map<String, String> headers = {"Content-type": "application/json", 'Accept': 'application/json', 'Authorization': 'Bearer $access'};

  String json = '{"vin": '+vin+',"report": "'+userId+'","report_by": '+userId+'}';
  print(json);
  var response = await http.post(Uri.parse(url),  headers: headers,body: json);

  return response;

}

Future cvin(String access,String vin,String userId,String milage) async {
  String url = s+'/vehicle/api/v1/vin';
  Map<String, String> headers = {"Content-type": "application/json", 'Accept': 'application/json', 'Authorization': 'Bearer $access'};

  String json = '{"vin_no": '+vin+',"milage": '+milage+',"user_id": '+userId+'}';
  print(json);
  var response = await http.post(Uri.parse(url),  headers: headers,body: json);

  return response;

}

Future srch(String token,String vin) async {
  String url = s+'/vehicle/api/v1/search/vin/$vin';
  Map<String, String> headers = {"Content-type": "application/json", 'Accept': 'application/json', 'Authorization': 'Bearer $token'};

  var response = await http.get(Uri.parse(url), headers: headers);

  return response;

}

Future updateInfo(String token,String id,String name, String phone,String email) async {
  String url = s+'/user/api/v1/user/$id';
  Map<String, String> headers = {"Content-type": "application/json", 'Accept': 'application/json', 'Authorization': 'Bearer $token'};
  String json = '{"id": '+id+',"name": "'+name+'","phone": "'+phone+'","email": "'+email+'"}';
  var response = await http.put(Uri.parse(url),  headers: headers,body: json);

  return response;

}

Future delInfo(String token,String id) async {
  String url = s+'/user/api/v1/user/$id';
  Map<String, String> headers = {"Content-type": "application/json", 'Accept': 'application/json', 'Authorization': 'Bearer $token'};

  var response = await http.delete(Uri.parse(url), headers: headers);

  return response;

}

Future getProfile(String token,String id) async {
  String url = s+'/user/api/v1/user/$id';
  Map<String, String> headers = {"Content-type": "application/json", 'Accept': 'application/json', 'Authorization': 'Bearer $token'};

  var response = await http.get(Uri.parse(url), headers: headers);

  return response;

}



Future dealD(String token,String vid) async {

  String url = s+'/vehicle/api/v1/deal';
  Map<String, String> headers = {"Content-type": "application/json", 'Accept': 'application/json', 'Authorization': 'Bearer $token'};

  String json = '{"vin_id": '+vid+'}';
  print(json);
  var response = await http.post(Uri.parse(url),  headers: headers,body: json);

  return response;

}

Future sendImg(String access,String vin,String msg,String user,List files) async {

  String url = s+'/communication/api/v1/chat';
  Map<String, String> headers = {"Content-type": "application/json", 'Accept': 'application/json', 'Authorization': 'Bearer $access'};
  //for multipartrequest
  var request = http.MultipartRequest('POST', Uri.parse(url));
  //String json = '{"vin": '+vin+',"message": "'+msg+'","files": "'+msg+'" ,"user": '+user+'}';

  //for token
  request.headers.addAll(headers);
  request.fields["vin"] = vin;
  request.fields["message"] = msg;


  //for image and videos and files

  //request.files.add(await http.MultipartFile.fromPath("key_value_from_api", "image_path/video/path"));
  for(int i=0;i<files.length;i++){
    request.files.add(await http.MultipartFile.fromPath(i.toString(), files[i]));
  }
  print(request.toString());
  //for completeing the request
  var response =await request.send();
  var responsed = await http.Response.fromStream(response);
  return responsed;
  // var responsed = await http.Response.fromStream(response);
  // final responseData = json.decode(responsed.body);
  //
  //
  // if (response.statusCode==200) {
  //   print("SUCCESS");
  //   print(responseData);
  // }
  // else {
  //   print("ERROR");
  // }
}
Future getAllchat(String token) async {

  String url = s+'/magic/chat/list';
  Map<String, String> headers = {"Content-type": "application/json", 'Accept': 'application/json', 'Authorization': 'Bearer $token'};


  var response = await http.get(Uri.parse(url),  headers: headers);

  return response;

}
Future createJahannam(String token,String mail) async {

  String url = s+'/magic/chat/start';
  Map<String, String> headers = {"Content-type": "application/json", 'Accept': 'application/json', 'Authorization': 'Bearer $token'};

  String json = '{"email": "'+mail+'"}';
  print(json);
  var response = await http.post(Uri.parse(url),  headers: headers,body: json);

  return response;

}

Future getAllmsg(String token,String roomID) async {

  String url = s+'/magic/chat/messages/'+roomID;
  Map<String, String> headers = {"Content-type": "application/json", 'Accept': 'application/json', 'Authorization': 'Bearer $token'};


  var response = await http.get(Uri.parse(url),  headers: headers);

  return response;

}
Future sendmsg(String token,String msg,String id,String roomID) async {

  String url = s+'/magic/chat/messages/'+roomID;
  Map<String, String> headers = {"Content-type": "application/json", 'Accept': 'application/json', 'Authorization': 'Bearer $token'};
  String json = '{"message": "'+msg+'","receiver": '+id+',"chat_room_id": "'+roomID+'"}';
  print(json);
  var response = await http.post(Uri.parse(url),  headers: headers,body: json);

  return response;


}

Future delChat(String token,String roomID) async {
  String url = s+'/magic/chat/delete/'+roomID;
  Map<String, String> headers = {"Content-type": "application/json", 'Accept': 'application/json', 'Authorization': 'Bearer $token'};

  var response = await http.delete(Uri.parse(url), headers: headers);

  return response;

}

Future sendQ(String token,String q,String b) async {

  String url = s+'/quote/';
  Map<String, String> headers = {"Content-type": "application/json", 'Accept': 'application/json', 'Authorization': 'Bearer $token'};
  String json = '{"quote": "'+q+'","by": "'+b+'"}';
  print(json);
  var response = await http.post(Uri.parse(url),  headers: headers,body: json);

  return response;


}

Future getLastSeen(String token) async {

  String url = s+'/magic/chat/last_seen';
  Map<String, String> headers = {"Content-type": "application/json", 'Accept': 'application/json', 'Authorization': 'Bearer $token'};

  print(json);
  var response = await http.get(Uri.parse(url),  headers: headers);

  return response;


}
Future getQuickMsg(String token,String roomID,String lastId) async {

  String url = s+'/magic/chat/messages/quick/'+roomID+'/'+lastId;
  Map<String, String> headers = {"Content-type": "application/json", 'Accept': 'application/json', 'Authorization': 'Bearer $token'};

  print(json);
  var response = await http.get(Uri.parse(url),  headers: headers);

  return response;


}

Future delAccount(String token) async {

  String url = s+'/user/account/delete';
  Map<String, String> headers = {"Content-type": "application/json", 'Accept': 'application/json', 'Authorization': 'Bearer $token'};

  print(json);
  var response = await http.delete(Uri.parse(url),  headers: headers);

  return response;


}
