// ignore_for_file: avoid_init_to_null

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GMapScreenThree extends StatefulWidget {
  const GMapScreenThree({super.key});

  @override
  State<GMapScreenThree> createState() => _GMapScreenThreeState();
}

class _GMapScreenThreeState extends State<GMapScreenThree> {

  final Location _locationController = Location();

  static const LatLng _pGooglePlex =
      LatLng(37.42258740740897, -122.08517885561979);
  static const LatLng _pApplePark =
      LatLng(37.335173925986226, -122.00888515306963);
  LatLng? _currentP = null;

  @override
  void initState() {
    super.initState();
    getLocationUpdates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentP == null
          ? const Center(
              child: Text('Loading...'),
            )
          : GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: _pGooglePlex,
                zoom: 11,
              ),
              markers: {
                // const Marker(
                //   markerId: MarkerId('_currentLocation'),
                //   icon: BitmapDescriptor.defaultMarker,
                //   position: _currentP!,
                // ),
                const Marker(
                    markerId: MarkerId('_sourceLocation'),
                    icon: BitmapDescriptor.defaultMarker,
                    position: _pGooglePlex),
                const Marker(
                    markerId: MarkerId('_destinationLocation'),
                    icon: BitmapDescriptor.defaultMarker,
                    position: _pApplePark)
              },
            ),
    );
  }

  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();
    if (_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
    } else {
      return;
    }

    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          _currentP =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          print('*********LOCATION: ${_currentP}');
        });
      }
    });
  }
}
