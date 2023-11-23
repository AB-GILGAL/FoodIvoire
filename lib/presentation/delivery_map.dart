import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  LocationData? currentLocation;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  void _getLocation() async {
    var location = Location();
    try {
      currentLocation = await location.getLocation();
    } catch (e) {
      currentLocation = null;
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery Tracking'),
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;
          });
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(
            currentLocation?.latitude ?? 0.0,
            currentLocation?.longitude ?? 0.0,
          ),
          zoom: 15.0,
        ),
        myLocationEnabled: true,
      ),
    );
  }
}
