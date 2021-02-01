import 'dart:math';

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'direction_provider.dart';

class Mapa1 extends StatefulWidget {
  final LatLng toPoint = LatLng(1.611256, -75.609622);
  final LatLng fromPoint = LatLng(1.622160, -75.595855);
 

  @override
  _Mapa1State createState() => _Mapa1State();
}

class _Mapa1State extends State<Mapa1> {
   int  _currentIndex=0;
  GoogleMapController _mapController;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<DirectionProvider>(
          builder: (BuildContext context, DirectionProvider api, Widget child) {
        return GoogleMap(
          initialCameraPosition: CameraPosition(
            target: widget.fromPoint,
            zoom: 15,
          ),
          markers: _createMarkers(),
          polylines: api.currentRoute,
          onMapCreated: _onMapCreated,
          /* myLocationEnabled: true,
          myLocationButtonEnabled: true, */
        );
      }),
/*       bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Colors.blue,
          ),
             BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Colors.blue,
          ),
             BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Colors.blue,
          )
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        }
      ), */
    );
  }

  Set<Marker> _createMarkers() {
    var tmp = Set<Marker>();

    tmp.add(Marker(
        markerId: MarkerId("fromPoint"),
        position: widget.fromPoint,
        infoWindow: InfoWindow(title: 'Casa')));
    tmp.add(Marker(
        markerId: MarkerId("toPoint"),
        position: widget.toPoint,
        infoWindow: InfoWindow(title: 'Estadio')));
    return tmp;
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;

    _centerView();
  }

  _centerView() async {
    var api = Provider.of<DirectionProvider>(context);

    await _mapController.getVisibleRegion();

    print("buscando direcciones");
    await api.findDirections(widget.fromPoint, widget.toPoint);

    var left = min(widget.fromPoint.latitude, widget.toPoint.latitude);
    var right = max(widget.fromPoint.latitude, widget.toPoint.latitude);
    var top = max(widget.fromPoint.longitude, widget.toPoint.longitude);
    var bottom = min(widget.fromPoint.longitude, widget.toPoint.longitude);

   /*   api.currentRoute.first.points.forEach((point) { 
      left = min(left, point.latitude);
      right = max(right, point.latitude);
      top = max(top, point.longitude);
      bottom = min(bottom, point.longitude);
    });  */

    var bounds = LatLngBounds(
      southwest: LatLng(left, bottom),
      northeast: LatLng(right, top),
    );
    var cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 50);
    _mapController.animateCamera(cameraUpdate);
  }
}
