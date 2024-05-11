import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// GoogleMapScreen

class GMapScreenOne extends StatefulWidget {
  const GMapScreenOne({super.key});

  @override
  State<GMapScreenOne> createState() => _GMapScreenOneState();
}

class _GMapScreenOneState extends State<GMapScreenOne> {

  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

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
    //packData();
  }

  Future<Position> getUserLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print('error $error');
    });

    return await Geolocator.getCurrentPosition();
  }

  packData() {
    getUserLocation().then((value) async {
      print('MyLocation');
      print('${value.latitude} ${value.longitude}');

      myMarker.add(
        Marker(
          markerId: const MarkerId('Second'),
          position: LatLng(value.latitude, value.longitude),
          infoWindow: const InfoWindow(
            title: 'My Location',
            
          ),
        ),
      );
      CameraPosition cameraPosition = CameraPosition(
        target: LatLng(value.latitude, value.longitude),
        zoom: 14,
      );

      final GoogleMapController controller = await _controller.future;

      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      setState(() {
        
      });
    });
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          packData();
        },
        child: const Icon(Icons.radio_button_off),
      ),
    );
  }
}
