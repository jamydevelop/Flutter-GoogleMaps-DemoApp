import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GMapScreenThree extends StatefulWidget {
  const GMapScreenThree({super.key});

  @override
  State<GMapScreenThree> createState() => _GMapScreenThreeState();
}

class _GMapScreenThreeState extends State<GMapScreenThree> {
  static const LatLng _pGooglePlex =
      LatLng(37.42258740740897, -122.08517885561979);
  static const LatLng _pApplePark =
      LatLng(37.335173925986226, -122.00888515306963);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: _pGooglePlex,
          zoom: 13,
        ),
        markers: {
          const Marker(
              markerId: MarkerId('_currentLocation'),
              icon: BitmapDescriptor.defaultMarker,
              position: _pGooglePlex)
        },
      ),
    );
  }
}
