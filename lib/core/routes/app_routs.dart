import 'package:aladeep/core/routes/app_routs_name.dart';
import 'package:aladeep/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

class AppRouts {
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutsName.homeView: (_) => HomeView(),
  };
}
