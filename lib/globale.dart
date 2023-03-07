import 'dart:convert';
import 'MainPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'InputField.dart';
import 'package:shared_preferences/shared_preferences.dart';
TextEditingController pass = TextEditingController();
TextEditingController ndoss = TextEditingController();
// User Logout Function.

logout(BuildContext context){
  Navigator.pop(context);
}
Future login(BuildContext cont) async {
  if( pass.text == "" || ndoss.text == ""){
    Fluttertoast.showToast(
      msg: "Identifiant ou mot de passe vide. ",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      fontSize: 16.0,
    );
  }
  else{
    final Uri url = Uri.parse("http://192.168.186.118/loginflutter/login.php");
    var response= await http.post(url, body :{
      "pass" : pass.text,
      "ndoss" :ndoss.text,
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('ndoss', ndoss.text);
    var data = json.decode(response.body);
    if(data== "success"){
      Navigator.push(cont, MaterialPageRoute(builder: (context) => MainPage())
      );
    }
    else{
      Fluttertoast.showToast(
        msg: "Identifiant ou mot de passe incorrect. ",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        fontSize: 16.0,

      );
    }
  }
}