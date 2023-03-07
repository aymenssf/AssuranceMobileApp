import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'navigation_drawer_widget.dart';
import 'api/clienttt.dart';
import 'api/clientttApi.dart';


class Infos extends StatefulWidget {
  const Infos({Key? key}) : super(key: key);

  @override
  _Infos createState() => _Infos();
}

class _Infos extends State<Infos> {
  List<Clienttt> client= [];

  @override
  void initState() {
    init();
    super.initState();
  }

  Future init() async {
    final t = await ClientttApi.getAll();
    setState(() => this.client = t);
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
        title: Text('Notifications'),
        centerTitle: true,
        backgroundColor: Color(0xFF004A93),
      ),
      body: Column(
        children: [
          Expanded(child: ListView.builder(
            itemCount: client.length,
            itemBuilder: (context, index) {
              return info(client[index].dateF,);
            },
          )
          )
        ],
      ),
    );
  }

  Widget info(String f)
  {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        elevation: 3,
        child: ListTile(
          tileColor: Color(0xFFD4D4DB),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
          ),

          subtitle: Text("\nAssurance Hennani vous informe qu'aujourd'hui  : $f est  la date d'échéance de votre assurance.\nOn vous invite à renouveler votre contrat.Merci.\n",
              style :TextStyle(color: Color(0xFF000000), fontSize: 19.5, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}