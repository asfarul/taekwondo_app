import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taekwondo_app/configs/api.dart';
import 'package:taekwondo_app/models/join_club_response.dart';
import 'package:taekwondo_app/models/login.dart';
import 'package:taekwondo_app/models/meta.dart';
import 'package:taekwondo_app/models/register.dart';
import 'package:taekwondo_app/shared/shared.dart';
import 'package:taekwondo_app/utils/widget_helpers.dart';

part 'base_services.dart';
part 'config_services.dart';
part 'auth_services.dart';
part 'logging_interceptor.dart';
part 'club_services.dart';
part 'settings_services.dart';
part 'news_services.dart';
