import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';

class CircularBar extends StatelessWidget {
  final double progress;

  const CircularBar({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<double> valueNotifier =
        ValueNotifier<double>(progress.toDouble());

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth:
                    MediaQuery.of(context).size.width * 0.3, // Adjusted size
                maxHeight: MediaQuery.of(context).size.width * 0.3,
              ),
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: [Color(0xFF002ECC), Color(0xFF007DFF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds);
                },
                blendMode: BlendMode.srcIn,
                child: DashedCircularProgressBar.aspectRatio(
                  aspectRatio: 1,
                  valueNotifier: valueNotifier,
                  progress: progress,
                  maxProgress: 100,
                  corners: StrokeCap.round,
                  foregroundColor:
                      Colors.white, // Placeholder (overridden by ShaderMask)
                  backgroundColor: const Color(0xFF808080).withOpacity(0.15),
                  foregroundStrokeWidth: 8,
                  backgroundStrokeWidth: 8,
                  animation: true,
                  child: Center(
                    child: ValueListenableBuilder<double>(
                      valueListenable: valueNotifier,
                      builder: (_, value, __) => Text(
                        '${value.toInt()}%',
                        style: GoogleFonts.roboto(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              'Anshul Agarwal',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: MediaQuery.of(context).size.width * 0.04,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              height: MediaQuery.of(context).size.width * 0.06,
              width: MediaQuery.of(context).size.width * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFF0F3CC9)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.verified,
                    color: const Color(0xFF0F3CC9),
                    size: MediaQuery.of(context).size.width * 0.03,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.01,
                  ),
                  Text(
                    'Not Verified',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF0F3CC9),
                      fontWeight: FontWeight.w500,
                      fontSize: MediaQuery.of(context).size.width * 0.025,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
