import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OverlaysDemoScreen extends StatefulWidget {
  const OverlaysDemoScreen({super.key});

  @override
  State<OverlaysDemoScreen> createState() => _OverlaysDemoScreenState();
}

class _OverlaysDemoScreenState extends State<OverlaysDemoScreen> {
  late GoogleMapController _mapController;
  final LatLng _center = const LatLng(-7.983908, 112.621391);
  Set<Polygon> _polygons = {};
  Set<Circle> _circles = {};

  @override
  void initState() {
    super.initState();
    _setPolygons();
    _setCircles();
  }

  void _setPolygons() {
    _polygons.add(
      Polygon(
        polygonId: const PolygonId('malang_polygon'),
        points: [
          const LatLng(-7.9850, 112.6200),
          const LatLng(-7.9850, 112.6230),
          const LatLng(-7.9830, 112.6240),
          const LatLng(-7.9810, 112.6220),
          const LatLng(-7.9820, 112.6190),
        ],
        strokeWidth: 3,
        strokeColor: Colors.red,
        fillColor: Colors.red.withOpacity(0.2),
      ),
    );
  }

  void _setCircles() {
    _circles.add(
      Circle(
        circleId: const CircleId('malang_circle'),
        center: const LatLng(-7.983908, 112.621391),
        radius: 500, // 500 meters radius
        strokeWidth: 2,
        strokeColor: Colors.blue,
        fillColor: Colors.blue.withOpacity(0.2),
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
        title: const Text('Polygon & Circle Overlays'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 14,
        ),
        polygons: _polygons,
        circles: _circles,
      ),
    );
  }
}
