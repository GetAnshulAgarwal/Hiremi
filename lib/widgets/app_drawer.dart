import 'package:flutter/material.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hireme/Screens/helpsupport_screen.dart';
import 'package:hireme/Screens/settings_screen.dart';
import 'package:hireme/color.dart';
import '../Screens/about_app.dart';
import 'layout.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final ValueNotifier<double> _valueNotifier =
      ValueNotifier<double>(71.34); // Example progress value
  int _selectedIndex = -1; // To track the selected tile index

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          // Drawer Header with Dashed Circular Progress Bar
          SizedBox(
            height: MediaQuery.of(context).size.height *
                0.4, // Increased header height
            child: DrawerHeader(
              decoration: const BoxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Progress Bar
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.2,
                          maxHeight: MediaQuery.of(context).size.height * 0.2,
                        ),
                        child: DashedCircularProgressBar.aspectRatio(
                          aspectRatio: 1,
                          // Circular shape
                          valueNotifier: _valueNotifier,
                          progress: 71.34,
                          // Current progress
                          maxProgress: 100,
                          // Maximum progress
                          corners: StrokeCap.round,
                          foregroundColor: Colors.green,
                          backgroundColor: const Color(0xffeeeeee),
                          foregroundStrokeWidth: 8,
                          backgroundStrokeWidth: 8,
                          animation: true,
                          child: Center(
                            child: ValueListenableBuilder(
                              valueListenable: _valueNotifier,
                              builder: (_, double value, __) => Text(
                                '${value.toInt()}%',
                                // Display the percentage
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      // Space between progress bar and text
                      // Name and Email
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Anshul', // Replace with user's name
                              style: GoogleFonts.poppins(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.02,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: const Color(0xFF0F3CC9)),
                              ),
                              child: Text(
                                'Not Verified',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  color: const Color(0xFF0F3CC9),
                                  fontWeight: FontWeight.w500,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.025,
                                ),
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005,
                            ),
                            Text(
                              'A135@gmail.com',
                              // Replace with user's email
                              style: GoogleFonts.poppins(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.03,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  // Card below progress bar and name
                  Card(
                    color: const Color(0xFF0F3CC9),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // "Hire Mi" text
                              Text(
                                'Hire Mi',
                                style: GoogleFonts.poppins(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.06,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.025,
                              ),
                              // "Get Verified" container
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.02,
                                  vertical: MediaQuery.of(context).size.height *
                                      0.003,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE8AA00),
                                  // Background color
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  'Get Verified',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.02,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.015),
                          // Description text
                          Text(
                            'Verify your profile to unlock premium features and lifetime benefits.',
                            style: GoogleFonts.poppins(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.03,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          // Button
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                backgroundColor: Colors.white,
                              ),
                              child: Text(
                                'Complete profile & Get Started',
                                style: GoogleFonts.poppins(
                                  color: const Color(0xFF0F3CC9),
                                  fontWeight: FontWeight.w500,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.03,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Drawer Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                _buildListTile(
                  index: 0,
                  icon: Icons.settings_outlined,
                  title: 'Settings',
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsScreen(
                            userName: "", isVerified: true),
                      )),
                ),
                _buildListTile(
                  index: 1,
                  icon: Icons.lock,
                  title: 'Change Password',
                  onTap: () {},
                ),
                _buildListTile(
                  index: 2,
                  icon: Icons.assignment,
                  title: 'About App',
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AboutApp(),
                      )),
                ),
                _buildListTile(
                  index: 3,
                  icon: Icons.help,
                  title: 'Help and Support',
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HelpAndSupport(),
                      )),
                ),
              ],
            ),
          ),
          // Logout tile
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.04),
            child: ListTile(
              leading: Container(
                height: MediaQuery.of(context).size.width * 0.1,
                width: MediaQuery.of(context).size.width * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue.withOpacity(0.1),
                ),
                child: const Icon(Icons.logout, color: AppColors.drawerIcon),
              ),
              title: const Text('Logout'),
              onTap: () {
                showLogoutDialog(context);
                // Pass context here
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile({
    required int index,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal:
            MediaQuery.of(context).size.width * 0.02, // 2% of screen width
        vertical: MediaQuery.of(context).size.height * 0.005,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: _selectedIndex == index ? Colors.blue.withOpacity(0.1) : null,
          // Highlight selected tile
          borderRadius: BorderRadius.circular(10), // Rounded corners
          border: _selectedIndex == index
              ? Border(
                  left: BorderSide(
                    color: AppColors.drawerIcon, // Border color
                    width: MediaQuery.of(context).size.width *
                        0.01, // Border width
                  ),
                )
              : null, // Only add border for the selected tile
        ),
        child: ListTile(
          leading: Icon(
            icon,
            color: AppColors.drawerIcon,
          ),
          title: Text(
            title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: MediaQuery.of(context).size.width * 0.04,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: MediaQuery.of(context).size.width * 0.04,
            color: AppColors.drawerIcon,
          ),
          onTap: () {
            setState(() {
              _selectedIndex = index; // Update the selected index
            });
            onTap();
          },
        ),
      ),
    );
  }
}
