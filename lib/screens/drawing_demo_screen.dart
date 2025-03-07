import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DrawingDemoScreen extends StatefulWidget {
  const DrawingDemoScreen({super.key});

  @override
  State<DrawingDemoScreen> createState() => _DrawingDemoScreenState();
}

class _DrawingDemoScreenState extends State<DrawingDemoScreen> {
  late GoogleMapController _mapController;

  final List<LatLng> _points = [];
  final Set<Polyline> _polylines = {};
  final Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _onTap(LatLng position) {
    setState(() {
      _points.add(position);
      _markers.add(
        Marker(
          markerId: MarkerId('marker_${_points.length}'),
          position: position,
        ),
      );
      _polylines.clear();
      _polylines.add(
        Polyline(
          polylineId: const PolylineId('route'),
          points: _points,
          color: Colors.blue,
          width: 5,
        ),
      );
    });
  }

  void _clearDrawing() {
    setState(() {
      _points.clear();
      _markers.clear();
      _polylines.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Drawing Demo'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: LatLng(-7.983908, 112.621391),
          zoom: 14.0,
        ),
        onTap: _onTap,
        markers: _markers,
        polylines: _polylines,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _clearDrawing,
        tooltip: 'Clear Drawing',
        child: const Icon(Icons.clear),
      ),
    );
  }
}
