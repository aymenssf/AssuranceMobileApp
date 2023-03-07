import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'globale.dart';


class InputField extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Color(0xFF004A93),)
              )
          ),
          child: TextField(
            controller: ndoss ,
            decoration: InputDecoration(
                hintText: "Identifiant",
                hintStyle: TextStyle(color: Colors.black54),
                border: InputBorder.none
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Color(0xFF004A93),)
              )
          ),
          child: TextField(
            controller: pass,
            obscureText: true,
            decoration: InputDecoration(
                hintText: "Mot de passe",
                hintStyle: TextStyle(color: Colors.black54),
                border: InputBorder.none
            ),
          ),
        ),

      ],
    );
  }
}