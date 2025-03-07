import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps API Demos'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.lightBlueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
        ),
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Welcome to the Maps Demo!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: ListTile(
                leading: const Icon(Icons.place, color: Colors.redAccent),
                title: const Text('Pin Demo'),
                subtitle: const Text('Explore various pins on the map.'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () => context.go('/pin'),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: ListTile(
                leading: const Icon(Icons.edit, color: Colors.blue),
                title: const Text('Drawing Demo'),
                subtitle:
                    const Text('Interactively draw a polyline on the map.'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () => context.go('/drawing'),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: ListTile(
                leading: const Icon(Icons.directions_run, color: Colors.green),
                title: const Text('Live Tracking Demo'),
                subtitle: const Text('Track your live location in real time.'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () => context.go('/live-tracking'),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: ListTile(
                leading: const Icon(Icons.crop_square, color: Colors.orange),
                title: const Text('Overlays Demo'),
                subtitle:
                    const Text('Display polygons and circles on the map.'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () => context.go('/overlays'),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: ListTile(
                leading: const Icon(Icons.palette, color: Colors.purple),
                title: const Text('Custom Map Styling'),
                subtitle: const Text('Apply custom themes to your map.'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () => context.go('/custom-style'),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: ListTile(
                leading: const Icon(Icons.search, color: Colors.teal),
                title: const Text('Place Search & Nearby'),
                subtitle:
                    const Text('Search and view nearby places on the map.'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () => context.go('/place-search'),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: ListTile(
                leading: const Icon(Icons.directions, color: Colors.indigo),
                title: const Text('Directions Demo'),
                subtitle:
                    const Text('Show a route between two points on the map.'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () => context.go('/directions'),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
