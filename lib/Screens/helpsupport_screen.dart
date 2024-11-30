import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../color.dart';
import '../widgets/app_bar.dart';
import '../widgets/app_drawer.dart';
import '../widgets/bottom_navbar.dart';

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Help & Support'),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Image Section
              Center(
                child: Image.asset(
                  'assets/contact.png', // Replace with your asset or network image
                  height: 250,
                ),
              ),
              const SizedBox(height: 15),

              // Header Section
              Text(
                'Got App Related Query?',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 30),

              // Contact Information Section
              Column(
                children: [
                  _buildContactRow(
                    context: context,
                    icon: Icons.phone,
                    title: 'Phone:',
                    value: ' +91 89 7845 4512',
                    onTap: () {
                      // Handle phone tap
                    },
                  ),
                  const SizedBox(height: 10),
                  _buildContactRow(
                    context: context,
                    icon: Icons.language,
                    title: 'Website:',
                    value: ' www.hiremi.in',
                    onTap: () {
                      // Handle website tap
                    },
                  ),
                  const SizedBox(height: 10),
                  _buildContactRow(
                    context: context,
                    icon: Icons.email,
                    title: 'Email:',
                    value: ' hiremi@support.com',
                    onTap: () {
                      // Handle email tap
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBarWidget(),
    );
  }

  Widget _buildContactRow({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String value,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
              height: MediaQuery.of(context).size.width * 0.1,
              width: MediaQuery.of(context).size.width * 0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue.withOpacity(0.1),
              ),
              child: Icon(
                icon,
                color: AppColors.drawerIcon,
              )),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.04,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: title,
                        style: GoogleFonts.poppins(
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: value,
                        style: GoogleFonts.poppins(
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF0F3CC9),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
