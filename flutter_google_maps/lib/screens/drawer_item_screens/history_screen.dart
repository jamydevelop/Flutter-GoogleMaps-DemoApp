// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<String> navigationRoutes = [
    "Route 1: A -> B",
    "Route 2: A -> B",
    "Route 3: A -> B",
    "Route 4: A -> B",
    "Route 5: A -> B",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Navigation History'),
      ),
      body: ListView.builder(
        itemCount: navigationRoutes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(navigationRoutes[index]),
            onTap: () {
              // Handle tap on each navigation route
              // For example, you can navigate to a detailed view of the route
              _navigateToRouteDetails(index);
            },
          );
        },
      ),
    );
  }

  void _navigateToRouteDetails(int index) {
    // This is just a placeholder for navigation logic
    // You can implement your logic to navigate to route details screen
    // For example:
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => RouteDetailsScreen(route: navigationRoutes[index])),
    // );
    print("Navigate to route details for: ${navigationRoutes[index]}");
  }
}
