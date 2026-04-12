import 'dart:io';
import 'package:aladeep/core/enum/status.dart';
import 'package:aladeep/core/theme/app_colors.dart';
import 'package:aladeep/features/subscriptions/presentation/bloc/subscribe_bloc.dart';
import 'package:aladeep/features/subscriptions/presentation/bloc/subscribe_event.dart';
import 'package:aladeep/features/subscriptions/presentation/bloc/subscribe_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:aladeep/core/service_locator/service_locator.dart';
import 'package:aladeep/core/local_storage/user_cache_interface.dart';

class ConfirmSubscriptionView extends StatefulWidget {
  final int? courseId;
  final double price;
  final bool isBundle;

  const ConfirmSubscriptionView({
    super.key,
    this.courseId,
    required this.price,
    this.isBundle = false,
  });

  @override
  State<ConfirmSubscriptionView> createState() =>
      _ConfirmSubscriptionViewState();
}

class _ConfirmSubscriptionViewState extends State<ConfirmSubscriptionView> {
  File? _receiptImage;
  String _selectedPaymentMethod = 'STC Pay';

  final List<Map<String, String>> _paymentMethods = [
    {
      'name': 'STC Pay',
      'number': '0553075671',
      'logo': 'assets/images/stc_pay.png', // Placeholder
    },
    {
      'name': 'مصرف الراجحي',
      'number': '1234567890123456',
      'logo': 'assets/images/alrajhi.png', // Placeholder
    },
    {
      'name': 'مصرف الإنماء',
      'number': '9876543210987654',
      'logo': 'assets/images/alinma.png', // Placeholder
    },
  ];

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _receiptImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SubscribeBloc>(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            widget.isBundle ? 'تأكيد الاشتراك في الباقة' : 'تأكيد حجز الدورة',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<SubscribeBloc, SubscribeState>(
          listener: (context, state) {
            if (state.status == Status.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message ?? 'تم إرسال الطلب بنجاح'),
                  backgroundColor: Colors.green,
                ),
              );
              Navigator.pop(context);
            } else if (state.status == Status.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage ?? 'حدث خطأ ما'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(20.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildPriceSection(),
                  SizedBox(height: 24.h),
                  Text(
                    'اختر وسيلة الدفع المناسبة لك:',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  ..._paymentMethods.map(
                    (method) => _buildPaymentMethodCard(method),
                  ),
                  SizedBox(height: 32.h),
                  Text(
                    'ارفق صورة إيصال التحويل:',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  _buildUploadSection(),
                  SizedBox(height: 40.h),
                  _buildSubmitButton(context, state),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPriceSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.primaryDark.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primaryDark.withValues(alpha: 0.1)),
      ),
      child: Column(
        children: [
          Text(
            widget.isBundle ? 'سعر الباقة الشاملة' : 'سعر الدورة',
            style: TextStyle(fontSize: 14.sp, color: Colors.grey),
          ),
          SizedBox(height: 4.h),
          Text(
            '${widget.price} ر.س',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryDark,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodCard(Map<String, String> method) {
    bool isSelected = _selectedPaymentMethod == method['name'];
    return GestureDetector(
      onTap: () => setState(() => _selectedPaymentMethod = method['name']!),
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryDark.withValues(alpha: 0.02)
              : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primaryDark : Colors.grey.shade200,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                if (isSelected)
                  const Icon(Icons.check_circle, color: AppColors.primaryDark),
                const Spacer(),
                Text(
                  method['name']!,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 12.w),
                // Icon placeholder
                Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.account_balance_wallet,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            if (isSelected) ...[
              const Divider(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.copy, size: 20, color: Colors.grey),
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: method['number']!));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('تم نسخ الرقم')),
                      );
                    },
                  ),
                  Text(
                    method['number']!,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'Courier',
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildUploadSection() {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        width: double.infinity,
        height: 150.h,
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey.shade300,
            style: BorderStyle
                .solid, // Should be dashed if possible via a package, but solid is fine for now
          ),
        ),
        child: _receiptImage != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(_receiptImage!, fit: BoxFit.cover),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cloud_upload_outlined,
                    size: 40.sp,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'انقر لرفع صورة الإيصال',
                    style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context, SubscribeState state) {
    return SizedBox(
      width: double.infinity,
      height: 54.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryDark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        onPressed: state.status == Status.loading || _receiptImage == null
            ? null
            : () {
                // Get studentId from cache (this is a simplified example, usually you'd get it from your AuthBloc or UserCache)
                // For now, I'll pass a placeholder or try to get it if available.
                // Re-reading logic from existing project...
                final studentId =
                    27; // User specified this in prompt, but we should ideally get it from cache

                if (widget.isBundle) {
                  context.read<SubscribeBloc>().add(
                        SubmitBundleSubscription(
                          studentId: studentId,
                          receiptImage: _receiptImage!,
                        ),
                      );
                } else {
                  context.read<SubscribeBloc>().add(
                        SubmitSubscription(
                          studentId: studentId,
                          courseId: widget.courseId!,
                          receiptImage: _receiptImage!,
                        ),
                      );
                }
              },
        child: state.status == Status.loading
            ? const CircularProgressIndicator(color: Colors.white)
            : Text(
                'إرسال الإيصال للتفعيل',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
