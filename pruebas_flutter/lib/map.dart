import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pruebas_flutter/Directionmp.dart';
import 'package:provider/provider.dart';
import 'Directionmp.dart';

class Myhomepage extends StatefulWidget {
  final LatLng fromPonint = LatLng(1.620674, -75.602219);
  final LatLng toPonint = LatLng(1.640911, -75.607232);
  @override
  _MyhomepageState createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  GoogleMapController mapcontroller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Faty - Delivery'),
          ),
          body: Consumer<Directionm>(
              builder: (BuildContext context, Directionm api, Widget child) {
            return GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: widget.fromPonint, zoom: 16),
              markers: _createMarkers(),
              polylines: api.currentRoute,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
            );
          }),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.zoom_out_map),
            onPressed: () {
              _centerView();
            },
          ),
        );
  }

  Set<Marker> _createMarkers() {
    var tmp = Set<Marker>();
    tmp.add(
        Marker(markerId: MarkerId("fromPoint"), position: widget.fromPonint));
    tmp.add(Marker(
        markerId: MarkerId("toPoint"),
        position: widget.toPonint,
        infoWindow: InfoWindow(title: "Cancha sintetica el Olímpo")));
    return tmp;
  }

  void _onMapCreated(GoogleMapController controller) {
    mapcontroller = controller;
    _centerView();
  }

  _centerView() async {
    var api = Provider.of<Directionm>(context);

    await mapcontroller.getVisibleRegion();

    print("buscando direcciones");
    await api.findDirections(widget.fromPonint, widget.toPonint);

    var izquierda = min(widget.fromPonint.latitude, widget.toPonint.latitude);
    var derecha = max(widget.fromPonint.latitude, widget.toPonint.latitude);
    var top = max(widget.fromPonint.longitude, widget.toPonint.longitude);
    var botton = min(widget.fromPonint.longitude, widget.toPonint.longitude);

   
    var bounds = LatLngBounds(
        southwest: LatLng(izquierda, botton), northeast: LatLng(derecha, top));
    var cameraupdate = CameraUpdate.newLatLngBounds(bounds, 50);
    mapcontroller.animateCamera(cameraupdate);
  }
}
