// ignore_for_file: avoid_init_to_null

import 'package:flutter/material.dart';
import 'package:flutter_google_maps/screens/google_map_screen/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class GMapScreenPh extends StatefulWidget {
  const GMapScreenPh({super.key});

  @override
  State<GMapScreenPh> createState() => _GMapScreenPhState();
}

class _GMapScreenPhState extends State<GMapScreenPh> {
  final Location locationController = Location();

  static const screenCameraLoc = LatLng(14.554801995934415, 121.02404512808768);

  static const decaMall = LatLng(14.625132517364985, 120.96460748928804);
  static const desLocation = LatLng(14.60325929520791, 120.97033195233381);

  LatLng? currentPosition = null;
  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) async => await initializeMap());
  }

  Future<void> initializeMap() async {
    await fetchLocationUpdates();
    final coordinates = await fetchPolylinePoints();
    generatePolyLineFromPoints(coordinates);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Google Map Screen'),
      ),
      body: currentPosition == null
          ? const Center(
              child: Text('Loading...'),
            )
          : GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: screenCameraLoc,
                zoom: 12,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId('currentLocation'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueMagenta),
                  position: currentPosition!,
                  infoWindow: const InfoWindow(
                      title: 'User Location',
                      snippet: 'NOTE: User is on the move'),
                ),
                const Marker(
                  markerId: MarkerId('sourceLocation'),
                  icon: BitmapDescriptor.defaultMarker,
                  position: decaMall,
                  infoWindow: InfoWindow(
                      title: 'Deca Mall',
                      snippet: 'Famus mall in metro Manila'),
                ),
                const Marker(
                  markerId: MarkerId('destinationLocation'),
                  icon: BitmapDescriptor.defaultMarker,
                  position: desLocation,
                  infoWindow: InfoWindow(
                      title: 'Divisoria Mall',
                      snippet: 'Cheapest Shopping mall'),
                ),
                const Marker(
                  markerId: MarkerId('1'),
                  icon: BitmapDescriptor.defaultMarker,
                  position: LatLng(14.579418636101915, 121.03589797446558),
                  infoWindow: InfoWindow(
                      title: 'Mandaluyong',
                      snippet: 'it has a population of 425,758 people.'),
                ),
                const Marker(
                  markerId: MarkerId('2'),
                  icon: BitmapDescriptor.defaultMarker,
                  position: LatLng(14.55422046188041, 121.02464594288584),
                  infoWindow: InfoWindow(
                      title: 'Makati',
                      snippet: 'known for the skyscrapers and shopping malls of Makati.'),
                ),
                const Marker(
                  markerId: MarkerId('3'),
                  icon: BitmapDescriptor.defaultMarker,
                  position: LatLng(14.47925260268053, 121.01963848480449),
                  infoWindow: InfoWindow(
                      title: 'Parañaque',
                      snippet: 'Parañaque, is a first class highly urbanized city in the NCR.'),
                ),
                const Marker(
                  markerId: MarkerId('4'),
                  icon: BitmapDescriptor.defaultMarker,
                  position: LatLng(14.676054182866766, 121.04364716673396),
                  infoWindow: InfoWindow(
                      title: 'Quezon City',
                      snippet: ' The surrounding gardens contain playgrounds, fountains and the World Peace Bell monument.'),
                ),
                const Marker(
                  markerId: MarkerId('5'),
                  icon: BitmapDescriptor.defaultMarker,
                  position: LatLng(14.444548037714545, 120.9937866789244),
                  infoWindow: InfoWindow(
                      title: 'Las Piñas',
                      snippet: 'Las Piñas, is a 1st class highly urbanized city in the National Capital Region'),
                ),
              },
              polylines: Set<Polyline>.of(polylines.values),
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
      permissionGranted = await locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationController.onLocationChanged.listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          currentPosition =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          print('*********CURRENT LOCATION: ${currentPosition}');
        });
      }
    });
  }

  Future<List<LatLng>> fetchPolylinePoints() async {
    final polylinePoints = PolylinePoints();

    final result = await polylinePoints.getRouteBetweenCoordinates(
      googleMapsApiKey,
      PointLatLng(decaMall.latitude, decaMall.longitude),
      PointLatLng(desLocation.latitude, desLocation.longitude),
    );

    if (result.points.isNotEmpty) {
      return result.points
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList();
    } else {
      debugPrint(result.errorMessage);
      return [];
    }
  }

  Future<void> generatePolyLineFromPoints(
      List<LatLng> polylineCoordinates) async {
    const id = PolylineId('polyline');

    final polyline = Polyline(
      polylineId: id,
      color: Colors.blueAccent,
      points: polylineCoordinates,
      width: 5,
    );

    setState(() => polylines[id] = polyline);
  }
}
