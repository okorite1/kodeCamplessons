import 'package:flutter/material.dart';
import 'package:kode_camp_task_four/profile_screen.dart';

class TheMainScreen extends StatefulWidget {
  const TheMainScreen({super.key});

  @override
  State<TheMainScreen> createState() => _TheMainScreenState();
}

class _TheMainScreenState extends State<TheMainScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Get the name and email passed from LoginScreen
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    String theName = args['name'];
    String theEmail = args['email'];

    // Pages shown when each tab is selected
    List<Widget> pages = [
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome $theName', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text(
              theEmail,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
      const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.shopping_cart, size: 50), Text('Your Cart')],
        ),
      ),
      ProfileScreen(name: theName, email: theEmail),
      const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.notifications, size: 50),
            Text('Notifications'),
          ],
        ),
      ),
      const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.settings, size: 50), Text('Settings')],
        ),
      ),
    ];

    return Scaffold(
      body: IndexedStack(index: selectedIndex, children: pages),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        // Important: Add these for 5 items
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        // Optional: Add colors for better visibility
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        elevation: 8, // Adds shadow
      ),
    );
  }
}
