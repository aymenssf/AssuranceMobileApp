import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'navigation_drawer_widget.dart';
import 'api/client.dart';
import 'api/clientApi.dart';


class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  _Info createState() => _Info();
}

class _Info extends State<Info> {
  List<Client> client= [];

  @override
  void initState() {
    init();
    super.initState();
  }

  Future init() async {
    final t = await ClientApi.getAll();
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
        title: Text('Mes Assurances'),
        centerTitle: true,
        backgroundColor: Color(0xFF004A93),
      ),
      body: Column(
        children: [
          Expanded(child: ListView.builder(
            itemCount: client.length,
            itemBuilder: (context, index) {
              return info(client[index].police,
                  client[index].type,
                  client[index].prix,
                  client[index].dateD,
                  client[index].dateF);
            },
          )
          )
        ],
      ),
    );
  }

  Widget info(String p,String t,String m,String d,String f)
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

          title: Text("\nPolice : $p \n\nType:$t \n\nMontant : $m DH\n\nDate Debut : $d",style :TextStyle(color: Color(
              0xFF004A93), fontSize: 19.5, fontWeight: FontWeight.bold),),
          subtitle: Text("\nDate d'échéance : $f\n ",style :TextStyle(color: Color(
              0xFFCE2F2F), fontSize: 19.5, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}