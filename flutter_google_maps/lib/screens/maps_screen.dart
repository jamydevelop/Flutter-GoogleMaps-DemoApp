import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(14.599364, 120.984080),
    zoom: 10.4746,
  );

  // static const CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  List<Marker> _marker = [];
  final List<Marker> _list = const [
    // List of Markers Added on Google Map
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(14.625428, 121.124472),
        infoWindow: InfoWindow(
          title: 'Antipolo',
        )),

    Marker(
        markerId: MarkerId('2'),
        position: LatLng(14.554718, 121.024445),
        infoWindow: InfoWindow(
          title: 'Makati',
        )),

    Marker(
        markerId: MarkerId('3'),
        position: LatLng(14.558545, 121.136083),
        infoWindow: InfoWindow(
          title: 'Taytay',
        )),

    Marker(
      markerId: MarkerId('4'),
      position: LatLng(14.412973, 120.973689),
        infoWindow: InfoWindow(
          title: 'Bacoor',
        )
      
    ),
      Marker(
      markerId: MarkerId('5'),
      position: LatLng(14.299006, 120.958972),
        infoWindow: InfoWindow(
          title: 'Dasmarinas',
        )
      
    ),
      Marker(
      markerId: MarkerId('6'),
      position: LatLng(14.794266, 120.879898),
        infoWindow: InfoWindow(
          title: 'Bulakan',
        )
      
    ),
      Marker(
      markerId: MarkerId('7'),
      position: LatLng(14.599501, 120.984216),
        infoWindow: InfoWindow(
          title: 'Manila',
        )
      
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.terrain,
        initialCameraPosition: _kGooglePlex,
        markers: Set<Marker>.of(_marker),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        // markers: {
        //   const Marker(
        //     markerId: MarkerId('Manila'),
        //     position: LatLng(14.599364, 120.984080),
        //     // onTap: ,
        //   ),
        // },
      ),

      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: const Text('To the lake!'),
      //   icon: const Icon(Icons.directions_boat),
      // ),
    );
  }
  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}
