import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceSearchDemoScreen extends StatefulWidget {
  const PlaceSearchDemoScreen({super.key});

  @override
  State<PlaceSearchDemoScreen> createState() => _PlaceSearchDemoScreenState();
}

class _PlaceSearchDemoScreenState extends State<PlaceSearchDemoScreen> {
  late GoogleMapController _mapController;
  final LatLng _center = const LatLng(-7.983908, 112.621391);
  final Set<Marker> _markers = {};
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _places = [
    {
      'name': 'Museum Malang Tempo Doeloe',
      'location': const LatLng(-7.9818, 112.6214),
    },
    {
      'name': 'Alun-Alun Malang',
      'location': const LatLng(-7.9830, 112.6225),
    },
  ];

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _searchPlaces(String query) {
    setState(() {
      _markers.clear();
      for (var place in _places) {
        if (place['name']
            .toString()
            .toLowerCase()
            .contains(query.toLowerCase())) {
          _markers.add(
            Marker(
              markerId: MarkerId(place['name']),
              position: place['location'],
              infoWindow: InfoWindow(title: place['name']),
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Place Search & Nearby Demo'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 14,
            ),
            markers: _markers,
          ),
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    hintText: 'Search places...',
                    border: InputBorder.none,
                    icon: Icon(Icons.search),
                  ),
                  onSubmitted: _searchPlaces,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
