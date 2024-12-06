import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hireme/Screens/personal_details_screen(3).dart';
import '../widgets/app_bar.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/button.dart';
import '../widgets/circularProgressBar.dart';
import '../widgets/divider.dart';
import '../widgets/textFields.dart';

class PersonalDetailsScreen4 extends StatelessWidget {
  const PersonalDetailsScreen4({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: customAppBar(context, 'Personal Details'),
      bottomNavigationBar: const BottomNavBarWidget(),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.23,
              child: const CircularBar(progress: 65),
            ),
            horizontalLine(context),
            SizedBox(height: height * 0.02),
            Padding(
              padding: EdgeInsets.only(left: width * 0.06),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Education details',
                  style: GoogleFonts.poppins(
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF0F3CC9),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            const CustomTextField(
                title: 'College Name', hText: "St John's University"),
            SizedBox(height: height * 0.02),
            const CustomTextField(title: "College's State", hText: 'Kolkata'),
            SizedBox(height: height * 0.02),
            const CustomTextField(title: "Branch ", hText: 'Computer Science'),
            SizedBox(height: height * 0.02),
            const CustomTextField(title: "Degree", hText: 'Bachelor degree'),
            SizedBox(height: height * 0.02),
            const CustomTextField(title: "Passout Year ", hText: '2022'),
            SizedBox(height: height * 0.05),
            button(
              context,
              'Review and next',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PersonalDetailsScreen5()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
