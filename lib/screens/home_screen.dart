import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Google Maps API Demos'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.grey.shade300, Colors.grey.shade200],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey.shade100, Colors.grey.shade50],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    'Welcome to the Maps Demo!',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade900,
                        ),
                  ),
                ),
                const SizedBox(height: 20),
                _buildDemoCard(
                  context,
                  icon: Icons.place,
                  title: 'Pin Demo',
                  subtitle: 'Explore various pins on the map.',
                  route: '/pin',
                ),
                const SizedBox(height: 12),
                _buildDemoCard(
                  context,
                  icon: Icons.edit,
                  title: 'Drawing Demo',
                  subtitle: 'Interactively draw a polyline on the map.',
                  route: '/drawing',
                ),
                const SizedBox(height: 12),
                _buildDemoCard(
                  context,
                  icon: Icons.directions_run,
                  title: 'Live Tracking Demo',
                  subtitle: 'Track your live location in real time.',
                  route: '/live-tracking',
                ),
                const SizedBox(height: 12),
                _buildDemoCard(
                  context,
                  icon: Icons.crop_square,
                  title: 'Overlays Demo',
                  subtitle: 'Display polygons and circles on the map.',
                  route: '/overlays',
                ),
                const SizedBox(height: 12),
                _buildDemoCard(
                  context,
                  icon: Icons.palette,
                  title: 'Custom Map Styling',
                  subtitle: 'Apply custom themes to your map.',
                  route: '/custom-style',
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDemoCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required String route,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 6,
      shadowColor: Colors.black26,
      color: Colors.white,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        leading: CircleAvatar(
          backgroundColor: Colors.grey.shade300,
          child: Icon(icon, color: Colors.grey.shade800),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade900,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: Colors.grey.shade700),
        ),
        trailing: Icon(Icons.chevron_right, color: Colors.grey.shade600),
        onTap: () => context.go(route),
      ),
    );
  }
}
