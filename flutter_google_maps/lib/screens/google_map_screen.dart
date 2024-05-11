import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// GoogleMapScreen

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(14.599364, 120.984080),
    zoom: 10.4746,
  );

  final List<Marker> myMarker = [];
  final List<Marker> markerList = const [
    // List of Markers Added on Google Map
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(14.625428, 121.124472),
      infoWindow: InfoWindow(
          title: 'Antipolo',
          snippet:
              'Antipolo, city, central Luzon, Philippines. Lying 12 miles (19 km) '),
    ),
  ];

  @override
  void initState() {
    super.initState();
    myMarker.addAll(markerList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: const Text('Google Map Screen'),
      ),
      body: SafeArea(
        child: GoogleMap(
          mapType: MapType.terrain,
          initialCameraPosition: _kGooglePlex,
          markers: Set<Marker>.of(myMarker),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
