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

  final List<Marker> _marker = [];
  final List<Marker> _list = const [
    // List of Markers Added on Google Map
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(14.625428, 121.124472),
        infoWindow: InfoWindow(
          title: 'Antipolo',
          snippet:'Antipolo, city, central Luzon, Philippines. Lying 12 miles (19 km) '
        )),

    Marker(
        markerId: MarkerId('2'),
        position: LatLng(14.554718, 121.024445),
        infoWindow: InfoWindow(
          title: 'Makati',
          snippet: 'Makati lies in the heart of the Metro Manila. The city is known for its upscale shopping malls with high fashion brands, restaurants and hotels.'
        )),

    Marker(
        markerId: MarkerId('3'),
        position: LatLng(14.558545, 121.136083),
        infoWindow: InfoWindow(
          title: 'Taytay',
          snippet: 'Taytay is a first-class municipality located in the northern part of Palawan, a province located in the western portion of the Philippines.',
        )),

    Marker(
      markerId: MarkerId('4'),
      position: LatLng(14.412973, 120.973689),
        infoWindow: InfoWindow(
          title: 'Bacoor',
          snippet: 'The City Government of Bacoor is the gateway to the province of Cavite. ',
        )
      
    ),
      Marker(
      markerId: MarkerId('5'),
      position: LatLng(14.299006, 120.958972),
        infoWindow: InfoWindow(
          title: 'Dasmarinas',
          snippet: 'The City of Dasmariñas is known as the “University Capital of Cavite” and is classified as one of the most competitive cities in the country today.',
        )
      
    ),
      Marker(
      markerId: MarkerId('6'),
      position: LatLng(14.794266, 120.879898),
        infoWindow: InfoWindow(
          title: 'Bulakan',
          snippet: 'Bulacan is noted as the land of heroes, beautiful women, progressive cooperatives, small and medium-scale industries. ',
        )
      
    ),
      Marker(
      markerId: MarkerId('7'),
      position: LatLng(14.599501, 120.984216),
        infoWindow: InfoWindow(
          title: 'Manila',
          snippet: 'Manila, capital and chief city of the Philippines. The city is the centre of the countrys economic, political, social, and cultural activity.',
        )
      
    ),
  ];

  @override
  void initState() {
    super.initState();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Google Map Screen'),
      ),
      body: GoogleMap(
        mapType: MapType.terrain,
        initialCameraPosition: _kGooglePlex,
        markers: Set<Marker>.of(_marker),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
       
      ),

     
    );
  }
}
