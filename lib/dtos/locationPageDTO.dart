import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPageDTO {
  final String route;
  Position position;
  final String useremail;

  LocationPageDTO({
    @required this.route,
    this.position,
    @required this.useremail,
  });

  void updatePosition(Position position) {
    this.position = position;
  }
}
