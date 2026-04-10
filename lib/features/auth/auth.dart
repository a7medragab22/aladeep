import 'dart:async';
import 'dart:convert';

import '../../core/bloc/paginated_bloc/exports.dart';
import '../../core/enum/status.dart';
import '../../core/http/either.dart';
import '../../core/http/failure.dart';
import '../../core/http/http.dart';
import '../../core/params/params.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/helpers/cache_helper.dart';
import '../../core/helpers/helpers.dart';
import 'models/customer_model.dart';

part 'data_source/forget_password_data_source.dart';
part 'blocs/login/login_event.dart';
part 'blocs/login/login_bloc.dart';
part 'data_source/login_data_source.dart';
part 'blocs/logout/logout_event.dart';
part 'blocs/logout/logout_bloc.dart';
part 'data_source/logout_data_source.dart';
part 'blocs/register/register_event.dart';
part 'blocs/register/register_bloc.dart';
part 'data_source/register_data_source.dart';
part 'blocs/social_auth/social_auth_event.dart';
part 'blocs/social_auth/social_auth_bloc.dart';
part 'data_source/social_auth_data_source.dart';
part 'blocs/verify_otp/verify_otp_event.dart';
part 'blocs/verify_otp/verify_otp_bloc.dart';
part 'data_source/verify_otp_data_source.dart';
part 'blocs/reset_password/reset_password_event.dart';
part 'blocs/reset_password/reset_password_bloc.dart';
part 'data_source/reset_password_data_source.dart';
part 'blocs/profile_update/profile_update_event.dart';
part 'blocs/profile_update/profile_update_bloc.dart';
part 'data_source/profile_update_data_source.dart';
