import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'globale.dart';
class Button extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: EdgeInsets.symmetric(horizontal: 70),
      child : ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF004A93),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )
        ),
        onPressed: () {
          login(context);
        },
        child: Center(
          child: Text("Login",style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold
          ),),

        ),
      ),
    );
  }
}