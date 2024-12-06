import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart'; // For input formatters
import 'package:hireme/Screens/personal_details_screen(2).dart';
import '../widgets/app_bar.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/button.dart';
import '../widgets/circularProgressBar.dart';
import '../widgets/divider.dart';
import '../widgets/textFields.dart';

class PersonalDetailsScreen5 extends StatefulWidget {
  const PersonalDetailsScreen5({super.key});

  @override
  _PersonalDetailsScreen5State createState() => _PersonalDetailsScreen5State();
}

class _PersonalDetailsScreen5State extends State<PersonalDetailsScreen5> {
  final _formKey = GlobalKey<FormState>(); // FormKey to manage form validation
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: customAppBar(context, 'Contact Details'),
      bottomNavigationBar: const BottomNavBarWidget(),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Form(
          // Wrap the body with Form widget
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.23,
                child: const CircularBar(progress: 85),
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
              // Email Input with validation
              CustomTextField(
                title: 'Email',
                hText: "example@gmail.com",
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  final emailRegex =
                      RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                  if (!emailRegex.hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: height * 0.02),
              // Contact Number Input
              CustomTextField(
                title: 'Contact Number',
                hText: '00000 00000',
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10), // Limit to 10 digits
                ],
                keyboardType: TextInputType.number, // Use numeric keyboard
                controller: _contactController,
              ),
              SizedBox(height: height * 0.02),
              Padding(
                padding: EdgeInsets.only(left: width * 0.06),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'WhatsApp Number',
                    style: GoogleFonts.poppins(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF0F3CC9),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.02), // WhatsApp Number Input
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.06,
                  vertical: height * 0.01,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly, // Allow only digits
                    LengthLimitingTextInputFormatter(10), // Limit to 10 digits
                  ],
                  decoration: InputDecoration(
                    labelText: 'WhatsApp Number',
                    hintText: '00000 00000',
                    labelStyle: GoogleFonts.poppins(
                      color: const Color(0xFF0F3CC9),
                      fontWeight: FontWeight.w600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: const Color(0xFF0F3CC9),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: const Color(0xFF0F3CC9),
                        width: 1.5,
                      ),
                    ),
                  ),
                  style: GoogleFonts.poppins(
                    fontSize: width * 0.04,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: height * 0.05),
              button(
                context,
                'Review and next',
                () {
                  if (_formKey.currentState?.validate() ?? false) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PersonalDetailsScreen4(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
