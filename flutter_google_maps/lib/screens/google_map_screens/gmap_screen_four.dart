import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GMapScreenFour extends StatefulWidget {
  const GMapScreenFour({super.key});

  @override
  State<GMapScreenFour> createState() => _GMapScreenFourState();
}

class _GMapScreenFourState extends State<GMapScreenFour> {
  final locationController = Location();

  static const phManilaLocation = LatLng(14.599364, 120.984080);
  static const desLocation = LatLng(14.625356035848924, 120.96451523261382);

  LatLng? currentPosition;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) async => await fetchLocationUpdates);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: phManilaLocation,
          zoom: 13,
        ),
        markers: {
          const Marker(
            markerId: MarkerId('sourceLocation'),
            icon: BitmapDescriptor.defaultMarker,
            position: phManilaLocation,
          ),
          const Marker(
            markerId: MarkerId('destinationLocation'),
            icon: BitmapDescriptor.defaultMarker,
            position: desLocation,
          )
        },
      ),
    );
  }

  Future<void> fetchLocationUpdates() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await locationController.serviceEnabled();
    if (serviceEnabled) {
      serviceEnabled = await locationController.requestService();
    } else {
      return;
    }

    permissionGranted = await locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted == await locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationController.onLocationChanged.listen((currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          currentPosition = LatLng(
            currentLocation.latitude!,
            currentLocation.longitude!,
          );
        });
        // ignore: avoid_print
        print('****L O C A T I O N ${currentPosition}');
      }
    });
  }
}
