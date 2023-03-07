import 'package:flutter/material.dart';
import 'navigation_drawer_widget.dart';
class PeoplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
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
      title: Text('Accueil'),
      centerTitle: true,
      backgroundColor: Color(0xFF004A93),
    ),
  );
}