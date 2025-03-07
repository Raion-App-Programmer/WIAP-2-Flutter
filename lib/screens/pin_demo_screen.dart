import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PinDemoScreen extends StatefulWidget {
  const PinDemoScreen({super.key});

  @override
  State<PinDemoScreen> createState() => _PinDemoScreenState();
}

class _PinDemoScreenState extends State<PinDemoScreen> {
  late GoogleMapController _mapController;
  final LatLng _center = const LatLng(-7.983908, 112.621391);

  String? _selectedTitle;
  String? _selectedDescription;

  late final Set<Marker> _markers;

  @override
  void initState() {
    super.initState();
    _markers = {
      Marker(
        markerId: const MarkerId('malang_center'),
        position: const LatLng(-7.983908, 112.621391),
        infoWindow: const InfoWindow(title: 'Malang City Center'),
        onTap: () {
          _onMarkerTapped(
            'Malang City Center',
            'The heart of Malang, vibrant and historic with lively streets and cultural landmarks.',
          );
        },
      ),
      Marker(
        markerId: const MarkerId('malang_city_hall'),
        position: const LatLng(-7.9835, 112.6300),
        infoWindow: const InfoWindow(title: 'Malang City Hall'),
        onTap: () {
          _onMarkerTapped(
            'Malang City Hall',
            'The administrative center of Malang, known for its Dutch colonial architecture.',
          );
        },
      ),
      Marker(
        markerId: const MarkerId('brawijaya_university'),
        position: const LatLng(-7.9557, 112.6145),
        infoWindow: const InfoWindow(title: 'Brawijaya University'),
        onTap: () {
          _onMarkerTapped(
            'Brawijaya University',
            'One of Indonesia’s top universities, known for academic excellence and its lush green campus.',
          );
        },
      ),
      Marker(
        markerId: const MarkerId('kampung_warna'),
        position: const LatLng(-7.9845, 112.6409),
        infoWindow: const InfoWindow(title: 'Kampung Warna-warni Jodipan'),
        onTap: () {
          _onMarkerTapped(
            'Kampung Warna-warni Jodipan',
            'A vibrant village transformed with colorful murals, attracting artists and tourists alike.',
          );
        },
      ),
    };
  }

  void _onMarkerTapped(String title, String description) {
    setState(() {
      _selectedTitle = title;
      _selectedDescription = description;
    });
  }

  void _onMapTapped(LatLng position) {
    setState(() {
      _selectedTitle = null;
      _selectedDescription = null;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pin Demo'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 14.0,
            ),
            markers: _markers,
            onTap: _onMapTapped,
          ),
          if (_selectedTitle != null && _selectedDescription != null)
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _selectedTitle!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _selectedDescription!,
                        style: const TextStyle(fontSize: 14),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              _selectedTitle = null;
                              _selectedDescription = null;
                            });
                          },
                          child: const Text('Close'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
