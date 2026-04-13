import 'dart:io';
import 'package:aladeep/core/enum/status.dart';
import 'package:aladeep/core/routes/app_routs_name.dart';
import 'package:aladeep/core/theme/app_colors.dart';
import 'package:aladeep/core/utils/app_drawer.dart';
import 'package:aladeep/core/utils/header.dart';
import 'package:aladeep/features/home/data/models/footer_link_model.dart';
import 'package:aladeep/features/home/presentation/sections/footer_section.dart';
import 'package:aladeep/features/subscriptions/presentation/bloc/subscribe_bloc.dart';
import 'package:aladeep/features/subscriptions/presentation/bloc/subscribe_event.dart';
import 'package:aladeep/features/subscriptions/presentation/bloc/subscribe_state.dart';
import 'package:aladeep/features/subscriptions/presentation/widgets/payment_method_grid.dart';
import 'package:aladeep/features/subscriptions/presentation/widgets/premium_summary_card.dart';
import 'package:aladeep/features/subscriptions/presentation/widgets/receipt_upload_area.dart';
import 'package:aladeep/features/subscriptions/presentation/widgets/section_title.dart';
import 'package:aladeep/features/subscriptions/presentation/widgets/subscribe_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:aladeep/core/service_locator/service_locator.dart';

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
      'payName': 'بنك الإنماء',
      'name': 'صلاح الدين فتحي عبدالعال',
      'number': 'SA9405000068205855779000',
      'qr': 'assets/images/qrblack.jpeg', // Using logo as placeholder for QR
    },
    {
      'payName': 'بنك الراجحي',
      'name': 'صلاح الدين فتحي عبدالعال',
      'number': 'SA6880000694608016626187',
      'qr': 'assets/images/qrblue.jpeg',
    },
    {
      'payName': 'STC Pay',
      'name': 'صلاح الدين فتحي عبدالعال',
      'number': '0540091992',
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
        endDrawer: const AppDrawer(),
        body: SafeArea(
          child: BlocConsumer<SubscribeBloc, SubscribeState>(
            listener: (context, state) {
              if (state.status == Status.success) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('تم إرسال الطلب بنجاح'),
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
              return Column(
                children: [
                  const Header(),
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 24.w,
                              vertical: 20.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                PremiumSummaryCard(
                                  isBundle: widget.isBundle,
                                  price: widget.price,
                                ),
                                SizedBox(height: 32.h),
                                const SectionTitle(
                                  title:
                                      '1. اختر طريقة الدفع الأنسب لك وحول المبلغ',
                                  icon: Icons.payments_outlined,
                                ),
                                SizedBox(height: 16.h),
                                PaymentMethodGrid(
                                  paymentMethods: _paymentMethods,
                                  selectedPaymentMethod: _selectedPaymentMethod,
                                  onMethodSelected: (methodName) => setState(
                                    () => _selectedPaymentMethod = methodName,
                                  ),
                                ),
                                SizedBox(height: 32.h),
                                const SectionTitle(
                                  title: '2. إرفاق إيصال التحويل',
                                  icon: Icons.cloud_upload_outlined,
                                ),
                                SizedBox(height: 16.h),
                                ReceiptUploadArea(
                                  receiptImage: _receiptImage,
                                  onPickImage: _pickImage,
                                ),
                                SizedBox(height: 32.h),
                                SubscribeSubmitButton(
                                  isLoading: state.status == Status.loading,
                                  onPressed: _receiptImage == null
                                      ? null
                                      : () {
                                          context.read<SubscribeBloc>().add(
                                                SubmitSubscription(
                                                  studentId: 27,
                                                  courseId:
                                                      widget.courseId ?? 0,
                                                  receiptImage: _receiptImage!,
                                                ),
                                              );
                                        },
                                ),
                                SizedBox(height: 40.h),
                              ],
                            ),
                          ),
                        ),
                        const FooterSection(),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
