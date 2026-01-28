import 'package:flutter/material.dart';
// import '../home/home_page.dart'; // Ensure your imports are correct

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // List of pages to display for each tab
  final List<Widget> _pages = [
    const Center(child: Text('Home Dashboard')), // Replace with HomePage()
    const Center(child: Text('Errands & Tasks')),
    const Center(child: Text('Travel Coordination')),
    const Center(child: Text('Wallet & Tokens')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack keeps the state of pages alive when switching tabs
      body: IndexedStack(index: _selectedIndex, children: _pages),

      // Moving SOS to a FAB makes it accessible from any screen
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showEmergencyDialog(context),
        backgroundColor: Colors.red.shade700,
        foregroundColor: Colors.white,
        tooltip: 'Emergency SOS',
        child: const Icon(Icons.emergency, size: 30),
      ),

      bottomNavigationBar: NavigationBar(
        elevation: 3,
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.roofing_outlined),
            selectedIcon: Icon(Icons.roofing),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.handshake_outlined),
            selectedIcon: Icon(Icons.handshake),
            label: 'Errands',
          ),
          NavigationDestination(
            icon: Icon(Icons.multiple_stop_rounded),
            selectedIcon: Icon(Icons.multiple_stop_rounded),
            label: 'Travel',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.toll_outlined,
            ), // Toll icon looks like a token/coin
            selectedIcon: Icon(Icons.toll),
            label: 'Wallet',
          ),
        ],
      ),
    );
  }

  // Quick helper to show how the SOS trigger could look
  void _showEmergencyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Emergency Assistance'),
        content: const Text(
          'Do you need immediate medical or safety assistance? This will share your location with campus admins.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              // Trigger your WebSocket / GPS logic here
              Navigator.pop(context);
            },
            child: const Text(
              'YES, SEND SOS',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
