// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class TopBar extends StatelessWidget {
//   const TopBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
//       color: const Color(0xFF0B1A2B),
//       child: Column(
//         children: [
//           SizedBox(height: 16.h),
//           Row(
//             children: [
//               _buildIcon(Icons.menu),
//               Spacer(flex: 1),
//               BlocBuilder<CartCubit, CartState>(
//                 builder: (context, state) {
//                   final int cartQuantity = state is CartLoaded
//                       ? state.items.fold<int>(
//                           0,
//                           (sum, item) => sum + item.quantity,
//                         )
//                       : 0;

//                   return Stack(
//                     clipBehavior: Clip.none,
//                     children: [
//                       _buildItem(
//                         Icons.shopping_cart,
//                         "السلة",
//                         onPressed: () {
//                           Navigator.pushNamed(context, AppRoute.cartView);
//                         },
//                       ),
//                       if (cartQuantity > 0)
//                         Positioned(
//                           top: -4,
//                           right: -4,
//                           child: Container(
//                             padding: const EdgeInsets.all(4),
//                             decoration: const BoxDecoration(
//                               color: Colors.red,
//                               shape: BoxShape.circle,
//                             ),
//                             constraints: const BoxConstraints(
//                               minWidth: 20,
//                               minHeight: 20,
//                             ),
//                             child: Text(
//                               '$cartQuantity',
//                               textAlign: TextAlign.center,
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                     ],
//                   );
//                 },
//               ),
//               Spacer(flex: 1),
//               _buildItem(
//                 Icons.notifications,
//                 "تنبيهات",
//                 onPressed: () {
//                   Navigator.pushNamed(context, AppRoute.notificationsView);
//                 },
//               ),
//               Spacer(flex: 1),
//               _buildItem(
//                 Icons.favorite,
//                 "المفضلة",
//                 onPressed: () {
//                   Navigator.pushNamed(context, AppRoute.favoritesView);
//                 },
//               ),
//               Spacer(flex: 1),
//               _buildItem(
//                 Icons.login,
//                 "دخول",
//                 onPressed: () {
//                   Navigator.pushNamed(context, AppRoute.logInView);
//                 },
//               ),
//               Spacer(flex: 4),
//             ],
//           ),
//           SizedBox(height: 16.h),
//           CustomSearchBar(),
//           SizedBox(height: 16.h),
//         ],
//       ),
//     );
//   }

//   Widget _buildItem(
//     IconData icon,
//     String text, {
//     required VoidCallback onPressed,
//   }) {
//     return Column(
//       children: [
//         IconButton(
//           onPressed: onPressed,

//           icon: Icon(icon, color: Colors.amber, size: 18.sp),
//         ),
//         SizedBox(height: 5.h),
//         Text(
//           text,
//           style: TextStyle(color: Colors.amber, fontSize: 14.sp),
//         ),
//       ],
//     );
//   }

//   Widget _buildIcon(IconData icon) {
//     return Container(
//       padding: EdgeInsets.all(6.w),
//       decoration: BoxDecoration(
//         color: Colors.white12,
//         borderRadius: BorderRadius.circular(8.r),
//       ),
//       child: Icon(icon, color: Colors.white),
//     );
//   }
// }
