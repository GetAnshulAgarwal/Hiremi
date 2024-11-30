import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void showLogoutDialog(BuildContext context) {
  Navigator.of(context).pop();
  showDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.5), // Dim the background
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Blur effect
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.25,

            decoration: BoxDecoration(
              color:
                  Colors.white.withOpacity(0.8), // Semi-transparent background
              borderRadius: BorderRadius.circular(20),
              //backgroundBlendMode: BlendMode.darken, // Blend effect
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3), // Shadow color
                  offset: const Offset(4, 4), // Shadow offset
                  blurRadius: 10, // Shadow blur
                ),
              ],
            ),
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
            width: MediaQuery.of(context).size.width * 0.8, // Responsive width
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Text(
                  "Are you sure you want to log out?",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // "No" Button with 3D Effect
                    OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.blue),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.016,
                          horizontal: MediaQuery.of(context).size.width * 0.06,
                        ),
                      ),
                      child: Text(
                        "No",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          color: Colors.blue,
                        ),
                      ),
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    // "Yes" Button with 3D Effect
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                        // Add logout logic here
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10), // Match the container's radius
                        ),
                        backgroundColor:
                            const Color(0xFF0F3CC9), // Button background color
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.016,
                          horizontal: MediaQuery.of(context).size.width * 0.06,
                        ),
                        elevation:
                            4, // Remove elevation since shadow is handled by the container
                      ),
                      child: Text(
                        "Yes",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

// import 'package:flutter/material.dart';
// import 'dart:ui';
//
// class LogoutDialog extends StatelessWidget {
//   const LogoutDialog({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final width = size.width;
//     final height = size.height;
//
//     return Stack(children: [
//       // Blurred Background
//       BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
//         child: Container(
//           width: width,
//           height: height,
//           color: Colors.transparent,
//         ),
//       ),
//       Dialog(
//         backgroundColor: Colors.white.withOpacity(0.95),
//         elevation: 0,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(width * 0.04),
//         ),
//         child: Container(
//           width: width * 0.8,
//           padding: EdgeInsets.all(width * 0.05),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 'Are you sure you want to log out?',
//                 style: TextStyle(
//                   fontSize: width * 0.04,
//                   fontWeight: FontWeight.w500,
//                   color: const Color(0xFF1F1F1F),
//                 ),
//               ),
//               SizedBox(height: width * 0.06),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   // No Button
//                   TextButton(
//                     onPressed: () => Navigator.pop(context, false),
//                     style: TextButton.styleFrom(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: width * 0.08,
//                         vertical: width * 0.025,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(width * 0.02),
//                         side: const BorderSide(
//                           color: Color(0xFF0F3CC9),
//                         ),
//                       ),
//                     ),
//                     child: Text(
//                       'No',
//                       style: TextStyle(
//                         fontSize: width * 0.038,
//                         fontWeight: FontWeight.w500,
//                         color: const Color(0xFF0F3CC9),
//                       ),
//                     ),
//                   ),
//
//                   // Yes Button
//                   ElevatedButton(
//                     onPressed: () => Navigator.pop(context, true),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFF0F3CC9),
//                       padding: EdgeInsets.symmetric(
//                         horizontal: width * 0.08,
//                         vertical: width * 0.025,
//                       ),
//                       elevation: 0,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(width * 0.02),
//                       ),
//                     ),
//                     child: Text(
//                       'Yes',
//                       style: TextStyle(
//                         fontSize: width * 0.038,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     ]);
//   }
// }
