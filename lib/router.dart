import 'package:go_router/go_router.dart';
import 'package:wiap_2/screens/direction_demo_screen.dart';
import 'package:wiap_2/screens/mapstyle_demo_screen.dart';
import 'package:wiap_2/screens/overlay_demo_screen.dart';
import 'screens/home_screen.dart';
import 'screens/pin_demo_screen.dart';
import 'screens/drawing_demo_screen.dart';
import 'screens/live_tracking_demo_screen.dart';
import 'screens/place_search_demo_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/pin',
      builder: (context, state) => const PinDemoScreen(),
    ),
    GoRoute(
      path: '/drawing',
      builder: (context, state) => const DrawingDemoScreen(),
    ),
    GoRoute(
      path: '/live-tracking',
      builder: (context, state) => const LiveTrackingDemoScreen(),
    ),
    GoRoute(
      path: '/overlays',
      builder: (context, state) => const OverlaysDemoScreen(),
    ),
    GoRoute(
      path: '/custom-style',
      builder: (context, state) => const CustomMapStyleDemoScreen(),
    ),
    GoRoute(
      path: '/place-search',
      builder: (context, state) => const PlaceSearchDemoScreen(),
    ),
    GoRoute(
      path: '/directions',
      builder: (context, state) => const DirectionsDemoScreen(),
    ),
  ],
);
