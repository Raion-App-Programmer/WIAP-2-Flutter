import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../services/location_service.dart';

class LiveTrackingDemoScreen extends StatefulWidget {
  const LiveTrackingDemoScreen({super.key});

  @override
  State<LiveTrackingDemoScreen> createState() => _LiveTrackingDemoScreenState();
}

class _LiveTrackingDemoScreenState extends State<LiveTrackingDemoScreen> {
  late GoogleMapController _mapController;
  Marker? _trackingMarker;
  Set<Marker> _markers = {};
  StreamSubscription<LatLng>? _locationSubscription;
  bool _simulate = false;
  final LocationService _locationService = LocationService();

  @override
  void initState() {
    super.initState();
    _startTracking();
  }

  Future<void> _startTracking() async {
    await _locationSubscription?.cancel();

    if (_simulate) {
      Position pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      final initialPosition = LatLng(pos.latitude, pos.longitude);
      _locationSubscription = _locationService
          .simulateLocationStream(initialPosition: initialPosition)
          .listen((LatLng position) {
        _updateLocation(position);
      });
    } else {
      final Stream<LatLng> liveStream =
          await _locationService.getLiveLocationStream();
      _locationSubscription = liveStream.listen((LatLng position) {
        _updateLocation(position);
      });
    }
  }

  void _updateLocation(LatLng position) {
    setState(() {
      _trackingMarker = Marker(
        markerId: const MarkerId('tracking'),
        position: position,
        infoWindow: const InfoWindow(title: 'Current Location'),
      );
      _markers = {_trackingMarker!};
      _mapController.animateCamera(CameraUpdate.newLatLng(position));
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _toggleSimulation(bool value) {
    setState(() {
      _simulate = value;
    });
    _startTracking();
  }

  @override
  void dispose() {
    _locationSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Tracking Demo'),
        actions: [
          Row(
            children: [
              const Text('Simulate'),
              Switch(
                value: _simulate,
                onChanged: _toggleSimulation,
              ),
            ],
          ),
        ],
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: LatLng(37.42796133580664, -122.085749655962),
          zoom: 14.0,
        ),
        markers: _markers,
      ),
    );
  }
}
