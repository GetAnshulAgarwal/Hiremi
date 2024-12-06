import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hireme/Screens/personal_details_screen(2).dart';
import '../widgets/app_bar.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/button.dart';
import '../widgets/circularProgressBar.dart';
import '../widgets/divider.dart';
import '../widgets/textFields.dart';

class PersonalDetailsScreen3 extends StatelessWidget {
  PersonalDetailsScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: customAppBar(context, 'Personal Details'),
      bottomNavigationBar: BottomNavBarWidget(),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.23,
              child: CircularBar(progress: 45),
            ),
            horizontalLine(context),
            SizedBox(height: height * 0.02),
            Padding(
              padding: EdgeInsets.only(left: width * 0.06),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Review and Verify your details',
                  style: GoogleFonts.poppins(
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0F3CC9),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            CustomTextField(title: 'Full Name', hText: 'Jae Doe'),
            SizedBox(height: height * 0.02),
            CustomTextField(title: "Father's Full Name ", hText: 'John Copper'),
            SizedBox(height: height * 0.02),
            CustomTextField(title: "Gender ", hText: 'Male'),
            SizedBox(height: height * 0.02),
            CustomTextField(title: "Birth Date", hText: '1/1/1999'),
            SizedBox(height: height * 0.02),
            CustomTextField(title: "Birth Place ", hText: 'Mumbai'),
            SizedBox(height: height * 0.05),
            button(
              context,
              'Review and next',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PersonalDetailsScreen4()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
