import 'package:flutter/material.dart';

class Header extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image.asset('assets/allianz-logo.png',height: 210 ,color: Colors.white,),
          ),
          SizedBox(height: 10,),
          Center(
            child: Text("Bienvenue à Assurance Hennani", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
          )
        ],
      ),
    );
  }
}