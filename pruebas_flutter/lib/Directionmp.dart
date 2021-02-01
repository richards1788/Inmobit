import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;
import 'package:google_maps_webservice/directions.dart';

class Directionm extends ChangeNotifier {
  GoogleMapsDirections directionsApi =
      GoogleMapsDirections(apiKey: "AIzaSyCepXydJZ4B-riBsYganm8CAl9JEBqTGdE");

  Set<maps.Polyline> _route = Set();

  Set<maps.Polyline> get currentRoute => _route;

  findDirections(maps.LatLng from, maps.LatLng to) async {
    var origen = Location(from.latitude, from.longitude);
    var destino = Location(to.latitude, to.longitude);

    var result = await directionsApi.directionsWithLocation(origen, destino,
        travelMode:
            TravelMode.driving); //el travelMode es en que se va movilizar

    Set<maps.Polyline> newroute = Set();

    if (result.isOkay) {
      var route = result.routes[0];
      var leg = route.legs[0];

      List<maps.LatLng> points = [];

      leg.steps.forEach((step) {
        points.add(maps.LatLng(step.startLocation.lat, step.startLocation.lng));
        points.add(maps.LatLng(step.endLocation.lat, step.endLocation.lng));
      });
      var line = maps.Polyline(
        points: points,
        polylineId: maps.PolylineId("Mejor ruta"),
        color: Colors.red,
        width: 4,
      );
      newroute.add(line);

      print(line);

      _route = newroute;
      notifyListeners();
    } else {
      print("ERRROR !!! ${result.status}");
    }
  }
}
