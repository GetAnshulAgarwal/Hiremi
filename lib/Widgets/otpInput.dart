import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Const/AppColor.dart';
import '../Model/enum.dart';

class OtpInputField extends StatelessWidget {
  final TextEditingController controller;
  final OtpStatus otpStatus;
  final ValueChanged<String> onChanged;

  const OtpInputField({
    Key? key,
    required this.controller,
    required this.otpStatus,
    required this.onChanged,
  }) : super(key: key);

  Color getIconColor() {
    switch (otpStatus) {
      case OtpStatus.normal:
        return AppColors.grey;
      case OtpStatus.error:
        return AppColors.primaryDark;
      case OtpStatus.success:
        return AppColors.success;
    }
  }

  Color getBorderColor() {
    switch (otpStatus) {
      case OtpStatus.normal:
        return AppColors.grey;
      case OtpStatus.error:
        return AppColors.primaryDark;
      case OtpStatus.success:
        return AppColors.success;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: getBorderColor(),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: getBorderColor(),
                  width: 1,
                ),
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/images/icon.svg',
                color: getIconColor(),
                width: 24,
                height: 24,
              ),
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              maxLength: 6,
              style: const TextStyle(
                fontSize: 16,
                letterSpacing: 8,
              ),
              decoration: const InputDecoration(
                hintText: 'XXXXXX',
                hintStyle: TextStyle(
                  color: AppColors.grey,
                  letterSpacing: 8,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                border: InputBorder.none,
                counterText: '',
              ),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
