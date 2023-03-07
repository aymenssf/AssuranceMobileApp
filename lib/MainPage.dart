import 'package:flutter/material.dart';
import 'navigation_drawer_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
    backgroundColor: Colors.grey[100],

    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 300,
            decoration: BoxDecoration(

              image: DecorationImage(

                  image: AssetImage('assets/allianzz.jpg'),
                  fit: BoxFit.fill
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      colors: [
                        Colors.black.withOpacity(.2),
                        Colors.black.withOpacity(.2),
                      ]
                  )
              ),
             /* child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text("L'assurance qui vous rend heureux !", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w400),),
                  SizedBox(height: 10,)
                ],
              ),*/

            ),
          ),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Nos usages", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800], fontSize: 20),),
                SizedBox(height: 20,),
                Container(
                  height: 285,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      makeItem(image: 'assets/car1.jpg', title: 'Tourisme'),
                      makeItem(image: 'assets/moto.jpg', title: 'Cyclomoteurs'),
                      makeItem(image: 'assets/commerc.jpg', title: 'Commerce'),
                      makeItem(image: 'assets/amb.jpg', title: 'divers')
                    ],
                  ),
                ),

                SizedBox(height: 20,),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget makeItem({image, title}) {
  return AspectRatio(
    aspectRatio: 1 / 1,
    child: Container(
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover
          )
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                colors: [
                  Colors.black.withOpacity(.8),
                  Colors.black.withOpacity(.2),
                ]
            )
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(title, style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 20),),
        ),
      ),
    ),
  );
}

