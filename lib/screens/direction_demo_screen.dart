import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DirectionsDemoScreen extends StatefulWidget {
  const DirectionsDemoScreen({super.key});

  @override
  State<DirectionsDemoScreen> createState() => _DirectionsDemoScreenState();
}

class _DirectionsDemoScreenState extends State<DirectionsDemoScreen> {
  late GoogleMapController _mapController;
  final LatLng _origin = const LatLng(-7.983908, 112.621391);
  final LatLng _destination = const LatLng(-7.9710, 112.6326);

  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};

  @override
  void initState() {
    super.initState();
    _markers.addAll([
      Marker(
        markerId: const MarkerId('origin'),
        position: _origin,
        infoWindow: const InfoWindow(title: 'Origin'),
      ),
      Marker(
        markerId: const MarkerId('destination'),
        position: _destination,
        infoWindow: const InfoWindow(title: 'Destination'),
      ),
    ]);
    List<LatLng> route = [
      _origin,
      const LatLng(-7.9825, 112.6240),
      const LatLng(-7.9800, 112.6260),
      _destination,
    ];
    _polylines.add(
      Polyline(
        polylineId: const PolylineId('route'),
        points: route,
        color: Colors.green,
        width: 5,
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Directions Demo'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _origin,
          zoom: 14,
        ),
        markers: _markers,
        polylines: _polylines,
      ),
    );
  }
}
