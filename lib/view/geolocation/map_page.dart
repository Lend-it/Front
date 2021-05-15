import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front/controller/user.controller.dart';
import 'package:front/dtos/locationPageDTO.dart';
import 'package:front/routes/app_routes.dart';
import 'package:front/widgets/page_heading.dart';
import 'package:front/widgets/base_page.dart';
import 'package:front/widgets/button.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController _mapController;
  Set<Marker> _markers = new Set<Marker>();
  LatLng _selectedCoords;

  UserController _userController = new UserController();

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _updateCoordOnTap(LatLng position) {
    _mapController.animateCamera(CameraUpdate.newLatLng(position));

    final Marker marker = Marker(
      markerId: new MarkerId('123'),
      position: position,
    );

    setState(() {
      _markers.add(marker);
      _selectedCoords = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    final LocationPageDTO data = ModalRoute.of(context).settings.arguments;

    return BasePage(
      header: SvgPicture.asset(
        'assets/logo.svg',
        width: 150,
      ),
      body: Column(
        children: [
          PageHeading(
            title: 'Marque onde você mora',
            subtitle:
                'Logo logo você poderá ajudar e receber ajuda dos seus vizinhos!',
          ),
          Container(
            height: 420,
            padding: EdgeInsets.only(top: 20, bottom: 10),
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              markers: _markers,
              onTap: _updateCoordOnTap,
              initialCameraPosition: CameraPosition(
                target: LatLng(data.position.latitude, data.position.longitude),
                zoom: 14.0,
              ),
            ),
          ),
          Button(
            title: "Salvar localização",
            onPressedHandler: () async {
              if (data.route == AppRoutes.PROFILE_PAGE) {
                await _userController.updateUserLocation(
                  context: context,
                  position: _selectedCoords,
                  useremail: data.useremail,
                );
              }

              Navigator.pushNamed(
                context,
                data.route,
                arguments: _selectedCoords,
              );
            },
          ),
        ],
      ),
    );
  }
}
