import 'package:flutter/material.dart';

import '../Const/AppColor.dart';

class TimerResendSection extends StatelessWidget {
  final int timeLeft;
  final bool isVerified;
  final VoidCallback onResend;

  const TimerResendSection({
    Key? key,
    required this.timeLeft,
    required this.isVerified,
    required this.onResend,
  }) : super(key: key);

  String get timerText {
    int minutes = timeLeft ~/ 60;
    int seconds = timeLeft % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    if (isVerified) {
      return Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: onResend,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Text(
            "Resend Code",
            style: TextStyle(
              fontSize: 14,
              color: AppColors.linkUnderline,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          timerText,
          style: const TextStyle(
            color: AppColors.grey,
            fontSize: 14,
          ),
        ),
        TextButton(
          onPressed: timeLeft == 0 ? onResend : null,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            "Resend Code",
            style: TextStyle(
              fontSize: 14,
              color: timeLeft == 0 ? AppColors.linkUnderline : AppColors.grey,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
