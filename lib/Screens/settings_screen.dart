import 'dart:math'; // For generating random App IDs
import 'package:flutter/material.dart';
import 'package:hireme/Screens/settingtile.dart';
import '../color.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/app_drawer.dart';
import 'helpsupport_screen.dart'; // Import the Drawer from the specified path

class SettingsScreen extends StatefulWidget {
  final String userName;
  final bool isVerified;

  const SettingsScreen({
    super.key,
    required this.userName,
    required this.isVerified,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late String appId;
  bool jobAlertsEnabled = false; // State for Job Alert Notification switch

  @override
  void initState() {
    super.initState();
    // Generating a random App ID
    appId =
        "HM ${Random().nextInt(90000) + 10000} ${Random().nextInt(90000) + 10000}";
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 1,
        centerTitle: true,
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_outlined,
              size: 20,
              color: Colors.black,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notification Icon Clicked')),
              );
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(screenWidth, screenHeight),
            SectionTitle(
              title: "Account",
              screenWidth: screenWidth,
              textStyle: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            _buildPersonalInfoSection(),
            SizedBox(height: screenHeight * 0.02), // Space between sections
            SectionTitle(
              title: "Privacy & Security",
              screenWidth: screenWidth,
              textStyle: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            _buildPrivacyAndSecuritySection(),
            SizedBox(height: screenHeight * 0.02), // Space between sections
            SectionTitle(
              title: "About & More",
              screenWidth: screenWidth,
              textStyle: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            _buildAboutAndMoreSection(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBarWidget(),
    );
  }

  // Header with profile and app info
  Widget _buildHeader(double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.profileColor.withOpacity(0.5),
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFB2BEE2), // #B2BEE2
                          Color(0xFF0F3CC9), // #0F3CC9
                        ],
                      ).createShader(bounds);
                    },
                    child: const Icon(
                      Icons.person,
                      size: 28,
                      color: Colors
                          .white, // This color will be ignored by the gradient
                    ),
                  )),
              SizedBox(width: screenWidth * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.userName,
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "App ID: $appId",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: screenWidth * 0.03,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.03,
              vertical: screenHeight * 0.005,
            ),
            decoration: BoxDecoration(
              color: widget.isVerified
                  ? AppColors.verifiedBadgeColor
                  : AppColors.unverifiedBadgeColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              widget.isVerified ? 'Verified' : 'Verify',
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.04,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Personal Info Section
  Widget _buildPersonalInfoSection() {
    return Container(
      margin: const EdgeInsets.only(top: 10), // Added margin to create space
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: 401, // Box width
      height: 56.14, // Box height
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
          bottomLeft: Radius.circular(18),
          bottomRight: Radius.circular(18),
        ),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 0.5,
        ),
      ),
      child: const Row(
        children: [
          Icon(Icons.person_outline, color: Color(0xFF0F3CC9), size: 20),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              "Personal Info",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Stack(
            clipBehavior:
                Clip.none, // To allow the arrow to go outside the circle
            children: [
              CircleAvatar(
                radius: 15, // Adjust size of the circle
                backgroundColor:
                    AppColors.arrowcolor, // Circle background color
                child: Icon(
                  Icons.chevron_right,
                  color: Colors.grey, // Icon color inside the circle
                  size: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Job Alerts Tile with Switch
  Widget _buildJobAlertTile() {
    return Container(
      margin: const EdgeInsets.only(
          top: 1), // Added margin to create space between tiles
      child: Row(
        children: [
          const Icon(
            Icons.notifications_outlined,
            color: AppColors.verifiedBadgeColor,
            size: 20,
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              "Job Alert Notification",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Transform.scale(
            scale:
                0.6, // Adjust the scale factor to match the size of the arrow icon
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 5.0), // Adjust padding if needed
              child: Switch(
                value: jobAlertsEnabled,
                onChanged: (bool value) {
                  setState(() {
                    jobAlertsEnabled = value;
                  });
                },
                activeColor: AppColors.verifiedBadgeColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Section Box with tiles and margin for spacing
  Widget _buildSectionBox(List<Widget> tiles) {
    return Container(
      margin: const EdgeInsets.only(
          top: 10), // Added margin to create space between sections
      padding: const EdgeInsets.symmetric(horizontal: 8),
      width: 401, // Box width
      height: tiles.length * 40.28 + 20, // Adjust height based on content
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
          bottomLeft: Radius.circular(18),
          bottomRight: Radius.circular(18),
        ),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 0.9,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: tiles,
      ),
    );
  }

  // Section for Privacy & Security
  Widget _buildPrivacyAndSecuritySection() {
    return _buildSectionBox([
      _buildTile(
        title: "Change Password",
        icon: Icons.lock_open_outlined,
        iconColor: const Color(0xFF0F3CC9),
      ),
      _buildJobAlertTile(),
      _buildTile(
        title: "Terms and conditions section",
        icon: Icons.explore_outlined,
        iconColor: const Color(0xFF0F3CC9),
      ),
    ]);
  }

  // Section for About & More
  Widget _buildAboutAndMoreSection() {
    return _buildSectionBox([
      _buildTile(
        title: "About Us",
        icon: Icons.import_contacts_outlined,
        iconColor: const Color(0xFF0F3CC9),
      ),
      _buildTile(
        title: "Help & Support",
        icon: Icons.wifi_calling_outlined,
        iconColor: const Color(0xFF0F3CC9),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HelpAndSupport()),
          );
        },
      ),
    ]);
  }

  // Helper method for creating individual tiles in sections
  Widget _buildTile({
    required String title,
    required IconData icon,
    required Color iconColor,
    void Function()? onTap, // Optional onTap parameter
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ),
          const Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: AppColors.arrowcolor,
                child: Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                  size: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
