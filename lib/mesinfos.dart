import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'navigation_drawer_widget.dart';
import 'api/clientt.dart';
import 'api/clienttApi.dart';


class Mesinfo extends StatefulWidget {
  const Mesinfo({Key? key}) : super(key: key);

  @override
  _Mesinfo createState() => _Mesinfo();
}

class _Mesinfo extends State<Mesinfo> {
  List<Clientt> clientt= [];

  @override
  void initState() {
    init();
    super.initState();
  }

  Future init() async {
    final t = await ClienttApi.getAll();
    setState(() => this.clientt = t);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        leading: Builder(builder: (context){

          return IconButton(
            onPressed: () =>Scaffold.of(context).openDrawer(),
            icon: Icon(Icons.menu,
              color: Colors.white,
              size: 25,
            ),
          );
        }),
        title: Text('Mes Informations'),
        centerTitle: true,
        backgroundColor: Color(0xFF004A93),
      ),
      body: SingleChildScrollView(
        child: Column(

          children: [

              info(" №Dossier : ${clientt[0].ndoss}",),
              info(" identifiant : ${clientt[0].asr}"),
              info(" telephone : ${clientt[0].tel}"),
          ],

        ),
      ),

    );
  }

  Widget info(String info)
  {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        elevation: 3,
        child: ListTile(
          tileColor: Color(0xFF0F569E),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
          ),

          title: Text(info,style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}