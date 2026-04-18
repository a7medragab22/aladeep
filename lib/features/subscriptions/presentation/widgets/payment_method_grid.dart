import 'package:aladeep/core/enum/snack_bar_enum.dart';
import 'package:aladeep/core/extensions/extensions.dart';
import 'package:aladeep/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentMethodGrid extends StatelessWidget {
  final List<Map<String, String>> paymentMethods;
  final String selectedPaymentMethod;
  final Function(String) onMethodSelected;

  const PaymentMethodGrid({
    super.key,
    required this.paymentMethods,
    required this.selectedPaymentMethod,
    required this.onMethodSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: paymentMethods.map((method) {
        bool isSelected = selectedPaymentMethod == method['payName'];
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 20.h),
          padding: EdgeInsets.all(24.r),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(
              color: isSelected ? AppColors.primaryGold : Colors.grey.shade200,
              width: isSelected ? 2 : 1,
            ),
            boxShadow: [
              if (isSelected)
                BoxShadow(
                  color: AppColors.primaryGold.withAlpha(50),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
            ],
          ),
          child: InkWell(
            onTap: () => onMethodSelected(method['payName']!),
            child: Column(
              children: [
                // 1. QR Image
                Container(
                  padding: EdgeInsets.all(4.r),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryDarker),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: (method['qr'] != null && method['qr']!.isNotEmpty)
                      ? Image.asset(
                          method['qr']!,
                          height: 140.h,
                          fit: BoxFit.contain,
                        )
                      : Container(
                          decoration: BoxDecoration(
                            color: AppColors.primaryDark,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          padding: EdgeInsets.all(32.r),
                          child: FaIcon(
                            FontAwesomeIcons.wallet,
                            size: 80.sp,
                            color: Colors.white,
                          ),
                        ),
                ),
                SizedBox(height: 20.h),
                // 2. Method Name
                Text(
                  method['payName']!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                    color: AppColors.primaryDark,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  method['name']!,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.primaryDark,
                  ),
                ),
                SizedBox(height: 12.h),
                // 3. Account Number Box
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.grey.shade100),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.copy,
                          size: 20,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          Clipboard.setData(
                            ClipboardData(text: method['number']!),
                          );
                          context.showTopSnackBar(
                            message: 'تم نسخ الرقم',
                            type: SnackBarType.info,
                          );
                        },
                      ),
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.ltr,
                          method['number']!,
                          style: TextStyle(
                            color: AppColors.primaryDark,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
