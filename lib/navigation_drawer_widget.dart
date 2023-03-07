import 'package:flutter/material.dart';
import 'package:assurance/LoginPage.dart';
import 'MainPage.dart';
import 'info.dart';
import 'mesinfos.dart';
import 'map_widget.dart';
import 'contact.dart';
import 'not.dart';
import 'api/clienttt.dart';
import 'api/clientttApi.dart';
import 'package:shared_preferences/shared_preferences.dart';
class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  _NavigationDrawerWidget createState() => _NavigationDrawerWidget();
}
class _NavigationDrawerWidget extends State<NavigationDrawerWidget> {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  String ndoss="";
  @override
  List<Clienttt> client= [];

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

    return Drawer(
      child: Material(
        color: Color(0xFF004A93),
        child: ListView(
          children: <Widget>[
              Image.asset('assets/allianz-logo.png',height: 150 ,color: Colors.white,),
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Divider(color: Colors.white),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text:'Accueil',
                    icon: Icons.home,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Mes Informations',
                    icon: Icons.perm_device_information,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Mes Assurances',
                    icon: Icons.beenhere,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Localisation',
                    icon: Icons.location_on,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Contact',
                    icon: Icons.perm_phone_msg,
                    onClicked: () => selectedItem(context, 4),
                  ),

                  const SizedBox(height: 24),
                  Divider(color: Color(0xFFFFFFFF)),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Notifications',
                    icon: Icons.notifications_outlined,
                    onClicked: () => selectedItem(context, 5),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Logout',
                    icon: Icons.logout,
                    onClicked: () => selectedItem(context, 6),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Color setColor(text) {
    if (text== 'Notifications' && client.isNotEmpty ) {
      return Colors.red;
    }
    else {
      return Colors.white;
    }
  }

  Widget buildMenuItem({

    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = setColor(text);
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MainPage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Mesinfo(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Info(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MapSample(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Contact(),
        ));
        break;

      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Infos(),
        ));
        break;
      case 6:
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
          builder: (context) => LoginPage()),(Route<dynamic> route) => false,
        );
        break;
    }
  }
}