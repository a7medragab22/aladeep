import 'dart:io';
import 'package:aladeep/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReceiptUploadArea extends StatelessWidget {
  final File? receiptImage;
  final VoidCallback onPickImage;

  const ReceiptUploadArea({
    super.key,
    required this.receiptImage,
    required this.onPickImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPickImage,
      child: Container(
        width: double.infinity,
        height: 180.h,
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: AppColors.primaryGold.withAlpha(80),
            style: BorderStyle.solid,
          ),
        ),
        child: receiptImage != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.file(receiptImage!, fit: BoxFit.cover),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(16.r),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.file_upload_outlined,
                      size: 32.sp,
                      color: AppColors.primaryGold,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'اضغط لرفع صورة الإيصال',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryDark,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'يجب أن تكون الصور واضحة (JPG, PNG)',
                    style: TextStyle(color: Colors.grey, fontSize: 11.sp),
                  ),
                ],
              ),
      ),
    );
  }
}
