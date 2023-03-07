import 'dart:async';
import 'navigation_drawer_widget.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

void setPermissions() async{
  await Permission.location.serviceStatus.isEnabled;
}
class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  var markers = [];
  late BitmapDescriptor mapMarker;
  late GoogleMapController mapController;
  var cameraPosition = CameraPosition(target:LatLng(32.286431, -9.228716),zoom:17,tilt:50 );

  @override
  void initState(){
    super.initState();
    setMarker();
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
          title: Text('Localisation'),
          centerTitle: true,
          backgroundColor: Color(0xFF004A93),
        ),
        body: GoogleMap(
          markers : Set<Marker>.from(markers),
          mapType: MapType.hybrid,
          initialCameraPosition: cameraPosition,
          onMapCreated: onMapCreated,
          onCameraMove: (position)
    {
      setState(() {
        markers.first = markers.first.copyWith(postionParam:position.target);
      });
    },
    )
    );
  }
void onMapCreated(GoogleMapController controller){
    mapController = controller;
    animateCamera();
}
void animateCamera(){
    mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    Marker marker = Marker(
      markerId: MarkerId('123'),
      position: LatLng(32.286431, -9.228716),
      icon: mapMarker,
      infoWindow: InfoWindow(title: 'Assurance HENNANI', snippet: 'Assurance HENNANI')
    );
    markers.add(marker);
}
  setMarker(){
    mapMarker = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue);
  }

}