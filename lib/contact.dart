import 'package:flutter/material.dart';
import 'navigation_drawer_widget.dart';
import 'CustomPainer.dart';
import 'globale.dart';


class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  _Contact createState() => _Contact();
}


class _Contact extends  State<Contact> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
        title: Text('Contact'),
        centerTitle: true,
        backgroundColor: Color(0xFF004A93),
      ),
      backgroundColor: Color(0xFFCFD9EE),
      body: Center(
        child: Container(
          height: height * 0.7,
          width: width * 0.79,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              colors: [
                Color(0xFF9AA6F1),
                Color(0xFF004A93),


              ],
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: CustomPaint(
              size: Size(width, height),
              painter: CardCustomPainter(),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 35,
                    left: 10,
                    child: Image.asset(
                      'assets/img_2.png',
                      color: Color(0xFFAFBCFF).withOpacity(0.2),
                      width: width * 0.7,
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 20,
                    child: Image.asset(
                      'assets/img_1.png',
                      width: width * 0.7,
                      color: Colors.white70,
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Image.asset(
                          'assets/allianz-logo.png',
                          color: Color(0xFFFFFFFF),
                          width: width * 0.5,

                        ),
                      ),

                      SizedBox(
                        height: 80,
                      ),
                      detailWidget(
                        icon: Icons.phone,
                        text: '0524627550',
                      ),
                      detailWidget(
                        icon: Icons.email,
                        text: 'Assuranceshennani@gmail.com',
                      ),
                      detailWidget(
                        icon: Icons.location_on,
                        text: 'Residences Nadia IMM 04 APP 03 Qu Jerifate safi',
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget detailWidget({required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 25,
                color: Colors.white70,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 19.9,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  ),
                ),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}


