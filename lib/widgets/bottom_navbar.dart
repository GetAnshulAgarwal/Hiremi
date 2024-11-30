import 'package:flutter/material.dart';
import 'package:hireme/Screens/settings_screen.dart';

import '../Screens/home_screen.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({super.key});

  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int _selectedIndex = 0;

  // List of pages for navigation
  final List<Widget> _pages = [
    const HomeScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        // builder: (context) => _pages[index],
        builder: (context) =>
            const SettingsScreen(userName: "Anshul", isVerified: false),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: MediaQuery.of(context).size.width * 0.03,
        bottom: MediaQuery.of(context).size.height * 0.03,
        left: MediaQuery.of(context).size.width * 0.03,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Background color for the navigation bar
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 3), // Shadow position
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(MediaQuery.of(context).size.width * 0.03),
            topRight: Radius.circular(MediaQuery.of(context).size.width * 0.03),
            bottomRight:
                Radius.circular(MediaQuery.of(context).size.width * 0.08),
            bottomLeft:
                Radius.circular(MediaQuery.of(context).size.width * 0.08),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex, // Highlight the selected icon
            onTap: _onItemTapped, // Handle item taps
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.wallet_travel),
                label: "Jobs",
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.people_outline),
                label: "Ask Expert",
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.playlist_add_check_rounded),
                label: "Status",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/hiremi.png',
                  height: MediaQuery.of(context).size.height * 0.04,
                  width: MediaQuery.of(context).size.width * 0.1,
                  fit: BoxFit.contain, // Ensures the image scales properly
                ),
                label: "",
              ),
            ],
            selectedItemColor: const Color(0xFF0F3CC9),
            unselectedItemColor: Colors.grey,
            iconSize: MediaQuery.of(context).size.width * 0.07,
            selectedFontSize: MediaQuery.of(context).size.width *
                0.03, // Font size for selected labels
            unselectedFontSize: MediaQuery.of(context).size.width *
                0.03, // Font size for unselected labels
            showUnselectedLabels:
                true, // Ensure labels show for unselected items
            type: BottomNavigationBarType.fixed, // Ensure no wrapping of items
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w500, // Bold for selected labels
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight:
                  FontWeight.w400, // Regular weight for unselected labels
            ),
          ),
        ),
      ),
    );
  }
}
