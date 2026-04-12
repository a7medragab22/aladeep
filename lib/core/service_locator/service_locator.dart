import 'package:aladeep/core/service_locator/shared_service_locator/shared_service_locator.dart';
import 'package:aladeep/features/course/data/course_data_source.dart';
import 'package:aladeep/features/course/presentation/bloc/course_details_bloc.dart';
import 'package:aladeep/features/home/data/home_data_source.dart';
import 'package:aladeep/features/home/presentation/bloc/home_bloc.dart';
import 'package:aladeep/features/subscriptions/data/datasource/subscription_data_source.dart';
import 'package:aladeep/features/subscriptions/presentation/bloc/subscribe_bloc.dart';

import '../../features/auth/auth.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../extensions/extensions.dart';
import 'package:get_it/get_it.dart';

import '../../main.dart';
import '../helpers/helpers.dart';
import '../http/http.dart';

part 'init/init.dart';
part 'auth_service_locator/auth_service_locator.dart';
part 'home_service_locator/home_service_locator.dart';
part 'course_service_locator/course_service_locator.dart';
part 'subscription_service_locator/subscription_service_locator.dart';
